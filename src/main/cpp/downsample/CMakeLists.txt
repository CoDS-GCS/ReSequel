file(GLOB DOWNSAMPLE_SOURCES "*.cpp")
file(GLOB DOWNSAMPLE_HEADERS "*.h")

add_library(downsample_objs OBJECT ${DOWNSAMPLE_SOURCES} ${DOWNSAMPLE_HEADERS})

target_link_libraries(downsample_objs
        PRIVATE
            db_objs
            catalog_objs
            util_objs
            duckdb_static
            pthread dl m
            Threads::Threads
)

target_include_directories(
        downsample_objs
        INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

target_compile_options(downsample_objs PRIVATE -O3 -march=native)

