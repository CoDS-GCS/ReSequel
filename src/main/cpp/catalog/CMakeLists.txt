file(GLOB CATALOG_SOURCES "*.cpp")
file(GLOB CATALOG_HEADERS "*.h")

add_library(catalog_objs OBJECT ${CATALOG_SOURCES} ${CATALOG_HEADERS})

target_link_libraries(catalog_objs
        PRIVATE
            db_objs util_objs
            duckdb_static
            pthread dl m
            Threads::Threads
)

target_include_directories(
        catalog_objs
        INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

target_compile_options(catalog_objs PRIVATE -O3 -march=native)

