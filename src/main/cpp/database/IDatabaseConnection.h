#ifndef IDATABASECONNECTION_H
#define IDATABASECONNECTION_H


#pragma once
#include <memory>
#include <string>
#include "MaterializedQueryResult.h"


class IDatabaseConnection {
    public:
        virtual ~IDatabaseConnection() = default;

        // Connection
        virtual void connect() = 0;
        virtual void disconnect() = 0;
        virtual bool is_connected() const = 0;

        // Execution
    virtual minidb::MaterializedQueryResult execute(const std::string& sql) = 0;
        virtual minidb::MaterializedQueryResult execute(const std::string& sql) const = 0;

        // Utility
        virtual std::string escape_identifier(const std::string& id) const = 0;
        virtual std::string escape_string(const std::string& s) const = 0;

        // Factory
        template<typename T>
        static std::unique_ptr<IDatabaseConnection> create();
    };

#endif //IDATABASECONNECTION_H
