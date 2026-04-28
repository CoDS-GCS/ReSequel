file(GLOB DB_SOURCES "*.cpp")
file(GLOB DB_HEADERS "*.h")

add_library(db_objs OBJECT ${DB_SOURCES} ${DB_HEADERS})

target_link_libraries(db_objs PRIVATE util_objs)

target_include_directories(db_objs INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)