# utilconfigversion.cmake - checks version: major must match, minor must be less than or equal

set(PACKAGE_VERSION 4.2)

if("${PACKAGE_FIND_VERSION_MAJOR}" EQUAL "4")
    if ("${PACKAGE_FIND_VERSION_MINOR}" EQUAL "2")
        set(PACKAGE_VERSION_EXACT TRUE)
    elseif("${PACKAGE_FIND_VERSION_MINOR}" LESS "2")
        set(PACKAGE_VERSION_COMPATIBLE TRUE)
    else()
        set(PACKAGE_VERSION_UNSUITABLE TRUE)
    endif()
else()
    set(PACKAGE_VERSION_UNSUITABLE TRUE)
endif()
