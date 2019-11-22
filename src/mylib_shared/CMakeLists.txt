#[[cmake_minimum_required(VERSION 3.12...3.16)

include_directories(${CMAKE_SOURCE_DIR}/mylib_static)
include_directories(${CMAKE_SOURCE_DIR}/../include)

link_directories(${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

# including the headers using the wildcard
file(GLOB headers *.h)

#creating the shared library
add_library(mylib_shared SHARED mylibshared.cpp ${headers})

set(UTIL_DIR ${CMAKE_SOURCE_DIR}/../library/lib/util)
find_package(UTIL 4.2 EXACT CONFIG REQUIRED)

target_link_libraries(mylib_shared PUBLIC mylib_static UTIL)
#target_link_libraries(mylib_shared optimized mylib_static UTIL)

# Adding a compiler flag
add_definitions(-DEXPMODULE)

]]