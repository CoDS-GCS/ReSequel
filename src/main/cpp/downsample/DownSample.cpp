#include "DownSample.h"
#include <iostream>
#include <thread>
#include <algorithm>
#include <fstream>
#include <queue>
#include <unordered_set>

using json = nlohmann::json;
namespace fs = std::filesystem;

DownSample::DownSample(const Config& config, const CatalogInfo& catalog_info, const std::vector<std::string>& tables,
    const std::string& schema_relation_path, float ratio, const OutputFormat& output_format)
        : src_db(nullptr),
          src_con(src_db),
          catalog(catalog_info),
          config(config),
          tables(tables),
          target_rows_ratio_per_root(ratio),
          output_format(output_format){
            attach_source_database(config.getDBConnectionString());
            load_schema_from_file(schema_relation_path);
}


DownSample::~DownSample() = default;

void DownSample::attach_source_database(const std::string& connection_str) {
    src_con.Query("INSTALL postgres_scanner; LOAD postgres_scanner;");
    src_con.Query("ATTACH '" + connection_str + "' AS pg_src (TYPE POSTGRES_SCANNER);");
    if (!preserve_order) {
        src_con.Query("SET preserve_insertion_order = false;");
    }
}

std::vector<DownSample::Relation> DownSample::discover_relations() {
    auto res = src_con.Query(R"(
        SELECT
            tc.table_name AS child_table,
            kcu.column_name AS child_col,
            ccu.table_name AS parent_table,
            ccu.column_name AS parent_col
        FROM information_schema.table_constraints tc
        JOIN information_schema.key_column_usage kcu
            ON tc.constraint_name = kcu.constraint_name
        JOIN information_schema.constraint_column_usage ccu
            ON ccu.constraint_name = tc.constraint_name
        WHERE tc.constraint_type = 'FOREIGN KEY'
          AND tc.table_schema = 'public'
        ORDER BY parent_table, child_table
    )");

    std::vector<Relation> relations;
    for (idx_t i = 0; i < res->RowCount(); ++i) {
        relations.push_back({
            res->GetValue(0,i).ToString(),
            res->GetValue(1,i).ToString(),
            res->GetValue(2,i).ToString(),
            res->GetValue(3,i).ToString()
        });
    }
    return relations;
}

std::vector<DownSample::SampleSet> DownSample::build_sample_sets(const std::vector<Relation>& relations) {
    std::unordered_map<std::string, std::vector<std::string>> graph;
    std::unordered_set<std::string> has_parent;
    std::unordered_set<std::string> requested_set(tables.begin(), tables.end());

    for (const auto& r : relations) {
        if (requested_set.count(r.child_table) || requested_set.count(r.parent_table)) {
            graph[r.parent_table].push_back(r.child_table);
            has_parent.insert(r.child_table);
        }
    }

    std::vector<SampleSet> sets;
    for (const auto& root : tables) {
        if (has_parent.count(root)) continue;  // not a root

        SampleSet set;
        set.root_table = root;

        std::queue<std::string> q;
        std::unordered_set<std::string> visited;
        q.push(root);
        visited.insert(root);

        while (!q.empty()) {
            auto tbl = q.front(); q.pop();
            set.tables.push_back(tbl);

            for (const auto& child : graph[tbl]) {
                if (visited.insert(child).second) {
                    q.push(child);
                }
            }
        }
        sets.push_back(std::move(set));
    }
    return sets;
}

void DownSample::sample_table_to_file(const std::string &table_name, const std::string &output_path) {
    std::string format_str, compression_str;

    switch (output_format) {
        case OutputFormat::PARQUET:
            format_str = "PARQUET";
            compression_str = "ZSTD, COMPRESSION_LEVEL 3";
        break;
        // ... other formats
    }

    std::string sql = "COPY(SELECT * FROM pg_src.public."+table_name+" ORDER BY random() LIMIT 100) TO '"+output_path+"' (FORMAT "+format_str+", "+compression_str+")";
//----------------------------------------------
    // size_t rows = 0;
    //     for (const auto& table : tables) {
    //         std::string sql = "COPY (SELECT * FROM pg_src.public." + table +
    //                           " ORDER BY random() LIMIT " + std::to_string(100) +
    //                           ") TO 'INSERT INTO public." + table + " VALUES' (FORMAT CSV, HEADER FALSE)";
    //
    //         auto res = src_con.Query(sql);
    //         if (res->HasError()) {
    //             std::cerr << "[ERROR] " << table << ": " << res->GetError() << "\n";
    //             continue;
    //         }
    //         rows += 100; //downsample_cfg.target_rows_per_root;
    //     }
    //     total_rows_inserted_ += rows;
    // }
}


