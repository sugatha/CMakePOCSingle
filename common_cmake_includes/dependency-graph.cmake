find_program(DOT_EXE "dot")
if(DOT_EXE)
  message(STATUS "dot found: ${DOT_EXE}")
else()
  message(STATUS "dot not found!")
endif()

if(NOT DOT_EXE)
  option(
    BUILD_DEP_GRAPH
    "Builds a visual representation of the dependencies of that included targets"
    OFF)
else()
  option(
    BUILD_DEP_GRAPH
    "Builds a visual representation of the dependencies of that included targets"
    ON)
endif()

function(generate_graph IMG_TYPE)
  
    if(NOT DOT_EXE)
      message(FATAL_ERROR "`dot` is needed to build the dependency graph.")
    endif()

	add_custom_target(graphviz ALL
		COMMAND ${CMAKE_COMMAND} . "--graphviz=${PROJECT_NAME}.dot"
		COMMAND dot -T${IMG_TYPE} ${PROJECT_NAME}.dot -o ${PROJECT_NAME}.${IMG_TYPE}
		COMMENT
        "Dependency graph for ${PROJECT_NAME} generated and located at ${OUT_DIR}/${PROJECT_NAME}.${IMG_TYPE}")
endfunction()

