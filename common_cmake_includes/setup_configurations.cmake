# Setting the runtime output directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")

set(CMAKE_32BIT_COMPILER_FLAGS "/DWIN32 /D_WINDOWS")
set(CMAKE_32BIT_LINKER_FLAGS "/machine:x86")

set(CUSTOM_COMPILER_FLAG "")
set(CUSTOM_LINKER_FLAG "")

set(CMAKE_SUBSYSTEM_WIN_FLAGS "/SUBSYSTEM:WINDOWS")
set(CMAKE_SUBSYSTEM_CONSOLE_FLAGS "/SUBSYSTEM:CONSOLE")


# et the appropriate compiler and linker flags for 32bit
if("${CMAKE_SIZEOF_VOID_P}" STREQUAL "4")
	set(CUSTOM_COMPILER_FLAG ${CMAKE_32BIT_COMPILER_FLAGS})
	set(CUSTOM_LINKER_FLAG ${CMAKE_32BIT_LINKER_FLAGS})
endif()

# Setting up of the configuration Type
if(NOT SET_UP_CONFIGURATIONS_DONE)
    set(SET_UP_CONFIGURATIONS_DONE 1)

    if(CMAKE_CONFIGURATION_TYPES) # multiconfig generator?
        set(CMAKE_CONFIGURATION_TYPES "Debug;Release;MinSizeRel;RelWithDebInfo;Test" CACHE STRING "" FORCE) 
    else()
        if(NOT CMAKE_BUILD_TYPE)
            message("Defaulting to release build.")
            set(CMAKE_BUILD_TYPE Release CACHE STRING "" FORCE)
        endif()
        set_property(CACHE CMAKE_BUILD_TYPE PROPERTY HELPSTRING "Choose the type of build")
        # set the valid options for cmake-gui drop-down list
        set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug;Release;MinSizeRel;RelWithDebInfo;Test")
    endif()
    
    # The block defining the config related flags for compiler and linker.
    
    # Setting up the Debug configuration
    set(CMAKE_C_FLAGS_DEBUG "${CUSTOM_COMPILER_FLAG} /MDd /Zi /Ob0 /Od /RTC1")
    set(CMAKE_CXX_FLAGS_DEBUG "${CUSTOM_COMPILER_FLAG} /MDd /Zi /Ob0 /Od /RTC1")
    set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CUSTOM_LINKER_FLAG} ${CMAKE_SUBSYSTEM_CONSOLE_FLAGS} /debug /INCREMENTAL")
    
    # Setting up the Release configuration
    set(CMAKE_C_FLAGS_RELEASE "${CUSTOM_COMPILER_FLAG} /MD /O2 /Ob2 /DNDEBUG")
    set(CMAKE_CXX_FLAGS_RELEASE "${CUSTOM_COMPILER_FLAG} /MD /O2 /Ob2 /DNDEBUG")
    set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CUSTOM_LINKER_FLAG} /INCREMENTAL:NO")
    
    # Setting up the MinSizeRel configuration
    set(CMAKE_C_FLAGS_MINSIZEREL "${CUSTOM_COMPILER_FLAG} /MD /O1 /Ob1 /DNDEBUG")
    set(CMAKE_CXX_FLAGS_MINSIZEREL "${CUSTOM_COMPILER_FLAG} /MD /O1 /Ob1 /DNDEBUG")
    set(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "${CUSTOM_LINKER_FLAG} /INCREMENTAL:NO")
    
    # Setting up the RelWithDebInfo configuration
    set(CMAKE_C_FLAGS_RELWITHDEBINFO "${CUSTOM_COMPILER_FLAG} /MD /Zi /O2 /Ob1 /DNDEBUG")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CUSTOM_COMPILER_FLAG} /MD /Zi /O2 /Ob1 /DNDEBUG")
    set(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "${CUSTOM_LINKER_FLAG} /debug /INCREMENTAL")
        
    # Setting up the Test configuration
    set(CMAKE_C_FLAGS_TEST "${CUSTOM_COMPILER_FLAG} /MD /Zi /O2 /Ob1 /DNDEBUG /DTEST")
    set(CMAKE_CXX_FLAGS_TEST "${CUSTOM_COMPILER_FLAG} /MD /Zi /O2 /Ob1 /DNDEBUG /DTEST")
    set(CMAKE_EXE_LINKER_FLAGS_TEST "${CUSTOM_LINKER_FLAG} /debug /INCREMENTAL")
        
endif()