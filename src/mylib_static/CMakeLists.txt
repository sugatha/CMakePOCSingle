# ${CMAKE_SOURCE_DIR}/mylib_static/CMakelists.txt

cmake_minimum_required(VERSION 3.12...3.16)

# setting up the version for the static library.
set(UTIL_LIBRARY_VERSION_MAJOR 1 )
set(UTIL_LIBRARY_VERSION_MINOR 0 )
set(UTIL_LIBRARY_VERSION ${UTIL_LIBRARY_VERSION_MAJOR}.${UTIL_LIBRARY_VERSION_MINOR})


project(
  "mylib_static"
  VERSION  ${UTIL_LIBRARY_VERSION}
  DESCRIPTION    "A static library"
)

#creating the static library
add_library(mylib_static STATIC myclass.cpp myclass.h)

include_directories(${CMAKE_SOURCE_DIR}/../include)

set_target_properties(mylib_static PROPERTIES POSITION_INDEPENDENT_CODE ON)

# Adding a compiler flag 
add_definitions(-DEXPMODULE)