void DownSample::parallel_sample(const std::vector<SampleSet>& sets) {
    // std::vector<std::future<void>> futures;
    // futures.reserve(sets.size());
    //
    // for (const auto& set : sets) {
    //     futures.push_back(std::async(std::launch::async, [this, &set]() {
    //         sample_and_insert(set);
    //     }));
    // }
    //
    // for (auto& f : futures) f.wait();
}

bool DownSample::load_schema_from_file(const std::string& filename) {
    try {
        std::ifstream file(filename);
        if (!file.is_open()) { std::cerr << "Cannot open schema file: " << filename << "\n"; return false; }

        json schema_json;
        file >> schema_json;

        if (!schema_json.contains("dependency") || !schema_json["dependency"].is_object()) {
            std::cerr << "JSON missing or invalid 'dependency' section\n";
            return false;
        }

        schema_map.clear();
        for (auto it = schema_json["dependency"].begin(); it != schema_json["dependency"].end(); ++it) {
            std::string table_name = it.key();
            const json& table_info = it.value();

            TableSchema table;
            table.table_name = table_name;

            if (table_info.contains("primary_key") && table_info["primary_key"].is_array()) {
                for (const auto& pk_item : table_info["primary_key"]) {
                    if (pk_item.is_string()) {
                        table.primary_keys.push_back(pk_item.get<std::string>());
                    }
                }
            }

            if (table_info.contains("foreign_key") && table_info["foreign_key"].is_array()) {
                for (const auto& fk : table_info["foreign_key"]) {
                    if (!fk.is_object()) continue;

                    SchemaRelation relation;
                    relation.child_table = table_name;

                    try {
                        relation.child_col = safe_get_string(fk, "column_name");
                        relation.parent_table = safe_get_string(fk, "foreign_table_name");
                        relation.parent_col = safe_get_string(fk, "foreign_column_name");
                    } catch (const json::exception& e) {
                        std::cerr << "Skipping invalid FK in " << table_name << ": " << e.what() << "\n";
                        continue;
                    }

                    // ✅Validate before adding
                    if (!relation.child_col.empty() && !relation.parent_table.empty() && !relation.parent_col.empty()) {
                        table.foreign_keys.push_back(std::move(relation));
                    }
                }
            }
            schema_map[table_name] = std::move(table);
        }
        return true;
    }
    catch (const json::exception& e) { std::cerr << "JSON parse error: " << e.what() << "\n"; return false; }
    catch (const std::exception& e) { std::cerr << "General error: " << e.what() << "\n"; return false; }
    }

const DownSample::TableSchema * DownSample::get_table_schema(const std::string &table_name) const {
    auto it = schema_map.find(table_name);
    return (it != schema_map.end()) ? &it->second : nullptr;
}

std::string DownSample::find_central_table(const std::vector<std::string> &table_subset) const {
    if (table_subset.empty()) { throw std::invalid_argument("table_subset cannot be empty");}

    // FAST PATH: Single table = central table
    if (table_subset.size() == 1) { return table_subset[0];}

    // CALCULATE DEPENDENCY SCORES FROM JSON SCHEMA
    auto dependency_count = calculate_dependency_scores(table_subset);

    if (dependency_count.empty()) {
        std::cout << "No FK dependencies found, using first table: " << table_subset[0] << "\n";
        return table_subset[0];  // Fallback
    }

    // FIND TABLE WITH MAXIMUM DEPENDENCIES
    auto max_it = std::max_element(dependency_count.begin(), dependency_count.end(),
        [](const auto& a, const auto& b) { return a.second < b.second; }
    );

    std::string central_table = max_it->first;
    size_t max_score = max_it->second;

    std::cout << "Central table found: '" << central_table << "' (dependency score: " << max_score << ")\n";

    return central_table;
}

