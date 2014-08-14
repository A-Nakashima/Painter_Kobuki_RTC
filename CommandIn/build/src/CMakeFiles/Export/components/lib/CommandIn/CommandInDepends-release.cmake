#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "CommandIn" for configuration "Release"
set_property(TARGET CommandIn APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(CommandIn PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/components/lib/CommandIn.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "RTC110;coil110;omniORB415_rt;omniDynamic415_rt;omnithread34_rt;advapi32;ws2_32;mswsock"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/components/bin/CommandIn.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS CommandIn )
list(APPEND _IMPORT_CHECK_FILES_FOR_CommandIn "${_IMPORT_PREFIX}/components/lib/CommandIn.lib" "${_IMPORT_PREFIX}/components/bin/CommandIn.dll" )

# Import target "CommandInComp" for configuration "Release"
set_property(TARGET CommandInComp APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(CommandInComp PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/components/bin/CommandInComp.exe"
  )

list(APPEND _IMPORT_CHECK_TARGETS CommandInComp )
list(APPEND _IMPORT_CHECK_FILES_FOR_CommandInComp "${_IMPORT_PREFIX}/components/bin/CommandInComp.exe" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
