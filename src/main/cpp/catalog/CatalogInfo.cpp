#include "CatalogInfo.h"
#include <fstream>

namespace fs = std::filesystem;
using json = nlohmann::json;

void CatalogInfo::save(const std::string& path) const {

    try {
        // 1. Create directory (with parents)
        std::error_code ec;
        fs::create_directories(path, ec);
        if (ec) { throw std::runtime_error("Failed to create directory: " + path + " (" + ec.message() + ")");}

        // 2. Helper: atomic write using temp file
        auto atomic_write = [&](const std::string& filename, const json& data) {
            const std::string tmp_path = filename + ".tmp";
            {
                std::ofstream out(tmp_path, std::ios::binary);
                if (!out) {
                    throw std::runtime_error("Cannot open file for writing: " + tmp_path);
                }
                out.exceptions(std::ios::failbit | std::ios::badbit);
                out << data.dump(4, ' ', true, json::error_handler_t::replace);  // UTF-8 safe
            }
            fs::rename(tmp_path, filename);
        };

        // 3. Save metadata.json
        json meta = {
            {"dataset_name", dataset_name},
            {"number_of_tables", number_of_tables},
            {"table_names", table_names},
            {"table_indexes", table_indexes},
            {"dependency", json::object()},
            {"profile", json::object()}
        };

        // Add dependency and profile (deep copy with proper types)
        for (const auto& [tbl, dep] : dependency) {
            json fk_arr = json::array();
            for (const auto& fk : dep.foreign_keys) {
                fk_arr.push_back({
                    {"column_name", fk.column_name},
                    {"foreign_table_name", fk.foreign_table},
                    {"foreign_column_name", fk.foreign_column}
                });
            }
            meta["dependency"][tbl] = {
                {"primary_key", dep.primary_key},
                {"foreign_key", fk_arr}
            };
        }

        for (const auto& [tbl, prof] : profile) {
            json col_prof = json::object();
            for (const auto& [col, stats] : prof) {
                if (stats.is_numeric) {
                    col_prof[col] = {
                        {"min", stats.min},
                        {"max", stats.max},
                        {"avg", stats.avg},
                        {"stddev", stats.stddev},
                        {"q25", stats.q25},
                        {"q50", stats.q50},
                        {"q75", stats.q75},
                        {"count", stats.count},
                        {"null_percentage", stats.null_percentage},
                        {"distinct_count", stats.approx_unique}
                    };
                } else {
                    col_prof[col] = {
                        {"distinct_count", stats.approx_unique},
                        {"null_percentage", stats.null_percentage},
                        {"count", stats.count}
                    };
                }
            }
            meta["profile"][tbl] = col_prof;
        }

        atomic_write(path + "/metadata.json", meta);

        // 4. Save per-table JSON + schema.json
         json schema_list = json::array();
         for (const auto& tbl : table_names) {
            json tbl_json;

            // Basic info
            tbl_json["table"] = tbl;
            for (const auto& [col, stats] : profile.at(tbl)) {
                 tbl_json["rows"] = stats.count;
                 break;
            }

            // Columns
            json cols_arr = json::array();
            if (columns.count(tbl)) {
                for (const auto& col : columns.at(tbl)) {
                    cols_arr.push_back({
                        {"name", col.name},
                        {"type", col.type}
                    });
                }
            }
            tbl_json["columns"] = cols_arr;

            // Indexes
            if (table_indexes.count(tbl)) {
                tbl_json["indexes"] = table_indexes.at(tbl);
            }

            // Save individual file
            atomic_write(path + "/" + tbl + ".json", tbl_json);

            // Add to schema list
            schema_list.push_back(tbl_json);
        }

        // 5. Save schema.json (all tables in one file)
        atomic_write(path + "/schema.json", schema_list);
    } catch (const std::exception& e) {
        throw std::runtime_error(std::string("CatalogInfo::save() failed: ") + e.what());
    }


    //------------------------------------------------------------
    // fs::create_directories(path);
    // json meta = metadata_to_json();
    // std::ofstream(path + "/metadata.json") << meta.dump(4);

    // json schema_list;
    // for (const auto& tbl : table_names) {
    //     json tbl_json = table_to_json(tbl);
    //     std::ofstream(path + "/" + tbl + ".json") << tbl_json.dump(4);
    //     schema_list.push_back(tbl_json);
    // }
    // std::ofstream(path + "/schema.json") << schema_list.dump(4);
}
