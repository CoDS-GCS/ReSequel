#include "CatalogBuilderFactory.h"
#include "Config.h"
#include "DownSample.h"
#include <string>

using namespace minidb;

int main(int argc, char *argv[]) {

    std::string dataset_name = argv[1];
    std::string catalog_path = argv[2];

    Config config = Config(DatabaseType::PostgreSQL, "resources",dataset_name);
    CatalogInfo catalog = CatalogBuilderFactory::build(config, catalog_path);
    return 0;
}