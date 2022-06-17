cmake_minimum_required(VERSION 3.16)


include(FeatureSummary)

project(QtDesignStudioTQtCSuper)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 17)

set(QTC_MERGE_BINARY_DIR ON)
set(BUILD_DESIGNSTUDIO ON CACHE BOOL "Build design studio" FORCE)
## Add paths to get the real QtCreator -> QtDesignStudio branding
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/designstudio/studiodata/branding")

set(BUILD_PLUGINS
    Core CppEditor Designer Texteditor CodePaster Help
    DiffEditor ProjectExplorer VcsBase Debugger
    QtSupport ResourceEditor QmlJSTools QmlJSEditor
    QmakeProjectManager QmlDesigner QmlPreview
    QmlProjectManager AssetImporterPlugin
    IsoIconBrowserPlugin StudioPlugin StudioWelcome
    Android LanguageClient MultiLanguage
    assetexporterplugin componentsplugin qmlpreviewplugin qtquickplugin ExamplePlugin
    CACHE STRING "Build plugins" FORCE)

list(APPEND CMAKE_PREFIX_PATH
${CMAKE_BINARY_DIR}/cmake
)
find_package(Qt6 QUIET)

add_subdirectory(qtcreator)
add_subdirectory(designstudio)
add_subdirectory(exampleplugin)

feature_summary(INCLUDE_QUIET_PACKAGES WHAT
PACKAGES_FOUND PACKAGES_NOT_FOUND
ENABLED_FEATURES DISABLED_FEATURES
)
