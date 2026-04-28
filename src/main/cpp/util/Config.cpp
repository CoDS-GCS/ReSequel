#include "Config.h"
//#include <yaml-cpp/yaml.h>
#include <stdexcept>
#include <iostream>
#include <tuple>
#include <string>

std::string PGDBConfig::to_connection_string() const {
    return "host=" + host +
           " port=" + std::to_string(port) +
           " dbname=" + dbname +
           " user=" + user +
           " password=" + password;
}

std::string PGDBConfig::to_connection_string_template() const {
    return "host=" + host +
           " port=" + std::to_string(port) +
           " dbname=$DB_NAME" +
           " user=" + user +
           " password=" + password;
}

Config::Config() {}

Config::Config(DatabaseType type, const std::string& resource_path, const std::string &database_name): database_name(database_name), dbms_type(type) {
    db_profile_queries = LoadDBProfileQueries(resource_path);
    auto[con_str, con_str_template] = LoadDBConnectionString(resource_path);
    connection_string = con_str;
    connection_string_template = con_str_template;
}

Config::~Config() {}


DBProfileQueries Config::LoadDBProfileQueries(const std::string &filePath) const {
    std::string db_type = "";
    switch (dbms_type) {
        case DatabaseType::PostgreSQL:
            db_type = "PG";
            break;
        case DatabaseType::MySQL:
            db_type = "MySQL";
            break;
        case DatabaseType::DuckDB:
            db_type = "DuckDB";
            break;
        default:
            throw std::invalid_argument("Unknown database type");
    }
    try {
        DBProfileQueries profile_queries;
        profile_queries.central_table     = FileHandler::ReadEntireTextFile(filePath+"/profiling_queries/"+db_type+"/central_table.sql");
        profile_queries.table_cardinality = FileHandler::ReadEntireTextFile(filePath+"/profiling_queries/"+db_type+"/table_cardinality.sql");
        profile_queries.table_indexes     = FileHandler::ReadEntireTextFile(filePath+"/profiling_queries/"+db_type+"/table_indexes.sql");
        profile_queries.table_list        = FileHandler::ReadEntireTextFile(filePath+"/profiling_queries/"+db_type+"/table_list.sql");
        profile_queries.table_PK_FK       = FileHandler::ReadEntireTextFile(filePath+"/profiling_queries/"+db_type+"/table_PK_FK.sql");
        profile_queries.table_profile     = FileHandler::ReadEntireTextFile(filePath+"/profiling_queries/"+db_type+"/table_profile.sql");
        profile_queries.table_schema      = FileHandler::ReadEntireTextFile(filePath+"/profiling_queries/"+db_type+"/table_schema.sql");

        return profile_queries;
    }
    catch (const std::exception& e) {
        throw std::runtime_error(std::string("Config error: ") + e.what());
    }
}

std::tuple<std::string, std::string> Config::LoadDBConnectionString(const std::string& path) const {
//    try {
//        YAML::Node config = YAML::LoadFile(path);
//        auto db = config["pg_database"];
//        if (!db) throw std::runtime_error("Missing 'pg_database' section");
//
//        PGDBConfig cfg;
//        cfg.host     = db["host"].as<std::string>();
//        cfg.port     = db["port"].as<int>();
//        cfg.dbname   = dbname;
//        cfg.user     = db["user"].as<std::string>();
//        cfg.password = db["password"].as<std::string>();
//        return cfg;
//    }
//    catch (const std::exception& e) {
//        throw std::runtime_error(std::string("Config error: ") + e.what());
//    }
    switch (dbms_type) {
        case DatabaseType::PostgreSQL: {
            try {
                PGDBConfig cfg;
                cfg.host     = "localhost";
                cfg.port     = 5432;
                cfg.dbname   = database_name;
                cfg.user     = "postgres";
                cfg.password = "postgres";
                return {cfg.to_connection_string(), cfg.to_connection_string_template()};
            }
            catch (const std::exception& e) {
                throw std::runtime_error(std::string("Config error: ") + e.what());
            }
        }
        break;
        default:
            throw std::invalid_argument("Unknown database type");

    }
}

DBProfileQueries Config::getProfileQueries() const{
    return db_profile_queries;
}

DatabaseType Config::getDBMS() const {
    return dbms_type;
}

std::string Config::getDatabaseName() const {
    return database_name;
}

std::string Config::getDBConnectionString() const {
    return connection_string;
}

std::string Config::getSamplesDBConnectionString(int sample_id) const {
    std::string sample_connection_string = connection_string_template;
    size_t pos_1 = connection_string_template.find("$DB_NAME");
    return  sample_connection_string.replace(pos_1, 8, database_name + std::to_string(sample_id));
}




