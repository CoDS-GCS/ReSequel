#include "MaterializedQueryResult.h"
#include <iomanip>
#include <sstream>

namespace minidb {

// ------------------------------------------------------------------
// Value helpers (inline in header)
// ------------------------------------------------------------------
void Value::copy_data(const Value& o) {
    switch (o.type_) {
        case LogicalTypeId::BOOLEAN:   data_.b = o.data_.b; break;
        case LogicalTypeId::BIGINT:    data_.i64 = o.data_.i64; break;
        case LogicalTypeId::DOUBLE:    data_.d = o.data_.d; break;
        case LogicalTypeId::VARCHAR:   data_.str = new std::string(*o.data_.str); break;
        case LogicalTypeId::DATE:      data_.date = o.data_.date; break;
        case LogicalTypeId::TIMESTAMP: data_.ts = o.data_.ts; break;
        default: break;
    }
}

void Value::ensure_type(LogicalTypeId expected) const {
    if (is_null_) throw std::runtime_error("NULL value");
    if (type_ != expected) throw std::runtime_error("Type mismatch");
}

// std::string Value::ToString() const {
//     if (is_null_) return "NULL";
//     switch (type_) {
//         case LogicalTypeId::BOOLEAN:   return data_.b ? "true" : "false";
//         case LogicalTypeId::BIGINT:    return std::to_string(data_.i64);
//         case LogicalTypeId::DOUBLE:    return std::to_string(data_.d);
//         case LogicalTypeId::VARCHAR:   return *data_.str;
//         case LogicalTypeId::DATE: {
//             std::ostringstream oss;
//             oss << std::setw(4) << std::setfill('0') << data_.date.year << "-"
//                 << std::setw(2) << data_.date.month << "-"
//                 << std::setw(2) << data_.date.day;
//             return oss.str();
//         }
//         default: return "<unknown>";
//     }
// }
    std::string Value::ToString() const {
    if (is_null_) return "NULL";
    switch (type_) {
        case LogicalTypeId::BOOLEAN:   return data_.b ? "true" : "false";
        case LogicalTypeId::BIGINT:    return std::to_string(data_.i64);
        case LogicalTypeId::DOUBLE:    return std::to_string(data_.d);
        case LogicalTypeId::VARCHAR:   return *data_.str;
        case LogicalTypeId::DATE:
        case LogicalTypeId::TIMESTAMP:
            return *data_.str;  // we stored as string from pqxx
        default: return "<unknown>";
    }
}

// ------------------------------------------------------------------
// Column
// ------------------------------------------------------------------
MaterializedQueryResult::Column::Column(LogicalType type, size_t init_capacity)
    : type_(type)
{
    switch (type.id()) {
        case LogicalTypeId::BOOLEAN:   value_size = 1; break;
        case LogicalTypeId::BIGINT:    value_size = 8; break;
        case LogicalTypeId::DOUBLE:    value_size = 8; break;
        case LogicalTypeId::DATE:      value_size = 12; break;
        case LogicalTypeId::TIMESTAMP: value_size = 8; break;
        case LogicalTypeId::VARCHAR:   value_size = 0; break;
        default: throw std::runtime_error("Unsupported type");
    }
    validity.resize((init_capacity + 7) / 8, 0xFF);
    if (value_size > 0) data.resize(init_capacity * value_size);
}

void MaterializedQueryResult::Column::Reserve(size_t capacity) {
    size_t byte_size = (capacity + 7) / 8;
    if (validity.size() < byte_size) validity.resize(byte_size, 0xFF);
    if (value_size > 0 && data.size() < capacity * value_size) {
        data.resize(capacity * value_size);
    }
}

void MaterializedQueryResult::Column::PushNull() {
    size_t byte_idx = current_row_ / 8;
    size_t bit_idx = current_row_ % 8;
    validity[byte_idx] &= ~(1 << bit_idx);
    if (value_size > 0) {
        size_t offset = current_row_ * value_size;
        std::memset(data.data() + offset, 0, value_size);
    }
    current_row_++;
}

void MaterializedQueryResult::Column::PushValue(const Value& v) {
    size_t byte_idx = current_row_ / 8;
    size_t bit_idx = current_row_ % 8;
    validity[byte_idx] |= (1 << bit_idx);

    switch (type_.id()) {
        case LogicalTypeId::BOOLEAN:
            data[current_row_ * value_size] = v.GetBoolean() ? 1 : 0;
            break;
        case LogicalTypeId::BIGINT: {
            int64_t val = v.GetBigInt();
            std::memcpy(data.data() + current_row_ * value_size, &val, 8);
            break;
        }
        case LogicalTypeId::DOUBLE: {
            double val = v.GetDouble();
            std::memcpy(data.data() + current_row_ * value_size, &val, 8);
            break;
        }
        case LogicalTypeId::VARCHAR:
            strings.push_back(v.GetString());
            break;
    }
    current_row_++;
}

// *** FIXED: use const char* ctor ***
Value MaterializedQueryResult::Column::Get(size_t row) const {
    if (IsNull(row)) return Value();
    switch (type_.id()) {
        case LogicalTypeId::BOOLEAN:
            return Value(data[row] != 0);
        case LogicalTypeId::BIGINT: {
            int64_t v; std::memcpy(&v, data.data() + row * 8, 8); return Value(v);
        }
        case LogicalTypeId::DOUBLE: {
            double v; std::memcpy(&v, data.data() + row * 8, 8); return Value(v);
        }
        case LogicalTypeId::VARCHAR:
            return Value(strings[row].c_str());   // <-- uses const char* ctor
        default:
            return Value();
    }
}

bool MaterializedQueryResult::Column::IsNull(size_t row) const {
    size_t byte_idx = row / 8;
    size_t bit_idx = row % 8;
    return (validity[byte_idx] & (1 << bit_idx)) == 0;
}

// ------------------------------------------------------------------
// MaterializedQueryResult
// ------------------------------------------------------------------
MaterializedQueryResult::MaterializedQueryResult(std::vector<LogicalType> types,
                                                 std::vector<std::string> names)
    : types_(std::move(types)), names_(std::move(names))
{
    // *** RESERVE FIRST → no default ctor needed ***
    columns_.reserve(types_.size());
    for (size_t i = 0; i < types_.size(); ++i) {
        columns_.emplace_back(types_[i], 1024);
    }
}

bool MaterializedQueryResult::IsNull(size_t col, size_t row) const {
    return columns_[col].IsNull(row);
}

void MaterializedQueryResult::SetNull(size_t col, size_t row, bool is_null) {
    if (is_null) {
        size_t byte_idx = row / 8, bit_idx = row % 8;
        columns_[col].validity[byte_idx] &= ~(1 << bit_idx);
    }
}

void MaterializedQueryResult::SetValue(size_t col, const Value& val) {
    if (val.is_null()) {
        columns_[col].PushNull();
    } else {
        columns_[col].PushValue(val);
    }
}

void MaterializedQueryResult::AppendRow() {
    row_count_++;
    for (auto& col : columns_) {
        col.current_row_ = row_count_;
        col.Reserve(row_count_ + 1024);
    }
}

Value MaterializedQueryResult::GetValue(size_t col, size_t row) const {
    return columns_[col].Get(row);
}
// void MaterializedQueryResult::Print() const {
//     if (ColumnCount() == 0) {
//         std::cout << "(empty result)\n";
//         return;
//     }
//
//     // --- Detect UTF-8 support ---
//     bool use_unicode = false;
//     const char* env = std::getenv("LANG");
//     if (!env) env = std::getenv("LC_ALL");
//     if (!env) env = std::getenv("LC_CTYPE");
//     if (env && std::strstr(env, "UTF-8")) {
//         use_unicode = true;
//     }
//
//     // --- Compute column widths ---
//     std::vector<size_t> widths(ColumnCount(), 0);
//     for (size_t c = 0; c < ColumnCount(); ++c) {
//         widths[c] = names_[c].size();
//         for (size_t r = 0; r < RowCount(); ++r) {
//             std::string s = GetValue(c, r).ToString();
//             widths[c] = std::max(widths[c], s.size());
//         }
//     }
//
//     // --- Box-drawing characters (Unicode escape) ---
//     const char* TL = use_unicode ? "\u250C" : "+";  // ┌
//     const char* TM = use_unicode ? "\u252C" : "+";  // ┬
//     const char* TR = use_unicode ? "\u2510" : "+";  // ┐
//     const char* ML = use_unicode ? "\u251C" : "+";  // ├
//     const char* MM = use_unicode ? "\u253C" : "+";  // ┼
//     const char* MR = use_unicode ? "\u2524" : "+";  // ┤
//     const char* BL = use_unicode ? "\u2514" : "+";  // └
//     const char* BM = use_unicode ? "\u2534" : "+";  // ┴
//     const char* BR = use_unicode ? "\u2518" : "+";  // ┘
//     const char* VL = use_unicode ? "\u2502" : "|";  // │
//     const char  HL = '-';  // Always use '-' for horizontal lines
//
//     // --- Helper: horizontal line ---
//     auto hline = [&](const char* left, const char* mid, const char* right) {
//         std::cout << left;
//         for (size_t c = 0; c < ColumnCount(); ++c) {
//             if (c > 0) std::cout << mid;
//             std::cout << std::string(widths[c] + 2, HL);
//         }
//         std::cout << right << "\n";
//     };
//
//     // --- Top border ---
//     hline(TL, TM, TR);
//
//     // --- Header ---
//     std::cout << VL;
//     for (size_t c = 0; c < ColumnCount(); ++c) {
//         if (c > 0) std::cout << VL;
//         std::cout << " " << std::left << std::setw(static_cast<int>(widths[c])) << names_[c] << " ";
//     }
//     std::cout << VL << "\n";
//
//     // --- Header separator ---
//     hline(ML, MM, MR);
//
//     // --- Data rows ---
//     for (size_t r = 0; r < RowCount(); ++r) {
//         std::cout << VL;
//         for (size_t c = 0; c < ColumnCount(); ++c) {
//             if (c > 0) std::cout << VL;
//
//             std::string s = GetValue(c, r).ToString();
//
//             bool is_numeric = (types_[c].id() == LogicalTypeId::BIGINT ||
//                                types_[c].id() == LogicalTypeId::DOUBLE ||
//                                types_[c].id() == LogicalTypeId::BOOLEAN);
//
//             if (is_numeric && s != "NULL") {
//                 std::cout << " " << std::right << std::setw(static_cast<int>(widths[c])) << s << " ";
//             } else {
//                 std::cout << " " << std::left  << std::setw(static_cast<int>(widths[c])) << s << " ";
//             }
//         }
//         std::cout << VL << "\n";
//     }
//
//     // --- Bottom border ---
//     hline(BL, BM, BR);
// }

// void MaterializedQueryResult::Print() const {
//     if (ColumnCount() == 0) {
//         std::cout << "(empty result)\n";
//         return;
//     }
//
//     // --- Detect UTF-8 support ---
//     bool use_unicode = false;
//     const char* lang = std::getenv("LANG");
//     const char* lc_all = std::getenv("LC_ALL");
//     const char* lc_ctype = std::getenv("LC_CTYPE");
//     if ((lang && strstr(lang, "UTF-8")) ||
//         (lc_all && strstr(lc_all, "UTF-8")) ||
//         (lc_ctype && strstr(lc_ctype, "UTF-8"))) {
//         use_unicode = true;
//     }
//
//     // --- Compute column widths ---
//     std::vector<size_t> widths(ColumnCount(), 0);
//     for (size_t c = 0; c < ColumnCount(); ++c) {
//         widths[c] = names_[c].size();
//         for (size_t r = 0; r < RowCount(); ++r) {
//             std::string s = GetValue(c, r).ToString();
//             widths[c] = std::max(widths[c], s.size());
//         }
//     }
//
//     // --- Box characters (ASCII fallback) ---
//     const char* TL = use_unicode ? "\u250C" : "+";  // ┌
//     const char* TM = use_unicode ? "\u252C" : "+";  // ┬
//     const char* TR = use_unicode ? "\u2510" : "+";  // ┐
//     const char* ML = use_unicode ? "\u251C" : "+";  // ├
//     const char* MM = use_unicode ? "\u253C" : "+";  // ┼
//     const char* MR = use_unicode ? "\u2524" : "+";  // ┤
//     const char* BL = use_unicode ? "\u2514" : "+";  // └
//     const char* BM = use_unicode ? "\u2534" : "+";  // ┴
//     const char* BR = use_unicode ? "\u2518" : "+";  // ┘
//     const char* VL = use_unicode ? "\u2502" : "|";  // │
//     const char  HL = use_unicode ? '-' : '-';       // ─ → use '-' in both
//
//     // --- Helper: horizontal line ---
//     auto hline = [&](const char* left, const char* mid, const char* right) {
//         std::cout << left;
//         for (size_t c = 0; c < ColumnCount(); ++c) {
//             if (c > 0) std::cout << mid;
//             std::cout << std::string(widths[c] + 2, HL);
//         }
//         std::cout << right << "\n";
//     };
//
//     // --- Top border ---
//     hline(TL, TM, TR);
//
//     // --- Header ---
//     std::cout << VL;
//     for (size_t c = 0; c < ColumnCount(); ++c) {
//         if (c > 0) std::cout << VL;
//         std::cout << " " << std::left << std::setw(static_cast<int>(widths[c])) << names_[c] << " ";
//     }
//     std::cout << VL << "\n";
//
//     // --- Header separator ---
//     hline(ML, MM, MR);
//
//     // --- Rows ---
//     for (size_t r = 0; r < RowCount(); ++r) {
//         std::cout << VL;
//         for (size_t c = 0; c < ColumnCount(); ++c) {
//             if (c > 0) std::cout << VL;
//
//             std::string s = GetValue(c, r).ToString();
//
//             bool is_numeric = (types_[c].id() == LogicalTypeId::BIGINT ||
//                                types_[c].id() == LogicalTypeId::DOUBLE ||
//                                types_[c].id() == LogicalTypeId::BOOLEAN);
//
//             if (is_numeric && s != "NULL") {
//                 std::cout << " " << std::right << std::setw(static_cast<int>(widths[c])) << s << " ";
//             } else {
//                 std::cout << " " << std::left  << std::setw(static_cast<int>(widths[c])) << s << " ";
//             }
//         }
//         std::cout << VL << "\n";
//     }
//
//     // --- Bottom border ---
//     hline(BL, BM, BR);
// }
    void MaterializedQueryResult::Print() const {
    if (ColumnCount() == 0) {
        std::cout << "(empty result)\n";
        return;
    }

    // Compute max width per column
    std::vector<size_t> widths(ColumnCount(), 0);
    for (size_t c = 0; c < ColumnCount(); ++c) {
        widths[c] = names_[c].size();
        for (size_t r = 0; r < RowCount(); ++r) {
            std::string s = GetValue(c, r).ToString();
            widths[c] = std::max(widths[c], s.size());
        }
    }

    // Header
    for (size_t c = 0; c < ColumnCount(); ++c) {
        if (c > 0) std::cout << "  ";
        std::cout << std::left << std::setw(static_cast<int>(widths[c])) << names_[c];
    }
    std::cout << "\n";

    // Separator
    for (size_t c = 0; c < ColumnCount(); ++c) {
        if (c > 0) std::cout << "  ";
        std::cout << std::string(widths[c], '-');
    }
    std::cout << "\n";

    // Rows
    for (size_t r = 0; r < RowCount(); ++r) {
        for (size_t c = 0; c < ColumnCount(); ++c) {
            if (c > 0) std::cout << "  ";
            std::string s = GetValue(c, r).ToString();
            std::cout << std::left << std::setw(static_cast<int>(widths[c])) << s;
        }
        std::cout << "\n";
    }
}

}  // namespace minidb