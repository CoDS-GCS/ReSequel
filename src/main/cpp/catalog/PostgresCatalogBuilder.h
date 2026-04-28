#ifndef POSTGRESCATALOGBUILDER_H
#define POSTGRESCATALOGBUILDER_H


#pragma once
#include "CatalogInfo.h"
#include "ThreadPool.h"
#include "Config.h"
#include "PostgresConnection.h"
#include <memory>

namespace minidb {

    class PostgresCatalogBuilder{
      public:
       explicit PostgresCatalogBuilder(const Config& config, const std::string& save_path): threadPool(ThreadPool(config.getDBConnectionString())),
        connection(std::make_shared<PostgresConnection>(config.getDBConnectionString())), config(config), save_path(save_path) {};
        CatalogInfo build();

      private:
        const Config config;
        std::vector<std::string> getTableNames();

        std::tuple<
            std::unordered_map<std::string, std::vector<ColumnInfo>>,
            std::unordered_map<std::string, std::vector<std::string>>,
            std::unordered_map<std::string, TableDependency>
        > getSchema(const std::vector<std::string>& tables);

        std::unordered_map<std::string, std::unordered_map<std::string, ColumnProfile>>
        computeProfile(const std::vector<std::string>& tables);

        ThreadPool threadPool;
        std::shared_ptr<PostgresConnection> connection;
        const std::string save_path;
    };

}  // namespace minidb



#endif //POSTGRESCATALOGBUILDER_H
