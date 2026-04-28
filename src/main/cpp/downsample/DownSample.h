#ifndef DOWNSAMPLE_H
#define DOWNSAMPLE_H

#pragma once

#include <duckdb.hpp>
#include <json.h>
#include <string>
#include <vector>
#include <future>
#include "CatalogBuilderFactory.h"
#include "Config.h"

using json = nlohmann::json;

class DownSample {
    public:
        struct SinglePK {
            std::vector<std::string> values;
        };

        struct CompositePK {
            std::vector<std::vector<std::string>> tuples;
        };

        enum class PKType {
            SINGLE,     // 1 column - FASTEST
            COMPOSITE,  // 2+ columns
            UNKNOWN
        };

        struct Relation {
            std::string child_table;
            std::string child_col;
            std::string parent_table;
            std::string parent_col;
        };

        struct SchemaRelation {
            std::string child_table;
            std::string child_col;
            std::string parent_table;
            std::string parent_col;

            SchemaRelation() = default;
            SchemaRelation(const SchemaRelation&) = default;
            SchemaRelation(SchemaRelation&&) noexcept = default;
        };

        struct TableSchema {
            std::string table_name;
            std::vector<std::string> primary_keys;
            std::vector<SchemaRelation> foreign_keys;

            TableSchema() = default;
            TableSchema(const TableSchema&) = default;
            TableSchema(TableSchema&&) noexcept = default;
            TableSchema& operator=(const TableSchema&) = default;
            TableSchema& operator=(TableSchema&&) noexcept = default;
            ~TableSchema() = default;
        };

        struct SampleSet {
            std::vector<std::string> tables;
            std::string root_table;
        };

        explicit DownSample(const Config& config, const CatalogInfo& catalog_info,
            const std::vector<std::string>& tables, const std::string& schema_relation_path,float ratio, const OutputFormat& output_format);
        ~DownSample();

        bool run(int sample_id);

    private:
        // Internal methods
        void attach_source_database(const std::string& connection_str);
        std::vector<Relation> discover_relations();
        std::vector<SampleSet> build_sample_sets(const std::vector<Relation>& relations);
        void sample_table_to_file(const std::string& table_name, const std::string& output_path);
        void parallel_sample(const std::vector<SampleSet>& sets);
        bool load_schema_from_file(const std::string& filename);
        const TableSchema* get_table_schema(const std::string& table_name) const;
        std::string find_central_table(const std::vector<std::string>& table_subset) const;
        std::unordered_map<std::string, size_t> calculate_dependency_scores(const std::vector<std::string>& table_subset) const;

        std::vector<std::string> get_parent_tables(const std::string& child_table) const;
        bool downsample_central_graph(const std::string& central_table, const std::vector<std::string>& table_subset);

        // -------------------------------------
        PKType classify_pk_type(const std::string& table) const;

        // Single PK fast path (5x faster)
        std::vector<std::string> sample_single_pk(const std::string& table, size_t sample_size) const;
        bool save_single_pk_table(const std::string& table_name, const std::vector<std::string>& pk_values) const;
        bool sample_parent(const std::string& parent_table) const;

        // Composite PK support
        std::vector<std::vector<std::string>> sample_composite_pk(const std::string& table, size_t sample_size) const;
        bool save_sampled_table_composite(const std::string& table_name, const std::vector<std::vector<std::string>>& pk_tuples) const;

        // Essential helper functions
        std::string get_pk_column(const std::string& table_name) const;
        std::vector<std::string> get_pk_columns(const std::string& table_name) const;
        std::unordered_map<std::string, std::vector<SchemaRelation>> get_fk_columns(const std::string& table) const;
        bool save_query_to_parquet(const std::string& query, const std::string& table_name) const;

        std::string build_row_where_clause(const std::vector<std::string>& pk_cols) const;
        std::string build_composite_values_clause(const std::vector<std::vector<std::string>>& pk_tuples) const;
        std::string build_composite_set_values_clause(const std::vector<std::vector<std::string>>& fk_tuples) const;

        mutable std::unordered_map<std::string, std::pair<std::string, std::string>> fk_cache;
        const std::tuple<std::string,
                         std::unordered_map<std::string, std::vector<SchemaRelation>>,
                         std::unordered_map<std::string, std::vector<int>>> get_project_cols(const std::string& table) const;

        bool cache_fk_values(const std::unique_ptr<duckdb::MaterializedQueryResult>& results,
            const std::unordered_map<std::string, std::vector<SchemaRelation>>& fk_cols,
            const std::unordered_map<std::string, std::vector<int>>& fk_indexes) const;

        // Members
        duckdb::DuckDB src_db;
        mutable duckdb::Connection src_con;
        CatalogInfo catalog;
        Config config;
        float target_rows_ratio_per_root;
        bool preserve_order = false;
        std::vector<std::string> tables;
        std::unordered_map<std::string, TableSchema> schema_map;
        OutputFormat output_format;
        std::vector<SampleSet> sample_sets;
        std::atomic<size_t> total_rows_inserted_{0};
        std::string safe_get_string(const json& j, const std::string& key) const;
        std::string output_dir = "/home/saeed/Downloads/downsample";
    };



#endif //DOWNSAMPLE_H
