cmake_minimum_required(VERSION 3.12...3.16)

project(cmake_poc)

# Include the custom cmake common includes.
include (${CMAKE_CURRENT_SOURCE_DIR}/../common_cmake_includes/setup_configurations.cmake)
include (${CMAKE_CURRENT_SOURCE_DIR}/../common_cmake_includes/dependency-graph.cmake)

set(CMAKE_SHARED_LINKER_FLAGS_TEST "")
set( CMAKE_POSITION_INDEPENDENT_CODE ON )

# This will help in making use of the ccache to speeden-up the compilation.
find_program(CCACHE_PROGRAM ccache)
if(CCACHE_PROGRAM)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE "${CCACHE_PROGRAM}")
endif()


# adding the subdirectories in this project - the sequence of including is important
add_subdirectory(mylib_static)
add_subdirectory(utillib)
#add_subdirectory(mylib_shared)
add_subdirectory(theapp)


###########################################################################
# mylib_shared

include_directories(${CMAKE_SOURCE_DIR}/../include)
file(GLOB headers *.h)
add_library(mylib_shared SHARED ${CMAKE_SOURCE_DIR}/mylib_shared/mylibshared.cpp ${headers})
set(UTIL_DIR ${CMAKE_SOURCE_DIR}/../library/lib/util)
find_package(UTIL 4.2 EXACT CONFIG REQUIRED)
target_link_libraries(mylib_shared PUBLIC mylib_static UTIL)
add_definitions(-DEXPMODULE)

###########################################################################
#generate the dependency graph
generate_graph(png)

#add_dependencies(mylib_shared mylib_static)
#add_dependencies(theapp mylib_shared)

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT theapp)