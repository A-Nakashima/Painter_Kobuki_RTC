# CommandIn CMake config file
#
# This file sets the following variables:
# CommandIn_FOUND - Always TRUE.
# CommandIn_INCLUDE_DIRS - Directories containing the CommandIn include files.
# CommandIn_IDL_DIRS - Directories containing the CommandIn IDL files.
# CommandIn_LIBRARIES - Libraries needed to use CommandIn.
# CommandIn_DEFINITIONS - Compiler flags for CommandIn.
# CommandIn_VERSION - The version of CommandIn found.
# CommandIn_VERSION_MAJOR - The major version of CommandIn found.
# CommandIn_VERSION_MINOR - The minor version of CommandIn found.
# CommandIn_VERSION_REVISION - The revision version of CommandIn found.
# CommandIn_VERSION_CANDIDATE - The candidate version of CommandIn found.

message(STATUS "Found CommandIn-1.0.0")
set(CommandIn_FOUND TRUE)

find_package(<dependency> REQUIRED)

#set(CommandIn_INCLUDE_DIRS
#    "C:/Program Files (x86)/CommandIn/include/commandin-1"
#    ${<dependency>_INCLUDE_DIRS}
#    )
#
#set(CommandIn_IDL_DIRS
#    "C:/Program Files (x86)/CommandIn/include/commandin-1/idl")
set(CommandIn_INCLUDE_DIRS
    "C:/Program Files (x86)/CommandIn/include/"
    ${<dependency>_INCLUDE_DIRS}
    )
set(CommandIn_IDL_DIRS
    "C:/Program Files (x86)/CommandIn/include//idl")


if(WIN32)
    set(CommandIn_LIBRARIES
        "C:/Program Files (x86)/CommandIn/components/lib/commandin.lib"
        ${<dependency>_LIBRARIES}
        )
else(WIN32)
    set(CommandIn_LIBRARIES
        "C:/Program Files (x86)/CommandIn/components/lib/commandin.dll"
        ${<dependency>_LIBRARIES}
        )
endif(WIN32)

set(CommandIn_DEFINITIONS ${<dependency>_DEFINITIONS})

set(CommandIn_VERSION 1.0.0)
set(CommandIn_VERSION_MAJOR 1)
set(CommandIn_VERSION_MINOR 0)
set(CommandIn_VERSION_REVISION 0)
set(CommandIn_VERSION_CANDIDATE )

