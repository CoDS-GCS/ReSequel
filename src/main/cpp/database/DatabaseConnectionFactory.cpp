#include "DatabaseConnectionFactory.h"
#include "PostgresConnection.h"
//#include "MySQLConnection.h"
//#include "DuckDBConnection.h"

std::unique_ptr<IDatabaseConnection> DatabaseConnectionFactory::create(
    DatabaseType type, const std::string& conn_str) {
    switch (type) {
        case DatabaseType::PostgreSQL:
            return std::make_unique<minidb::PostgresConnection>(conn_str);
//        case DatabaseType::MySQL: {
//            // Parse conn_str: "host=localhost user=root pass=secret db=mydb"
//            // Simplified: expect "host user pass db"
//            std::istringstream iss(conn_str);
//            std::string host, user, pass, db;
//            iss >> host >> user >> pass >> db;
//            return std::make_unique<MySQLConnection>(host, user, pass, db);
//        }
//        case DatabaseType::DuckDB:
//            return std::make_unique<DuckDBConnection>(conn_str.empty() ? ":memory:" : conn_str);
        default:
            throw std::invalid_argument("Unknown database type");
    }
}
