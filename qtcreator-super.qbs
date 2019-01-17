import qbs
import qbs.File
import qbs.FileInfo

Project {
    name: "Qt Creator Super Project"

    qbsSearchPaths: ["qbs_resources", "qtcreator/qbs"]
    property path licenseManagingDir: path + "/license-managing"
    property bool licenseCheckerEnabled: File.exists(licenseManagingDir)

    SubProject {
        filePath: "qtcreator/qtcreator.qbs"
        Properties {
            additionalPlugins: {
                var candidates = [
                    "boot2qt", "gammarayintegration", "licensechecker", "vxworks"
                ];
                var plugins = [];
                candidates.forEach(function(candidate) {
                    var file = FileInfo.joinPaths(path, candidate, "plugins", candidate,
                                             candidate + ".qbs");
                    if (!File.exists(file))
                        file = FileInfo.joinPaths(path, candidate, candidate + ".qbs");
                    if (File.exists(file)
                            && (candidate !== "licensechecker" || licenseCheckerEnabled)) {
                        plugins.push(file);
                    }
                });
                var specialCandidates = [
                    "boot2qt/plugins/qdb/qdb.qbs",
                    "qtapplicationmanagerintegration/plugins/qtapplicationmanager/qtapplicationmanager.qbs",
                    "qtquickdesigner/plugins/qmldesigner/isoiconbrowserplugin/isoiconbrowserplugin.qbs",
                ];
                specialCandidates.forEach(function(candidate) {
                    var file = FileInfo.joinPaths(path, candidate);
                    if (File.exists(file))
                        plugins.push(file);
                });
                return plugins;
            }
        }
    }
}
