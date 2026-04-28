#ifndef UTIL_H
#define UTIL_H

#include <string>
#include <utility>
#include <functional>

static inline size_t rotl(size_t x, int r) {
    return (x << r) | (x >> (64 - r));
}

struct PairHash {
    size_t operator()(const std::pair<std::string, std::string>& p) const noexcept {
        size_t h1 = std::hash<std::string>{}(p.first);
        size_t h2 = std::hash<std::string>{}(p.second);

        // lightweight mixing
        h1 ^= rotl(h2, 13);
        h2 ^= rotl(h1, 7);

        return h1 ^ (h2 * 0x9e3779b97f4a7c15ULL);
    }
};

struct Tuple3Hash {
    template <typename T1, typename T2, typename T3>
    size_t operator()(const std::tuple<T1,T2,T3>& t) const noexcept {
        size_t h1 = std::hash<T1>{}(std::get<0>(t));
        size_t h2 = std::hash<T2>{}(std::get<1>(t));
        size_t h3 = std::hash<T3>{}(std::get<2>(t));

        // combine (boost style)
        h1 ^= h2 + 0x9e3779b97f4a7c15ULL + (h1<<6) + (h1>>2);
        h1 ^= h3 + 0x9e3779b97f4a7c15ULL + (h1<<6) + (h1>>2);

        return h1;
    }
};

#endif //UTIL_H
