cmake_minimum_required(VERSION 3.16)

include(FeatureSummary)

project(QtQuickDesignerExtensions)

option(BUILD_DESIGNSTUDIO "Build and install design studio plugins, examples and settings." OFF)
option(WITH_DESIGNSTUDIO_DATA "Installs design studio examples and settings." OFF)
option(CHECK_LICENSE "Enables that the plugins are checking the correct license" OFF)

find_package(QtCreator REQUIRED)
find_package(Qt5 COMPONENTS Core Widgets Qml Quick Xml REQUIRED)
find_package(Qt5 COMPONENTS Svg QUIET)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 17)

if (BUILD_DESIGNSTUDIO OR WITH_DESIGNSTUDIO_DATA)
    add_subdirectory(welcomepage)
    add_subdirectory(studiodata)
endif()

feature_summary(INCLUDE_QUIET_PACKAGES WHAT
  PACKAGES_FOUND PACKAGES_NOT_FOUND
  ENABLED_FEATURES DISABLED_FEATURES
)
