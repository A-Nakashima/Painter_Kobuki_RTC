#----------------------------------------------------------------
# Generated CMake target import file for configuration "MinSizeRel".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "CommandIn" for configuration "MinSizeRel"
set_property(TARGET CommandIn APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(CommandIn PROPERTIES
  IMPORTED_IMPLIB_MINSIZEREL "${_IMPORT_PREFIX}/components/lib/CommandIn.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_MINSIZEREL "RTC110;coil110;omniORB415_rt;omniDynamic415_rt;omnithread34_rt;advapi32;ws2_32;mswsock"
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/components/bin/CommandIn.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CommandIn )
list(APPEND _IMPORT_CHECK_FILES_FOR_CommandIn "${_IMPORT_PREFIX}/components/lib/CommandIn.lib" "${_IMPORT_PREFIX}/components/bin/CommandIn.dll" )

# Import target "CommandInComp" for configuration "MinSizeRel"
set_property(TARGET CommandInComp APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)
set_target_properties(CommandInComp PROPERTIES
  IMPORTED_LOCATION_MINSIZEREL "${_IMPORT_PREFIX}/components/bin/CommandInComp.exe"
  )

list(APPEND _IMPORT_CHECK_TARGETS CommandInComp )
list(APPEND _IMPORT_CHECK_FILES_FOR_CommandInComp "${_IMPORT_PREFIX}/components/bin/CommandInComp.exe" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
