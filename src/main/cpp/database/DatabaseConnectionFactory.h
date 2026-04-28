#ifndef CONNECTIONFACTORY_H
#define CONNECTIONFACTORY_H

#pragma once
#include "IDatabaseConnection.h"
#include "Config.h"

class DatabaseConnectionFactory {
    public:
        static std::unique_ptr<IDatabaseConnection> create(
            DatabaseType type,
            const std::string& conn_str = ""
        );
    };


#endif //CONNECTIONFACTORY_H
