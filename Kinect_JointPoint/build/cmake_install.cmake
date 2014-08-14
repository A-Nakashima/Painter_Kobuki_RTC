# Install script for directory: C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint

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
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/Debug/Kinect_JointPoint.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/Release/Kinect_JointPoint.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/MinSizeRel/Kinect_JointPoint.lib")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/RelWithDebInfo/Kinect_JointPoint.lib")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "applications")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE SHARED_LIBRARY FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/Debug/Kinect_JointPoint.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE SHARED_LIBRARY FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/Release/Kinect_JointPoint.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE SHARED_LIBRARY FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/MinSizeRel/Kinect_JointPoint.dll")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE SHARED_LIBRARY FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/RelWithDebInfo/Kinect_JointPoint.dll")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "applications")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "applications")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE EXECUTABLE FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/Debug/Kinect_JointPointComp.exe")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE EXECUTABLE FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/Release/Kinect_JointPointComp.exe")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE EXECUTABLE FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/MinSizeRel/Kinect_JointPointComp.exe")
  ELSEIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE EXECUTABLE FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/RelWithDebInfo/Kinect_JointPointComp.exe")
  ENDIF()
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "applications")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "applications")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE FILE FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/RTC.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "applications")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "documents")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0" TYPE DIRECTORY FILES "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/doc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "documents")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "sources")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0/src" TYPE FILE FILES
    "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/Kinect_JointPoint.cpp"
    "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/Kinect_JointPoint.h"
    "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/Kinect_JointPointComp.cpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "sources")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "sources")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0/src" TYPE FILE FILES
    "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/CMakeLists.txt"
    "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/Doxyfile.in"
    "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/RTC.xml"
    "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/Kinect_JointPoint.conf"
    "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/rtc.conf"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "sources")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "sources")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/components/c++/kinect_jointpoint1.0.0/src" TYPE DIRECTORY FILES
    "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/cmake_modules"
    "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/cpack_resources"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "sources")

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "C:/Users/Datsuo/workspace/RTsummer/Kinect_JointPoint/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