std::unordered_map<std::string, size_t> DownSample::calculate_dependency_scores(const std::vector<std::string>& table_subset) const {
    std::unordered_map<std::string, size_t> dependency_count;
    std::unordered_set<std::string> subset_set(table_subset.begin(), table_subset.end());

    // INITIALIZE ALL TABLES
    for (const auto& table : table_subset) {
        dependency_count[table] = 0;
    }

    // SINGLE LOOP: COUNT ALL FKs IN SUBSET
    for (const auto& [child_table, table_schema] : schema_map) {
        if (subset_set.count(child_table) == 0) continue;

        // COUNT OUTGOING FKs (child_table → parent_table)
        for (const auto& fk : table_schema.foreign_keys) {
            if (subset_set.count(fk.parent_table)) {
                dependency_count[child_table] += 1;  // ✅ OUTGOING
            }
        }
    }

    // SECOND PASS: COUNT INCOMING FKs (others → target_table)
    for (const auto& [child_table, table_schema] : schema_map) {
        if (subset_set.count(child_table) == 0) continue;

        for (const auto& fk : table_schema.foreign_keys) {
            // If parent_table is in subset, child_table points TO it
            if (subset_set.count(fk.parent_table)) {
                dependency_count[fk.parent_table] += 1;  // INCOMING to parent_table
            }
        }
    }

    return dependency_count;
}

std::string DownSample::safe_get_string(const json &j, const std::string &key) const {
    if (j.contains(key) && j[key].is_string()) {
        try {
            return j[key].get<std::string>();
        } catch (...) {}
    }
    return "";
}

// GET PARENT TABLES (Tables referenced by child)
std::vector<std::string> DownSample::get_parent_tables(const std::string& child_table) const {
    std::vector<std::string> parents;
    if (auto it = schema_map.find(child_table); it != schema_map.end()) {
        for (const auto& relation : it->second.foreign_keys) {
            parents.push_back(relation.parent_table);
        }
    }
    return parents;
}
// ------------------------------------------------
std::string DownSample::build_row_where_clause(const std::vector<std::string>& pk_cols) const {
    std::string where_clause;
    where_clause.reserve(128);  // Pre-allocate for performance

    where_clause += "ROW(";

    for (size_t i = 0; i < pk_cols.size(); ++i) {
        if (i > 0) { where_clause += ", ";}
        where_clause += "\"";
        where_clause += pk_cols[i];
        where_clause += "\"";
    }

    where_clause += ")";
    return where_clause;
}

// BUILD VALUES CLAUSE: (ROW(1,1), ROW(2,2), ROW(1000,5))
std::string DownSample::build_composite_values_clause(const std::vector<std::vector<std::string>>& pk_tuples) const {
    std::string values_clause;
    values_clause.reserve(pk_tuples.size() * 50);  // Pre-allocate

    values_clause += "(";

    for (size_t i = 0; i < pk_tuples.size(); ++i) {
        if (i > 0) {values_clause += ", ";}

        values_clause += "ROW(";
        for (size_t j = 0; j < pk_tuples[i].size(); ++j) {
            if (j > 0) {
                values_clause += ", ";
            }
            values_clause += pk_tuples[i][j];
        }
        values_clause += ")";
    }

    values_clause += ")";
    return values_clause;
}

std::string DownSample:: build_composite_set_values_clause(const std::vector<std::vector<std::string>> &fk_tuples) const {
    std::string values_clause;

    // remove duplicates
    int str_size = 0;
    std::set<std::string> fk_set;
    for (const auto & fk_tuple : fk_tuples) {
        std::string vc = "(";
        for (size_t j = 0; j < fk_tuple.size(); ++j) {
            if (j > 0) { vc += ", ";}
            vc += fk_tuple[j];
        }
        vc+= ")";
        fk_set.insert(vc);
        str_size += vc.length();
    }

    values_clause.reserve(str_size + fk_set.size()*4 + 5);  // Pre-allocate
    values_clause += "(";

    size_t i = 0;
    for (std::string element : fk_set) {
        if (i > 0) { values_clause += ", ";}
        values_clause += "ROW"+element;
        i++;
    }
    values_clause += ")";
    return values_clause;
}


std::string DownSample::get_pk_column(const std::string& table_name) const {
    if (const auto* schema = get_table_schema(table_name)) {
        if (!schema->primary_keys.empty()) {
            return schema->primary_keys[0];
        }
    }
    return "id";  // Default fallback
}

