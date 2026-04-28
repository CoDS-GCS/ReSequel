#ifndef CONFIG_H
#define CONFIG_H

#pragma once
#include <string>
#include <vector>

#include "FileHandler.h"

enum class DatabaseType {
    PostgreSQL,
    MySQL,
    DuckDB
};

enum class OutputFormat {
    PARQUET,  // FASTEST + smallest
    CSV,      // Universal
    JSON,     // Human readable
    JSONL     // Streaming JSON
};

struct PGDBConfig {
    std::string host;
    int port;
    std::string dbname;
    std::string user;
    std::string password;

    [[nodiscard]] std::string to_connection_string() const;
    [[nodiscard]] std::string to_connection_string_template() const;
};

struct DBProfileQueries {
    std::string central_table;
    std::string table_cardinality;
    std::string table_indexes;
    std::string table_list;
    std::string table_PK_FK;
    std::string table_profile;
    std::string table_schema;
};


class Config {
    public:
        Config();
        Config(DatabaseType type, const std::string& resource_path ,const std::string& database_name);
        ~Config();

        [[nodiscard]] std::string getDBConnectionString() const;
        [[nodiscard]] std::string getSamplesDBConnectionString(int sample_id) const;
        [[nodiscard]] DBProfileQueries getProfileQueries() const;
        [[nodiscard]] std::string getDatabaseName() const;
        [[nodiscard]] DatabaseType getDBMS() const;

    private:
        [[nodiscard]] DBProfileQueries LoadDBProfileQueries(const std::string& filePath) const;
        [[nodiscard]] std::tuple<std::string, std::string> LoadDBConnectionString(const std::string& path) const;
        std::string database_name;
        DatabaseType dbms_type;
        std::string connection_string;
        std::string connection_string_template; // masked database name with $DB_NAME length = 8
        DBProfileQueries db_profile_queries;


};

#endif //CONFIG_H
