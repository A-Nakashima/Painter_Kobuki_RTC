# Install script for directory: C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/OpenRTM-aist/1.1")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/Debug/SetKobukiVelo.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/Release/SetKobukiVelo.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/MinSizeRel/SetKobukiVelo.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/RelWithDebInfo/SetKobukiVelo.lib")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "applications")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE SHARED_LIBRARY FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/Debug/SetKobukiVelo.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE SHARED_LIBRARY FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/Release/SetKobukiVelo.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE SHARED_LIBRARY FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/MinSizeRel/SetKobukiVelo.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE SHARED_LIBRARY FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/RelWithDebInfo/SetKobukiVelo.dll")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "applications")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "applications")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE EXECUTABLE FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/Debug/SetKobukiVeloComp.exe")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE EXECUTABLE FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/Release/SetKobukiVeloComp.exe")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE EXECUTABLE FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/MinSizeRel/SetKobukiVeloComp.exe")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE EXECUTABLE FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/RelWithDebInfo/SetKobukiVeloComp.exe")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "applications")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "applications")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE FILE FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/RTC.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "applications")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "documents")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0" TYPE DIRECTORY FILES "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/doc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "documents")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "sources")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0/src" TYPE FILE FILES
    "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/SetKobukiVelo.cpp"
    "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/SetKobukiVelo.h"
    "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/SetKobukiVeloComp.cpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "sources")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "sources")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0/src" TYPE FILE FILES
    "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/CMakeLists.txt"
    "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/Doxyfile.in"
    "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/RTC.xml"
    "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/SetKobukiVelo.conf"
    "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/rtc.conf"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "sources")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "sources")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/setkobukivelo1.0.0/src" TYPE DIRECTORY FILES
    "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/cmake_modules"
    "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/cpack_resources"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "sources")

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "C:/Users/Datsuo/workspace/RTsummer/SetKobukiVelo/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