// Get all PK columns (composite support)
std::vector<std::string> DownSample::get_pk_columns(const std::string& table_name) const {
    if (const auto* schema = get_table_schema(table_name)) {
        if (!schema->primary_keys.empty()) {
            return schema->primary_keys;
        }
    }
    return {"id"};
}

 std::unordered_map<std::string, std::vector<DownSample::SchemaRelation>> DownSample::get_fk_columns(const std::string& table) const {
    std::unordered_map<std::string, std::vector<SchemaRelation>>  result;
    if (auto it = schema_map.find(table); it != schema_map.end()) {
        for (const auto& relation : it->second.foreign_keys) {
            result[relation.parent_table].push_back(relation);
        }
    }
    return result;
}

// PK type classification
DownSample::PKType DownSample::classify_pk_type(const std::string& table) const {
    if (const auto* schema = get_table_schema(table)) {
        return schema->primary_keys.size() == 1 ? PKType::SINGLE : PKType::COMPOSITE;
    }
    return PKType::SINGLE;
}

const std::tuple<std::string, std::unordered_map<std::string, std::vector<DownSample::SchemaRelation>>, std::unordered_map<std::string,
std::vector<int>>> DownSample::get_project_cols(const std::string &table) const {
    int fk_index;
    std::string pk_col;
    if (classify_pk_type(table) == PKType::SINGLE) {
        fk_index = 1;
        pk_col = get_pk_column(table);
    }
    else {
        auto pk_cols = get_pk_columns(table);
        for (size_t i = 0; i < pk_cols.size(); ++i) {
            if (i > 0) pk_col += ", ";
            pk_col += pk_cols[i];
        }
        fk_index = pk_cols.size();
    }

    std::unordered_map<std::string, std::vector<SchemaRelation>> fk_cols = get_fk_columns(table);
    std::unordered_map<std::string, std::vector<int>> fk_indexes;

    int str_size = pk_col.length();
    for (const auto & tbl: fk_cols) {
        for (const auto & col: tbl.second) {
            str_size += col.child_col.length() + 1;
        }
    }

    std::string project_cols;
    project_cols.reserve(str_size + 32);
    project_cols = pk_col;

    for (const auto & tbl: fk_cols) {
        for (const auto & col: tbl.second) {
            project_cols += "," + col.child_col;
            fk_indexes[tbl.first].push_back(fk_index++);
        }
    }

    return {project_cols, fk_cols, fk_indexes};
}

bool DownSample::cache_fk_values(const std::unique_ptr<duckdb::MaterializedQueryResult> &result,
    const std::unordered_map<std::string, std::vector<SchemaRelation>> &fk_cols,
    const std::unordered_map<std::string, std::vector<int>> &fk_indexes) const {

    if (!result->HasError()) {
        for (const auto & tbl: fk_indexes) {
            if (fk_cache.find(tbl.first) != fk_cache.end()) {
                continue;
            }
            if (tbl.second.size() == 1) { // single FK
                std::set<std::string> fk_set;
                int str_length = 0;
                for (idx_t i = 0; i < result->RowCount(); ++i) {
                    std::string tvalue = result->GetValue(0, i).ToString();
                    str_length += tvalue.length() + 1;
                    fk_set.insert(std::move(tvalue));
                }

                std::string in_clause;
                in_clause.reserve(str_length + 2);
                in_clause = "(";
                size_t i = 0;
                for (std::string element : fk_set) {
                    if (i > 0) { in_clause += ", ";}
                    in_clause += element;
                    i++;
                }
                in_clause += ")";

                fk_cache.emplace(tbl.first, std::make_pair(fk_cols.at(tbl.first)[0].parent_col, std::move(in_clause)));
            }
            else {
                std::vector<std::vector<std::string>> fk_tuples;
                for (idx_t i = 0; i < result->RowCount(); ++i) {
                    std::vector<std::string> tuple;
                    tuple.reserve(tbl.second.size());
                    for (size_t col_idx : tbl.second) {
                        tuple.push_back(result->GetValue(col_idx, i).ToString());
                    }
                    fk_tuples.push_back(tuple);
                }
                std::vector<std::string> project_cols;
                for (const auto & fkcols: fk_cols.at(tbl.first)) {
                    project_cols.push_back(fkcols.parent_col);
                }
                fk_cache.emplace(tbl.first, std::make_pair(
                    build_row_where_clause(project_cols),
                    build_composite_set_values_clause(fk_tuples)
                ));
            }
        }
    }
    else {
        std::cerr << "Failed  Cache: " << result->GetError() << "\n";
    }
    return true;
}

