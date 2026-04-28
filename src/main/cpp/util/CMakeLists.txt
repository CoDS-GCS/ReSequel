file(GLOB UTIL_SOURCES "*.cpp")
file(GLOB UTIL_HEADERS "*.h")

add_library(util_objs OBJECT ${UTIL_SOURCES} ${UTIL_HEADERS})

target_include_directories(util_objs INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)