# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


SET(CPACK_BINARY_BUNDLE "")
SET(CPACK_BINARY_CYGWIN "")
SET(CPACK_BINARY_DEB "")
SET(CPACK_BINARY_DRAGNDROP "")
SET(CPACK_BINARY_NSIS "ON")
SET(CPACK_BINARY_OSXX11 "")
SET(CPACK_BINARY_PACKAGEMAKER "")
SET(CPACK_BINARY_RPM "")
SET(CPACK_BINARY_STGZ "")
SET(CPACK_BINARY_TBZ2 "")
SET(CPACK_BINARY_TGZ "")
SET(CPACK_BINARY_TZ "")
SET(CPACK_BINARY_WIX "OFF")
SET(CPACK_BINARY_ZIP "OFF")
SET(CPACK_CMAKE_GENERATOR "Visual Studio 10")
SET(CPACK_COMPONENTS_ALL "component")
SET(CPACK_COMPONENTS_ALL_SET_BY_USER "TRUE")
SET(CPACK_COMPONENT_COMPONENT_DESCRIPTION "Component library and stand-alone executable")
SET(CPACK_COMPONENT_COMPONENT_DISPLAY_NAME "Applications")
SET(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
SET(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
SET(CPACK_GENERATOR "ZIP")
SET(CPACK_IGNORE_FILES "/CVS/;/\\.svn/;/\\.bzr/;/\\.hg/;/\\.git/;\\.swp$;\\.#;/#")
SET(CPACK_INSTALLED_DIRECTORIES "C:/Users/Datsuo/workspace/RTsummer/CommandIn;/")
SET(CPACK_INSTALL_CMAKE_PROJECTS "")
SET(CPACK_INSTALL_PREFIX "C:/Program Files (x86)/CommandIn")
SET(CPACK_MODULE_PATH "")
SET(CPACK_NSIS_DISPLAY_NAME "CommandIn100")
SET(CPACK_NSIS_EXTRA_INSTALL_COMMANDS "  Rename "$INSTDIR\share\commandin-1\commandin-config.cmake" "$INSTDIR\commandin-config.cmake"
  Rename "$INSTDIR\share\commandin-1\commandin-config-version.cmake" "$INSTDIR\commandin-config-version.cmake"")
SET(CPACK_NSIS_EXTRA_UNINSTALL_COMMANDS "  Delete "$INSTDIR\commandin-config.cmake"
  Delete "$INSTDIR\commandin-config-version.cmake"")
SET(CPACK_NSIS_HELP_LINK "http://www.openrtm.org")
SET(CPACK_NSIS_INSTALLER_ICON_CODE "")
SET(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
SET(CPACK_NSIS_INSTALL_ROOT "C:\Program Files (x86)")
SET(CPACK_NSIS_MODIFY_PATH "ON")
SET(CPACK_NSIS_MUI_ICON "C:/Users/Datsuo/workspace/RTsummer/CommandIn/cmake\rt_middleware_logo.ico")
SET(CPACK_NSIS_MUI_UNIICON "C:/Users/Datsuo/workspace/RTsummer/CommandIn/cmake\rt_middleware_logo.ico")
SET(CPACK_NSIS_PACKAGE_NAME "CommandIn100")
SET(CPACK_NSIS_URL_INFO_ABOUT "http://www.openrtm.org")
SET(CPACK_OUTPUT_CONFIG_FILE "C:/Users/Datsuo/workspace/RTsummer/CommandIn/build/CPackConfig.cmake")
SET(CPACK_PACKAGE_DEFAULT_LOCATION "/")
SET(CPACK_PACKAGE_DESCRIPTION_FILE "C:/Program Files (x86)/CMake 2.8/share/cmake-2.8/Templates/CPack.GenericDescription.txt")
SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Command Input Sample for GRobotRTC")
SET(CPACK_PACKAGE_EXECUTABLES "commandinComp;commandinComp")
SET(CPACK_PACKAGE_FILE_NAME "CommandIn-1.0.0-Source")
SET(CPACK_PACKAGE_ICON "C:/Users/Datsuo/workspace/RTsummer/CommandIn/cmake\rt_middleware_logo.bmp")
SET(CPACK_PACKAGE_INSTALL_DIRECTORY "CommandIn100")
SET(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "CommandIn100")
SET(CPACK_PACKAGE_NAME "CommandIn")
SET(CPACK_PACKAGE_RELOCATABLE "true")
SET(CPACK_PACKAGE_VENDOR "AIST")
SET(CPACK_PACKAGE_VERSION "1.0.0")
SET(CPACK_PACKAGE_VERSION_MAJOR "1")
SET(CPACK_PACKAGE_VERSION_MINOR "0")
SET(CPACK_PACKAGE_VERSION_PATCH "0")
SET(CPACK_PROJECT_CONFIG_FILE "C:/Users/Datsuo/workspace/RTsummer/CommandIn/build/cpack_options.cmake")
SET(CPACK_RESOURCE_FILE_LICENSE "C:/Users/Datsuo/workspace/RTsummer/CommandIn/cmake/License.rtf")
SET(CPACK_RESOURCE_FILE_README "C:/Program Files (x86)/CMake 2.8/share/cmake-2.8/Templates/CPack.GenericDescription.txt")
SET(CPACK_RESOURCE_FILE_WELCOME "C:/Program Files (x86)/CMake 2.8/share/cmake-2.8/Templates/CPack.GenericWelcome.txt")
SET(CPACK_SET_DESTDIR "OFF")
SET(CPACK_SOURCE_CYGWIN "")
SET(CPACK_SOURCE_GENERATOR "ZIP")
SET(CPACK_SOURCE_IGNORE_FILES "/CVS/;/\\.svn/;/\\.bzr/;/\\.hg/;/\\.git/;\\.swp$;\\.#;/#")
SET(CPACK_SOURCE_INSTALLED_DIRECTORIES "C:/Users/Datsuo/workspace/RTsummer/CommandIn;/")
SET(CPACK_SOURCE_OUTPUT_CONFIG_FILE "C:/Users/Datsuo/workspace/RTsummer/CommandIn/build/CPackSourceConfig.cmake")
SET(CPACK_SOURCE_PACKAGE_FILE_NAME "CommandIn-1.0.0-Source")
SET(CPACK_SOURCE_TBZ2 "")
SET(CPACK_SOURCE_TGZ "")
SET(CPACK_SOURCE_TOPLEVEL_TAG "win32-Source")
SET(CPACK_SOURCE_TZ "")
SET(CPACK_SOURCE_ZIP "ON")
SET(CPACK_STRIP_FILES "")
SET(CPACK_SYSTEM_NAME "win32")
SET(CPACK_TOPLEVEL_TAG "win32-Source")
SET(CPACK_WIX_LANG "ja-jp")
SET(CPACK_WIX_SIZEOF_VOID_P "4")
SET(CPACK_WIX_XSL "C:/Users/Datsuo/workspace/RTsummer/CommandIn/build/wix.xsl")