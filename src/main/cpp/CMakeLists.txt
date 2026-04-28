cmake_minimum_required(VERSION 3.29.2)
project(minidb LANGUAGES CXX)

# General settings
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/libraries")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/tools/cmake")
set(CTEST_BINARY_DIRECTORY "${PROJECT_SOURCE_DIR}/bin")

# Platform flags
if (APPLE)
    set(CMAKE_CXX_FLAGS "-std=c++20 -g -fPIC -Wno-deprecated-declarations")
    set(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} -undefined dynamic_lookup")
elseif (UNIX AND NOT APPLE)
    set(CMAKE_CXX_FLAGS "-std=c++20 -g -march=native -O3 -fPIC -Wno-deprecated-declarations -pthread")
endif ()

# Dependencies
find_package(PostgreSQL REQUIRED)
find_package(Threads REQUIRED)
find_package(duckdb QUIET)

# Optional: SIMD
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mavx2 -mfma")

find_package(PkgConfig QUIET)
if (PkgConfig_FOUND)
    pkg_check_modules(PQXX REQUIRED libpqxx)
else()
    find_package(pqxx REQUIRED)
endif ()

# Fetch and build DuckDB from source (handles all static deps automatically)
include(FetchContent)
FetchContent_Declare(
        duckdb
        GIT_REPOSITORY https://github.com/duckdb/duckdb.git
        GIT_TAG v1.4.2  # Pin to stable release; update as needed (e.g., main for latest)
        GIT_SHALLOW TRUE  # Faster download (shallow clone)
        SOURCE_SUBDIR ""  # Build from root
)

# Configure DuckDB build: Static only, release mode, core extensions (postgres_scanner for your use case)
set(DUCKDB_BUILD_SHARED OFF CACHE BOOL "Build shared library" FORCE)
set(BUILD_PARQUET_EXTENSION ON CACHE BOOL "Build Parquet extension" FORCE)  # For your Parquet export
set(BUILD_POSTGRES_EXTENSION ON CACHE BOOL "Build Postgres extension" FORCE)  # For ATTACH postgres
set(DUCKDB_EXTENSION_CONFIGS "" CACHE STRING "Extensions" FORCE)  # Use defaults + above
set(DUCKDB_BUILD_UNITTESTS OFF CACHE BOOL "Skip tests for speed" FORCE)
set(DUCKDB_BUILD_SAMPLES OFF CACHE BOOL "Skip samples" FORCE)

FetchContent_MakeAvailable(duckdb)

## Fetch and build nlohmann_json
#FetchContent_Declare(
#        nlohmann_json
#        URL https://github.com/nlohmann/json/releases/download/v3.12.0/json.tar.xz
#        #DOWNLOAD_NO_EXTRACT TRUE
#)
#FetchContent_MakeAvailable(nlohmann_json)
#add_library(nlohmann_json_lib INTERFACE)
#target_include_directories(nlohmann_json_lib INTERFACE ${nlohmann_json_SOURCE_DIR})
#add_library(nlohmann_json ALIAS nlohmann_json_lib)

#find_package(yaml-cpp CONFIG QUIET)
#if (NOT TARGET yaml-cpp::yaml-cpp)
#    include(FetchContent)
#    FetchContent_Declare(
#            yaml-cpp
#            GIT_REPOSITORY https://github.com/jbeder/yaml-cpp.git
#            GIT_TAG yaml-cpp-0.8.0
#    )
#    FetchContent_MakeAvailable(yaml-cpp)
#else()
#    message(STATUS "Using system yaml-cpp")
#endif()

add_subdirectory(util)
add_subdirectory(database)
add_subdirectory(catalog)
add_subdirectory(downsample)

# Main executable
add_executable(minidb
        main.cpp
)

# Collect object files from subdirectories
target_sources(minidb
        PRIVATE
            $<TARGET_OBJECTS:util_objs>
            $<TARGET_OBJECTS:db_objs>
            $<TARGET_OBJECTS:catalog_objs>
            $<TARGET_OBJECTS:downsample_objs>
)

# Include directories
target_include_directories(minidb
        PUBLIC
            $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/database>
            $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/util>
            $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/catalog>
            $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/downsample>
        PRIVATE
            ${PostgreSQL_INCLUDE_DIRS}
            ${PQXX_INCLUDE_DIRS}
)

# Link libraries
target_link_libraries(minidb
        PRIVATE
            duckdb_static Threads::Threads
            ${PostgreSQL_LIBRARIES}
            ${PQXX_LIBRARIES}
            pthread dl m
)

# Copy config.yaml
add_custom_command(TARGET minidb POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${PROJECT_SOURCE_DIR}/config/PGConfig.yaml"
            "$<TARGET_FILE_DIR:minidb>/config/PGConfig.yaml"

        COMMAND ${CMAKE_COMMAND} -E copy_directory
            "${PROJECT_SOURCE_DIR}/resources"
            "$<TARGET_FILE_DIR:minidb>/resources"

        COMMENT "Copying config/PGConfig.yaml to bin/"
)