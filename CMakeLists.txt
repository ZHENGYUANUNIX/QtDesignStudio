cmake_minimum_required(VERSION 3.16)


include(FeatureSummary)

project(QtDesignStudioTQtCSuper)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 17)

set(QTC_MERGE_BINARY_DIR ON)
set(BUILD_DESIGNSTUDIO ON CACHE BOOL "Build design studio" FORCE)
set(MULTILANGUAGE_SUPPORT_SUBDIRECTORY "${CMAKE_CURRENT_LIST_DIR}/qtquickdesigner/libs/multilanguage-support")
## Add paths to get the real QtCreator -> QtDesignStudio branding
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/qtquickdesigner/studiodata/branding")

set(BUILD_PLUGINS
    Core CppEditor Designer Texteditor CodePaster Help
    DiffEditor ProjectExplorer VcsBase Debugger
    QtSupport ResourceEditor QmlJSTools QmlJSEditor
    QmakeProjectManager QmlDesigner QmlPreview
    QmlProjectManager AssetImporterPlugin
    IsoIconBrowserPlugin StudioPlugin StudioWelcome
    Android LanguageClient MultiLanguage
    assetexporterplugin componentsplugin qmlpreviewplugin qtquickplugin
    CACHE STRING "Build plugins" FORCE)

list(APPEND CMAKE_PREFIX_PATH
${CMAKE_BINARY_DIR}/cmake
)
find_package(Qt6 QUIET)

if (NOT Qt6_FOUND)
    list(APPEND BUILD_PLUGINS SpecGenerator)
endif ()

add_subdirectory(qtcreator)
add_subdirectory(qtquickdesigner)
if (NOT Qt6_FOUND)
    add_subdirectory(telemetry)
endif ()


feature_summary(INCLUDE_QUIET_PACKAGES WHAT
PACKAGES_FOUND PACKAGES_NOT_FOUND
ENABLED_FEATURES DISABLED_FEATURES
)
