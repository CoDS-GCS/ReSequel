#include "PostgresConnection.h"
#include "MaterializedQueryResult.h"
#include <pqxx/pqxx>
#include <stdexcept>

namespace minidb {

    PostgresConnection::PostgresConnection(std::string conn_str): conn_str_(std::move(conn_str)) {}

    void PostgresConnection::connect() {
        std::lock_guard<std::mutex> lock(conn_mtx_);
        if (!conn_) {
            try {
                conn_ = std::make_unique<pqxx::connection>(conn_str_);
            } catch (const std::exception& e) {
                throw std::runtime_error("PostgreSQL connection failed: " + std::string(e.what()));
            }
        }
    }

    void PostgresConnection::disconnect() {
        std::lock_guard<std::mutex> lock(conn_mtx_);
        conn_.reset();
    }

    bool PostgresConnection::is_connected() const {
        std::lock_guard<std::mutex> lock(conn_mtx_);
        return conn_ && conn_->is_open();
    }

    void PostgresConnection::ensure_connected() const {
        std::lock_guard<std::mutex> lock(conn_mtx_);
        if (!conn_) {
            // Safe const_cast: we're initializing mutable state
            const_cast<PostgresConnection*>(this)->conn_ =
                std::make_unique<pqxx::connection>(conn_str_);
        }
    }

    MaterializedQueryResult PostgresConnection::execute(const std::string& sql) {
        ensure_connected();
        pqxx::work txn(*conn_);
        pqxx::result r = txn.exec(sql);
        txn.commit();
        return materialize(r);
    }

    MaterializedQueryResult PostgresConnection::execute(const std::string& sql) const {
        ensure_connected();
        pqxx::work txn(*conn_);
        pqxx::result r = txn.exec(sql);
        txn.commit();
        return materialize(r);
    }

    std::string PostgresConnection::escape_identifier(const std::string& id) const {
        ensure_connected();
        return conn_->quote_name(id);
    }

    std::string PostgresConnection::escape_string(const std::string& s) const {
        ensure_connected();
        return conn_->esc(s);
    }

    // materialize(): Convert pqxx::result → MaterializedQueryResult
    MaterializedQueryResult PostgresConnection::materialize(const pqxx::result& r) const {
        if (r.empty()) {
            return MaterializedQueryResult({}, {});
        }

        std::vector<minidb::LogicalType> types;
        std::vector<std::string> names;

        // Use real column metadata
        for (pqxx::result::size_type i = 0; i < r.columns(); ++i) {
            names.emplace_back(r.column_name(i));                     // real name
            auto oid = r.column_type(static_cast<pqxx::row_size_type>(i));
            switch (oid) {
                case 20: case 21: case 23:  types.push_back(minidb::LogicalType::BIGINT()); break;
                case 25:                    types.push_back(minidb::LogicalType::VARCHAR()); break;
                case 700: case 701:         types.push_back(minidb::LogicalType::DOUBLE()); break;
                case 16:                    types.push_back(minidb::LogicalType::BOOLEAN()); break;
                case 1082:                  types.push_back(minidb::LogicalType::DATE()); break;
                case 1114: case 1184:       types.push_back(minidb::LogicalType::TIMESTAMP()); break;
                case 1083:                  types.push_back(minidb::LogicalType::TIMESTAMP()); break; // timestamptz
                default:                    types.push_back(minidb::LogicalType::VARCHAR()); break;
            }
        }

        auto result = std::make_unique<minidb::MaterializedQueryResult>(types, names);
        const auto& column_types = result->GetColumnTypes();  // safe reference

        for (const auto& row : r) {
            for (size_t i = 0; i < row.size(); ++i) {
                auto col_idx = static_cast<pqxx::row::size_type>(i);
                if (row.at(col_idx).is_null()) {
                    result->SetNull(i, result->RowCount());
                } else {
                    switch (column_types[i].id()) {
                        case minidb::LogicalTypeId::BIGINT:
                            result->SetValue(i, row.at(col_idx).as<int64_t>());
                        break;
                        case minidb::LogicalTypeId::DOUBLE:
                            result->SetValue(i, row.at(col_idx).as<double>());
                        break;
                        case minidb::LogicalTypeId::BOOLEAN:
                            result->SetValue(i, row.at(col_idx).as<bool>());
                        break;
                        case minidb::LogicalTypeId::VARCHAR:
                            result->SetValue(i, row.at(col_idx).c_str());
                        break;
                        case minidb::LogicalTypeId::DATE:
                            result->SetValue(i, row.at(col_idx).c_str());  // "YYYY-MM-DD"
                        break;
                        case minidb::LogicalTypeId::TIMESTAMP:
                            result->SetValue(i, row.at(col_idx).c_str());  // "YYYY-MM-DD HH:MM:SS"
                        break;
                        default:
                            result->SetValue(i, row.at(col_idx).c_str());
                        break;
                    }
                }
            }
            result->AppendRow();
        }
        return std::move(*result);
    }

}  // namespace minidb