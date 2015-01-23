import qbs

Project {
    name: "Qt Creator Super Project"

    qbsSearchPaths: "qtcreator/qbs"
    property path licenseManagingDir: path + "/qtsdk-enterprise/license-managing"

    SubProject {
        filePath: "qtcreator/qtcreator.qbs"
        Properties {
            additionalPlugins: [
                path + "/boot2qt/plugins/boot2qt/boot2qt.qbs",
                path + "/clangstaticanalyzer/plugins/clangstaticanalyzer/clangstaticanalyzer.qbs",
                path + "/licensechecker/plugins/licensechecker/licensechecker.qbs",
                path + "/qmlprofiler/plugins/qmlprofilerextension/qmlprofilerextension.qbs",
            ]
            additionalAutotests: [
                path + "/clangstaticanalyzer/plugins/clangstaticanalyzer/tests/tests.qbs",
            ]
        }
    }
}
