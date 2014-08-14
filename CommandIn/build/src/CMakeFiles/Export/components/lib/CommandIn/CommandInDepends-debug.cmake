#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "CommandIn" for configuration "Debug"
set_property(TARGET CommandIn APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CommandIn PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/components/lib/CommandIn.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "RTC110d;coil110d;omniORB415_rtd;omniDynamic415_rtd;omnithread34_rtd;advapi32;ws2_32;mswsock"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/components/bin/CommandIn.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CommandIn )
list(APPEND _IMPORT_CHECK_FILES_FOR_CommandIn "${_IMPORT_PREFIX}/components/lib/CommandIn.lib" "${_IMPORT_PREFIX}/components/bin/CommandIn.dll" )

# Import target "CommandInComp" for configuration "Debug"
set_property(TARGET CommandInComp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(CommandInComp PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/components/bin/CommandInComp.exe"
  )

list(APPEND _IMPORT_CHECK_TARGETS CommandInComp )
list(APPEND _IMPORT_CHECK_FILES_FOR_CommandInComp "${_IMPORT_PREFIX}/components/bin/CommandInComp.exe" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
