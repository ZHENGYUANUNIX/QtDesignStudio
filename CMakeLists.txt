cmake_minimum_required(VERSION 3.9)

include(FeatureSummary)

project(QtDesignStudioTQtCSuper)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 17)

set(QTC_MERGE_BINARY_DIR ON)
set(BUILD_DESIGNSTUDIO ON CACHE BOOL "Build design studio" FORCE)
set(MULTILANGUAGE_SUPPORT_SUBDIRECTORY "${CMAKE_CURRENT_LIST_DIR}/qtquickdesigner/libs/multilanguage-support")
set(BUILD_PLUGINS Core;CppTools;Texteditor;QtSupport;ResourceEditor;QmlJSTools;QmlJSEditor;QmakeProjectManager;QmlDesigner;QmlPreview;ProjectExplorer;QmlProjectManager;MultiLanguage;specgenerator CACHE STRING "Build plugins" FORCE)

list(APPEND CMAKE_PREFIX_PATH
${CMAKE_BINARY_DIR}/cmake
)

add_subdirectory(qtcreator)
add_subdirectory(qtquickdesigner)
add_subdirectory(telemetry)

feature_summary(INCLUDE_QUIET_PACKAGES WHAT
PACKAGES_FOUND PACKAGES_NOT_FOUND
ENABLED_FEATURES DISABLED_FEATURES
)
