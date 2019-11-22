# ${CMAKE_SOURCE_DIR}/utillib/CMakeLists.txt
cmake_minimum_required(VERSION 3.12...3.16)

# A header only library

# setting the version of the header only library
set(UTIL_LIBRARY_VERSION_MAJOR 4 )
set(UTIL_LIBRARY_VERSION_MINOR 2 )

set(UTIL_LIBRARY_VERSION ${UTIL_LIBRARY_VERSION_MAJOR}.${UTIL_LIBRARY_VERSION_MINOR})

project(
  "UTIL"
  VERSION  ${UTIL_LIBRARY_VERSION}
  DESCRIPTION    "A header only c++ library"
)

set(CMAKE_INSTALL_PREFIX ${PROJECT_SOURCE_DIR}/../../library)

set(header_path "${CMAKE_CURRENT_SOURCE_DIR}/include")
set(header ${header_path}/myutilclass.h)

file(GLOB headers ${header_path}/*.h)

# creating the header only library
add_library(${PROJECT_NAME} INTERFACE)
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

# A standard include to handle the common keywords - like PROJECT_NAME, CMAKE_CURRENT_SOURCE_DIR
include(GNUInstallDirs)

target_include_directories(
  				${PROJECT_NAME}
  				INTERFACE	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
            				$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)
			
set(include_dest "include/${PROJECT_NAME}")
set(cmake_files_dest "cmake/${PROJECT_NAME}")
set(main_lib_dest "lib/${PROJECT_NAME}")
set(lib_dest "${main_lib_dest}/${CMAKE_BUILD_TYPE}")

include(CMakePackageConfigHelpers)

# creating a package.
write_basic_package_version_file("${PROJECT_NAME}ConfigVersion.cmake"
                                 VERSION ${PROJECT_VERSION}
                                 COMPATIBILITY SameMajorVersion)

configure_package_config_file(
  "${PROJECT_SOURCE_DIR}/${PROJECT_NAME}Config.cmake.in"
  "${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
  INSTALL_DESTINATION
  ${CMAKE_INSTALL_DATAROOTDIR}/${PROJECT_NAME}/cmake)
 

#installing - basically copying the headers to a location that other projects can refer to.
configure_file(${PROJECT_NAME}ConfigVersion.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake @ONLY)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake DESTINATION ${lib_dest})

install(TARGETS ${PROJECT_NAME} DESTINATION "${main_lib_dest}")
install(FILES ${headers} DESTINATION "${include_dest}")

install(TARGETS ${PROJECT_NAME} EXPORT ${PROJECT_NAME}Config DESTINATION "${lib_dest}")
install(EXPORT ${PROJECT_NAME}Config DESTINATION "${lib_dest}")

install(TARGETS ${PROJECT_NAME} EXPORT ${PROJECT_NAME}Targets DESTINATION "${lib_dest}")
install(EXPORT ${PROJECT_NAME}Targets DESTINATION "${lib_dest}")

