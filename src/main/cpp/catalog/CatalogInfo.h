#ifndef CATALOG_H
#define CATALOG_H

#pragma once
#include <string>
#include <vector>
#include <unordered_map>
#include <json.h>

using json = nlohmann::json;

struct ColumnInfo {
    std::string name;
    std::string type;
};

struct FKInfo {
    std::string column_name;
    std::string foreign_table;
    std::string foreign_column;
};

struct TableDependency {
    std::vector<std::string> primary_key;
    std::vector<FKInfo> foreign_keys;
};

struct ColumnProfile {
    std::string column_name;
    std::string column_type;
    std::double_t min;
    std::double_t max;
    std::double_t avg;
    std::double_t stddev;
    std::double_t q25;
    std::double_t q50;
    std::double_t q75;
    int64_t     count           = 0;
    double      null_percentage = 0.0;
    int64_t     approx_unique   = 0;
    bool is_numeric = false;
};

class CatalogInfo {
    public:
        std::string dataset_name;
        int number_of_tables;
        std::vector<std::string> table_names;
        std::unordered_map<std::string, std::vector<std::string>> table_indexes;
        std::unordered_map<std::string, std::vector<ColumnInfo>> columns;
        std::unordered_map<std::string, TableDependency> dependency;
        std::unordered_map<std::string, std::unordered_map<std::string, ColumnProfile>> profile;

        void save(const std::string& path) const;
        static CatalogInfo load(const std::string& path);
};



#endif //CATALOG_H
