#ifndef MATERIALIZEDQUERYRESULT_H
#define MATERIALIZEDQUERYRESULT_H

#pragma once
#include <cstdint>
#include <string>
#include <vector>
#include <memory>
#include <cstring>
#include <stdexcept>
#include <iostream>

namespace minidb {

    enum class LogicalTypeId {
        INVALID = 0,
        BOOLEAN,
        BIGINT,
        DOUBLE,
        VARCHAR,
        DATE,
        TIMESTAMP
    };

    class LogicalType {
    public:
        explicit LogicalType(LogicalTypeId id) : id_(id) {}
        LogicalTypeId id() const { return id_; }

        static LogicalType BOOLEAN()   { return LogicalType(LogicalTypeId::BOOLEAN); }
        static LogicalType BIGINT()    { return LogicalType(LogicalTypeId::BIGINT); }
        static LogicalType DOUBLE()    { return LogicalType(LogicalTypeId::DOUBLE); }
        static LogicalType VARCHAR()   { return LogicalType(LogicalTypeId::VARCHAR); }
        static LogicalType DATE()      { return LogicalType(LogicalTypeId::DATE); }
        static LogicalType TIMESTAMP() { return LogicalType(LogicalTypeId::TIMESTAMP); }

    private:
        LogicalTypeId id_;
    };

    struct Date { int32_t year, month, day; };
    struct Timestamp { int64_t micros; };

    class Value {
    public:
        Value() : type_(LogicalTypeId::INVALID), is_null_(true) {}
        Value(bool v)     : Value() { data_.b = v; type_ = LogicalTypeId::BOOLEAN; is_null_ = false; }
        Value(int64_t v) : Value() { data_.i64 = v; type_ = LogicalTypeId::BIGINT; is_null_ = false; }
        Value(double v)   : Value() { data_.d = v; type_ = LogicalTypeId::DOUBLE; is_null_ = false; }
        Value(const char* s) : Value() { data_.str = new std::string(s); type_ = LogicalTypeId::VARCHAR; is_null_ = false; }
        Value(std::string&& s) : Value() { data_.str = new std::string(std::move(s)); type_ = LogicalTypeId::VARCHAR; is_null_ = false; }
        Value(Date d)     : Value() { data_.date = d; type_ = LogicalTypeId::DATE; is_null_ = false; }
        Value(Timestamp ts): Value() { data_.ts = ts; type_ = LogicalTypeId::TIMESTAMP; is_null_ = false; }

        Value(const Value& o) : type_(o.type_), is_null_(o.is_null_) { if (!is_null_) copy_data(o); }
        Value& operator=(const Value& o) { if (this != &o) { clear(); type_ = o.type_; is_null_ = o.is_null_; if (!is_null_) copy_data(o); } return *this; }
        Value(Value&& o) noexcept : type_(o.type_), is_null_(o.is_null_) { data_ = o.data_; o.type_ = LogicalTypeId::INVALID; o.is_null_ = true; }
        Value& operator=(Value&& o) noexcept { if (this != &o) { clear(); type_ = o.type_; is_null_ = o.is_null_; data_ = o.data_; o.type_ = LogicalTypeId::INVALID; o.is_null_ = true; } return *this; }
        ~Value() { clear(); }

        LogicalTypeId type() const { return type_; }
        bool is_null() const { return is_null_; }

        bool         GetBoolean() const   { ensure_type(LogicalTypeId::BOOLEAN);   return data_.b; }
        int64_t      GetBigInt() const    { ensure_type(LogicalTypeId::BIGINT);    return data_.i64; }
        double       GetDouble() const    { ensure_type(LogicalTypeId::DOUBLE);    return data_.d; }
        const std::string& GetString() const { ensure_type(LogicalTypeId::VARCHAR);   return *data_.str; }
        Date         GetDate() const      { ensure_type(LogicalTypeId::DATE);      return data_.date; }
        Timestamp    GetTimestamp() const { ensure_type(LogicalTypeId::TIMESTAMP); return data_.ts; }

        std::string ToString() const;

    private:
        void clear() { if (!is_null_ && type_ == LogicalTypeId::VARCHAR) delete data_.str; is_null_ = true; }
        void copy_data(const Value& o);
        void ensure_type(LogicalTypeId expected) const;

        LogicalTypeId type_;
        bool is_null_;
        union {
            bool b;
            int64_t i64;
            double d;
            std::string* str;
            Date date;
            Timestamp ts;
        } data_;
    };

    class MaterializedQueryResult {
        public:
            MaterializedQueryResult(std::vector<LogicalType> types, std::vector<std::string> names);
            ~MaterializedQueryResult() = default;

            MaterializedQueryResult(const MaterializedQueryResult&) = delete;
            MaterializedQueryResult& operator=(const MaterializedQueryResult&) = delete;
            MaterializedQueryResult(MaterializedQueryResult&&) noexcept = default;
            MaterializedQueryResult& operator=(MaterializedQueryResult&&) noexcept = default;

            size_t ColumnCount() const { return types_.size(); }
            size_t RowCount() const { return row_count_; }
            const std::string& ColumnName(size_t col) const { return names_[col]; }
            LogicalType ColumnType(size_t col) const { return types_[col]; }

            bool IsNull(size_t col, size_t row) const;
            void SetNull(size_t col, size_t row, bool is_null = true);
            void SetValue(size_t col, const Value& val);
            void AppendRow();
            Value GetValue(size_t col, size_t row) const;
            void Print() const;

            // Add inside class
            const std::vector<LogicalType>& GetColumnTypes() const { return types_; }

        private:
            struct Column {
                std::vector<uint8_t> validity;
                std::vector<char> data;
                size_t value_size = 0;
                std::vector<std::string> strings;
                size_t current_row_ = 0;
                LogicalType type_;

                // *** ONLY CONSTRUCTOR WE NEED ***
                Column(LogicalType type, size_t init_capacity);
                Column(const Column&) = delete;
                Column& operator=(const Column&) = delete;
                Column(Column&&) noexcept = default;
                Column& operator=(Column&&) noexcept = default;

                void Reserve(size_t capacity);
                void PushNull();
                void PushValue(const Value& v);
                Value Get(size_t row) const;
                bool IsNull(size_t row) const;
            };

            std::vector<LogicalType> types_;
            std::vector<std::string> names_;
            size_t row_count_ = 0;

            // *** RESERVE SPACE FIRST → no default ctor needed ***
            std::vector<Column> columns_;
    };

}  // namespace minidb

#endif //MATERIALIZEDQUERYRESULT_H