std::vector<std::string> DownSample::sample_single_pk(const std::string& table, size_t sample_size) const {
    auto[project_cols, fk_cols, fk_indexes] = get_project_cols(table);
    std::string sql;
    sql.reserve(100 + project_cols.length());
    sql = "SELECT \"";
    sql += project_cols;
    sql += "\" FROM pg_src.public.\"";
    sql += table;
    sql += "\" ORDER BY RANDOM() LIMIT ";
    sql += std::to_string(sample_size);

    auto result = src_con.Query(sql);
    std::vector<std::string> pks;
    if (!result->HasError()) {
        pks.reserve(result->RowCount());
        for (idx_t i = 0; i < result->RowCount(); ++i) {
            pks.emplace_back(result->GetValue(0, i).ToString());
        }
    }

    // cache results
    cache_fk_values(result, fk_cols, fk_indexes);
    return pks;
}

// single PK table saving
bool DownSample::save_single_pk_table(const std::string& table_name, const std::vector<std::string>& pk_values) const {
    if (pk_values.empty()) return false;

    std::string pk_col = get_pk_column(table_name);

    // Pre-allocate IN clause (3x faster)
    std::string in_clause;
    in_clause.reserve(pk_values.size() * 10 + 32);
    in_clause = "('";

    for (size_t i = 0; i < pk_values.size(); ++i) {
        if (i > 0) in_clause += "','";
        in_clause += pk_values[i];
    }
    in_clause += "')";

    std::string query;
    query.reserve(256);
    query = "SELECT * FROM pg_src.public.\"";
    query += table_name;
    query += "\" WHERE \"";
    query += pk_col;
    query += "\" IN ";
    query += in_clause;

    return save_query_to_parquet(query, table_name);
}

// parent table sampling (single FK)
bool DownSample::sample_parent(const std::string& parent_table) const {

    if (fk_cache.find(parent_table) == fk_cache.end()) { return false; }
    std::pair<std::string, std::string> table_fk_values = fk_cache[parent_table];

    std::cout<<"+++++++++++++++++++++++++++++++++++++++++++++++++++++" << parent_table << std::endl;
    std::cout<< table_fk_values.first<<std::endl;
    std::cout<< table_fk_values.second<<std::endl;
    std::cout<<"========================================================= \n";

    auto[project_cols, fk_cols, fk_indexes] = get_project_cols(parent_table);

    std::string query;
    query.reserve(project_cols.length() + 50);
    query = "SELECT * FROM pg_src.public.\"";
    query += parent_table;
    query += "\" WHERE \"";
    query += table_fk_values.first;
    query += "\" IN ";
    query += table_fk_values.second;

    auto result = src_con.Query(query);

    // cache results
    cache_fk_values(result, fk_cols, fk_indexes);

    return save_query_to_parquet(query, parent_table);
}

std::vector<std::vector<std::string>> DownSample::sample_composite_pk(const std::string& table, size_t sample_size) const {
    auto pk_cols = get_pk_columns(table);
    auto[col_list, fk_cols, fk_indexes] = get_project_cols(table);

    std::string sql = "SELECT "+col_list+" FROM pg_src.public."+table+" ORDER BY RANDOM() LIMIT "+std::to_string(sample_size);
    auto result = src_con.Query(sql);
    std::vector<std::vector<std::string>> pk_tuples;

    if (!result->HasError()) {
        pk_tuples.reserve(result->RowCount());
        for (idx_t i = 0; i < result->RowCount(); ++i) {
            std::vector<std::string> tuple;
            tuple.reserve(pk_cols.size());
            for (size_t col_idx = 0; col_idx < pk_cols.size(); ++col_idx) {
                tuple.push_back(result->GetValue(col_idx, i).ToString());
            }
            pk_tuples.push_back(std::move(tuple));
        }
        std::cout << "Sampled " << pk_tuples.size() << " composite PKs from " << table << "\n";
    }

    // cache results
    cache_fk_values(result, fk_cols, fk_indexes);

    return pk_tuples;
}

