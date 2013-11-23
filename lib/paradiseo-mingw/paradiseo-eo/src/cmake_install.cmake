# Install script for directory: C:/ParadisEO-1.2/paradiseo-eo/src

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/EO")
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

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("C:/ParadisEO-1.2/paradiseo-eo/src/do/cmake_install.cmake")
  INCLUDE("C:/ParadisEO-1.2/paradiseo-eo/src/es/cmake_install.cmake")
  INCLUDE("C:/ParadisEO-1.2/paradiseo-eo/src/ga/cmake_install.cmake")
  INCLUDE("C:/ParadisEO-1.2/paradiseo-eo/src/gp/cmake_install.cmake")
  INCLUDE("C:/ParadisEO-1.2/paradiseo-eo/src/moo/cmake_install.cmake")
  INCLUDE("C:/ParadisEO-1.2/paradiseo-eo/src/other/cmake_install.cmake")
  INCLUDE("C:/ParadisEO-1.2/paradiseo-eo/src/utils/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

