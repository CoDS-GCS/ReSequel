#ifndef POSTGRESCONNECTION_H
#define POSTGRESCONNECTION_H


#pragma once
#include "IDatabaseConnection.h"
#include <pqxx/pqxx>
#include <memory>
#include <mutex>
#include <string>

namespace minidb {

    class PostgresConnection : public IDatabaseConnection {
        public:
            explicit PostgresConnection(std::string conn_str);

            // Connection Management
            void connect() override;
            void disconnect() override;
            bool is_connected() const override;

            // Query Execution
            MaterializedQueryResult execute(const std::string& sql) override;
            MaterializedQueryResult execute(const std::string& sql) const override;

            // Escaping
            std::string escape_identifier(const std::string& id) const override;
            std::string escape_string(const std::string& s) const override;

            // Destructor
            ~PostgresConnection() override { disconnect(); }

        private:
            // Lazy connection init (thread-safe)
            void ensure_connected() const;

            // Convert pqxx::result → MaterializedQueryResult
            MaterializedQueryResult materialize(const pqxx::result& r) const;

            // Members
            const std::string conn_str_;
            mutable std::unique_ptr<pqxx::connection> conn_;  // mutable → lazy init in const
            mutable std::mutex conn_mtx_;                     // protects conn_
        };

}  // namespace minidb

#endif //POSTGRESCONNECTION_H
