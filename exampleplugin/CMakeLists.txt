cmake_minimum_required(VERSION 3.16)
include(FeatureSummary)
find_package(QtCreator REQUIRED)

add_qtc_plugin(ExamplePlugin
    PLUGIN_DEPENDS
        QtCreator::Core QtCreator::QmlDesigner QtCreator::QmlProjectManager QtCreator::ProjectExplorer
    DEPENDS
        QtCreator::Utils
        Qt5::Core Qt5::CorePrivate Qt5::Widgets
        Qt5::Qml Qt5::QmlPrivate Qt5::Quick
    SOURCES
        exampleplugin.cpp
        exampleplugin.h
        examplepluginview.cpp
        examplepluginview.h
        examplepluginviewwidget.cpp
        examplepluginviewwidget.h
        exampleplugin_global.h
)

feature_summary(INCLUDE_QUIET_PACKAGES WHAT
PACKAGES_FOUND PACKAGES_NOT_FOUND
ENABLED_FEATURES DISABLED_FEATURES
)
