#include "PostgresCatalogBuilder.h"
#include <regex>
#include <duckdb.hpp>
#include <string>


namespace fs = std::filesystem;
namespace minidb {
    CatalogInfo PostgresCatalogBuilder::build() {
        auto table_names = getTableNames();
        auto [columns, indexes, deps] = getSchema(table_names);
        auto profile = computeProfile(table_names);

        CatalogInfo catalog;
        catalog.dataset_name = config.getDatabaseName();
        catalog.number_of_tables = table_names.size();
        catalog.table_names = std::move(table_names);
        catalog.table_indexes = std::move(indexes);
        catalog.columns = std::move(columns);
        catalog.dependency = std::move(deps);
        catalog.profile = std::move(profile);

        if (!save_path.empty()) {
            catalog.save(save_path);
        }

        return catalog;
    }

    // Get table names
    std::vector<std::string> PostgresCatalogBuilder::getTableNames() {
        auto result = connection->execute(config.getProfileQueries().table_list);
        std::vector<std::string> tables;
        tables.reserve(result.RowCount());
        for (size_t r = 0; r < result.RowCount(); ++r) {
            tables.emplace_back(result.GetValue(0, r).ToString());
        }
        return tables;
    }

    // Parallel schema fetch
    std::tuple<
        std::unordered_map<std::string, std::vector<ColumnInfo>>,
        std::unordered_map<std::string, std::vector<std::string>>,
        std::unordered_map<std::string, TableDependency>
    >
    PostgresCatalogBuilder::getSchema(const std::vector<std::string>& tables) {

        std::unordered_map<std::string, std::vector<ColumnInfo>> columns;
        std::unordered_map<std::string, std::vector<std::string>> indexes;
        std::unordered_map<std::string, TableDependency> deps;

        struct ColumnResult   { std::string table; std::vector<ColumnInfo> columns; };
        struct IndexResult    { std::string table; std::vector<std::string> indexes; };
        struct DepResult      { std::string table; TableDependency deps; };

        std::vector<std::future<ColumnResult>> col_futs;
        std::vector<std::future<IndexResult>>  idx_futs;
        std::vector<std::future<DepResult>>    dep_futs;

        for (const auto& table : tables) {
            // 1. Columns
            col_futs.push_back(threadPool.enqueue([&, table] {
                 PostgresConnection& con = ThreadPool::get_current_connection(); //PostgresConnection(config.getDBConnectionString());
                 size_t pos_1 = config.getProfileQueries().table_schema.find("$1");
                 std::string col_sql = config.getProfileQueries().table_schema.replace(pos_1, 2, table);
                 auto col_res = con.execute(col_sql);
                 std::vector<ColumnInfo> cols;
                 cols.reserve(col_res.RowCount());
                 for (size_t r = 0; r < col_res.RowCount(); ++r) {
                     cols.push_back({
                         col_res.GetValue(0, r).ToString(),
                         col_res.GetValue(1, r).ToString()
                     });
                 }
                con.disconnect();

                return ColumnResult{ table, cols };
            }));

            // 2. Indexes
            idx_futs.push_back(threadPool.enqueue([&, table] {
                PostgresConnection& con = ThreadPool::get_current_connection();
                size_t   pos_1 = config.getProfileQueries().table_indexes.find("$1");
                std::string idx_sql = config.getProfileQueries().table_indexes.replace(pos_1, 2, table);

                auto idx_res = con.execute(idx_sql);
                std::vector<std::string> idx_list;
                for (size_t r = 0; r < idx_res.RowCount(); ++r) {
                    std::string def = idx_res.GetValue(0, r).ToString();
                    std::smatch m;
                    if (std::regex_search(def, m, std::regex(R"(\((.*)\))"))) {
                        idx_list.push_back(m[1].str());
                    }
                }
                    return IndexResult{ table, idx_list };
            }));

            // 3. Dependencies
            dep_futs.push_back(threadPool.enqueue([&, table] {
                PostgresConnection& con = ThreadPool::get_current_connection();
                size_t pos_1 = config.getProfileQueries().table_PK_FK.find("$1");
                std::string fk_sql = config.getProfileQueries().table_PK_FK.replace(pos_1, 2, table);
                auto fk_res = con.execute(fk_sql);
                TableDependency dep;
                for (size_t r = 0; r < fk_res.RowCount(); ++r) {
                    std::string type = fk_res.GetValue(4, r).ToString();
                    if (type == "PRIMARY KEY") {
                        dep.primary_key.push_back(fk_res.GetValue(1, r).ToString());
                    } else if (type == "FOREIGN KEY") {
                        dep.foreign_keys.push_back({
                            fk_res.GetValue(1, r).ToString(),
                            fk_res.GetValue(2, r).ToString(),
                            fk_res.GetValue(3, r).ToString()
                        });
                    }
                }
                return DepResult{ table, dep };
            }));
        }

        threadPool.shutdown();

        for (auto& f : col_futs) { auto r = f.get(); columns[r.table] = std::move(r.columns); }
        for (auto& f : idx_futs) { auto r = f.get(); indexes[r.table] = std::move(r.indexes); }
        for (auto& f : dep_futs) { auto r = f.get(); deps[r.table] = std::move(r.deps); }

        return {columns, indexes, deps};
    }

