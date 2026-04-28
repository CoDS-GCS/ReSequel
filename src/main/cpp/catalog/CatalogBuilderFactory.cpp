#include "CatalogBuilderFactory.h"
#include "PostgresCatalogBuilder.h"


CatalogInfo minidb::CatalogBuilderFactory::build(const Config& config, const std::string& save_path){
    switch (config.getDBMS()) {
        case DatabaseType::PostgreSQL:{
            PostgresCatalogBuilder pcb(config, save_path);
            return pcb.build();
            break;
        }
        default:
            throw std::invalid_argument("Unknown database type");
    }
  // TODO: add MySQL and DuckDB

}