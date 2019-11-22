# ${CMAKE_SOURCE_DIR}/theapp/CMakeLists.txt
cmake_minimum_required(VERSION 3.12...3.16)

# This app (theapp) uses a static and a shared library, hence including the directories
include_directories(${CMAKE_SOURCE_DIR}/../include)
include_directories(${CMAKE_SOURCE_DIR}/mylib_static)
include_directories(${CMAKE_SOURCE_DIR}/mylib_shared)

link_directories(${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

# Generating of headers, using the generator genfld using the csv.
add_custom_target(X64-Debug
    DEPENDS ${CMAKE_SOURCE_DIR}/../csvs fields.csv)

add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/../include/mstflds.h
	PRE_BUILD
    COMMAND ${CMAKE_SOURCE_DIR}/../generators/genfld.exe ARGS ${CMAKE_SOURCE_DIR}/../csvs fields.csv > ${CMAKE_SOURCE_DIR}/../include/mstflds.h	
	DEPENDS ${CMAKE_SOURCE_DIR}/../csvs/fields.csv
    COMMENT "Generating header file..."
)

add_custom_target(some_target ALL DEPENDS ${CMAKE_SOURCE_DIR}/../include/mstflds.h)

# creating of the application - theapp.exe
add_executable(theapp main.cpp)

target_link_libraries(theapp PUBLIC mylib_shared)
#target_link_libraries(theapp optimized mylib_shared)