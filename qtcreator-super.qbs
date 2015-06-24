import qbs
import qbs.File
import qbs.FileInfo

Project {
    name: "Qt Creator Super Project"

    qbsSearchPaths: ["qbs_resources", "qtcreator/qbs"]
    property path licenseManagingDir: path + "/qtsdk-enterprise/license-managing"
    property bool licenseCheckerEnabled: File.exists(licenseManagingDir)

    SubProject {
        filePath: "qtcreator/qtcreator.qbs"
        Properties {
            additionalPlugins: {
                var candidates = [
                    "autotest", "boot2qt", "clangstaticanalyzer", "licensechecker",
                    "perfprofiler", "qmlprofiler", "vxworks"
                ];
                var plugins = [];
                candidates.forEach(function(candidate) {
                    var file = FileInfo.joinPaths(path, candidate, "plugins", candidate,
                                             candidate + ".qbs");
                    if (File.exists(file)
                            && (candidate !== "licensechecker" || licenseCheckerEnabled)) {
                        plugins.push(file);
                    }
                });
                return plugins;
            }
            additionalAutotests: [
                    path + "/clangstaticanalyzer/plugins/clangstaticanalyzer/tests/tests.qbs",
                ].filter(function(candidate) { return File.exists(candidate); });
        }
    }
}
