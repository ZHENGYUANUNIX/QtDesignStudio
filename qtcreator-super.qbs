import qbs

Project {
    name: "Qt Creator Super Project"

    qbsSearchPaths: "qtcreator/qbs"

    SubProject {
        filePath: "qtcreator/qtcreator.qbs"
        Properties {
            additionalPlugins: [path + "/b2qt-qtcreator-plugin/plugins/boot2qt/boot2qt.qbs"]
        }
    }
}