bool DownSample::save_sampled_table_composite(const std::string& table_name, const std::vector<std::vector<std::string>>& pk_tuples) const {
    if (pk_tuples.empty()) return false;

    auto pk_cols = get_pk_columns(table_name);

    std::string where_clause = build_row_where_clause(pk_cols);
    std::string values_clause = build_composite_values_clause(pk_tuples);

    std::string query;
    query.reserve(512);
    query += "SELECT * FROM pg_src.public.\"";
    query += table_name;
    query += "\" WHERE ";
    query += where_clause;
    query += " IN ";
    query += values_clause;
    return save_query_to_parquet(query, table_name);
}

bool DownSample::downsample_central_graph(const std::string& central_table, const std::vector<std::string>& table_subset) {
    try {
        std::unordered_set<std::string> processed_tables;

        // Classify and sample central table
        PKType central_pk_type = classify_pk_type(central_table);
        std::cout << "   PK Type: " << (central_pk_type == PKType::SINGLE ? "SINGLE" : "COMPOSITE") << "\n";
        int sample_count = catalog.profile[central_table].begin()->second.count * target_rows_ratio_per_root;
        if (sample_count < 50) { sample_count = 50; }

        std::vector<std::string> central_pks;
        if (central_pk_type == PKType::SINGLE) {
            central_pks = sample_single_pk(central_table, sample_count);
            save_single_pk_table(central_table, central_pks);
        } else {
            auto composite_pks = sample_composite_pk(central_table, sample_count);
            save_sampled_table_composite(central_table, composite_pks);
        }

        if (central_pks.empty() && central_pk_type == PKType::SINGLE) {
            std::cerr << "No data from central table\n";
            return false;
        }

        processed_tables.insert(central_table);

        // BFS traversal with parallel processing
        std::queue<std::string> table_queue;
        table_queue.push(central_table);

        std::cout<< ">>>>>>>>>>>>>>>>>>>> "<< fk_cache.size()<<std::endl;

        while (!table_queue.empty()) {
            std::string current_table = table_queue.front();
            table_queue.pop();

            std::cout << "Processing: " << current_table << "\n";
            auto parent_tables = get_parent_tables(current_table);

            // ✅ PARALLEL PROCESSING WITH CACHED PKs
            std::vector<std::future<bool>> futures;
            futures.reserve(parent_tables.size());

            for (const auto& parent_table : parent_tables) {
                if (processed_tables.count(parent_table)) continue;

                std::cout << "Child: " << parent_table << "\n";

                // PASS CACHED parent_pks TO ASYNC
                // auto future = std::async(std::launch::async, [this, parent_table]() {
                //         return this->sample_parent(parent_table);
                // });

                sample_parent(parent_table);

                // futures.push_back(std::move(future));
                processed_tables.insert(parent_table);
                table_queue.push(parent_table);
            }

            // WAIT FOR RESULTS
            for (auto& future : futures) {
                bool success = future.get();  // ✅ GET RESULTS
                if (success) { std::cout << "✅ Child sampling completed\n";}
            }
        }
        return true;

        } catch (const std::exception& e) {
            std::cerr << "downsampling failed: " << e.what() << "\n";
            return false;
        }
}

bool DownSample::save_query_to_parquet(const std::string& query, const std::string& table_name) const {
    std::string output_path = output_dir +"/"+table_name+".parquet";
    std::filesystem::create_directories(output_dir);

    std::string copy_sql = "COPY ("+query+") TO '"+output_path+"' (FORMAT PARQUET, COMPRESSION ZSTD, COMPRESSION_LEVEL 3)";
    auto result = src_con.Query(copy_sql);
    bool success = !result->HasError();

    if (success) {
        std::cout << "Saved " << table_name << " → " << output_path << "\n";
    } else {
        std::cerr << "Failed to save " << table_name << ": " << result->GetError() << "\n";
    }
    return success;
}

bool DownSample::run(int sample_id) {

    std::string central_table = find_central_table(tables);
    downsample_central_graph(central_table, tables);
    // try {
    //     auto relations = discover_relations();
    //     sample_sets_ = build_sample_sets(relations);
    //     std::cout << "Found " << sample_sets_.size() << " independent sample sets\n";
    //     parallel_sample(sample_sets_);
    //     return true;
    // }
    // catch (const std::exception& e) {
    //     std::cout<<e.what()<<"\n";
    //     return false;
    // }
    return false;
}