    // Parallel profiling
    std::unordered_map<std::string, std::unordered_map<std::string, ColumnProfile>>
    PostgresCatalogBuilder::computeProfile(const std::vector<std::string>& tables) {
        std::unordered_map<std::string, std::unordered_map<std::string, ColumnProfile>> profile;

        duckdb::DuckDB db(nullptr);
        duckdb::Connection con(db);

        con.Query("INSTALL postgres_scanner; LOAD postgres_scanner;");
        auto attach_res = con.Query("ATTACH '" + config.getDBConnectionString() + "' AS pg (TYPE POSTGRES_SCANNER);");
        if (attach_res->HasError()) {
            std::cerr << "ATTACH FAILED: " << attach_res->GetError() << std::endl;
        }
        for (const auto& table : tables) {
            con.Query("CREATE TABLE "+table+" AS SELECT * FROM pg."+table+";");
            auto summarize_result = con.Query("SUMMARIZE "+table+";");
            if (summarize_result->HasError()) {
                std::cerr << "SUMMARIZE failed: " << summarize_result->GetError() << "\n";
                continue;
            }
            std::unordered_map<std::string, ColumnProfile> tabel_profile;
            for (idx_t row_idx = 0; row_idx < summarize_result->RowCount(); ++row_idx) {
                ColumnProfile s;
                // auto safe_string = [&](idx_t col) {
                //     auto val = summarize_result->GetValue(col, row_idx);
                //     return val.IsNull() ? std::string("NULL") : val.ToString();
                // };

                auto safe_double_t = [&](idx_t col, double_t fallback = 0) {
                    auto val = summarize_result->GetValue(col, row_idx);
                    return val.IsNull() ? fallback : val.GetValue<double_t>();
                };

                auto safe_int64 = [&](idx_t col, int64_t fallback = 0) {
                    auto val = summarize_result->GetValue(col, row_idx);
                    return val.IsNull() ? fallback : val.GetValue<int64_t>();
                };

                s.column_name       = summarize_result->GetValue(0, row_idx).ToString();
                s.column_type       = summarize_result->GetValue(1, row_idx).ToString();
                s.approx_unique     = summarize_result->GetValue(4, row_idx).GetValue<int64_t>();
                s.count             = summarize_result->GetValue(10, row_idx).GetValue<int64_t>();
                s.null_percentage   = 0.0;
                bool is_numeric = false;
                {
                    auto avg_val = summarize_result->GetValue(5, row_idx);
                    auto std_val = summarize_result->GetValue(6, row_idx);
                    is_numeric = !avg_val.IsNull() & !std_val.IsNull();
                }
                if (is_numeric) {
                    s.min               = safe_double_t(2);
                    s.max               = safe_double_t(3);
                    s.avg               = safe_double_t(5);
                    s.stddev            = safe_double_t(6);
                    s.q25               = safe_double_t(7);
                    s.q50               = safe_double_t(8);
                    s.q75               = safe_double_t(9);
                }
                s.is_numeric = is_numeric;

                int64_t null_count = safe_int64(11);
                s.null_percentage   = s.count > 0 ? (null_count * 100.0 / s.count) : 0.0;
                tabel_profile[s.column_name]= std::move(s);
            }
            profile[table] = std::move(tabel_profile);
        }
        return profile;
    }

}  // namespace minidb
