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
                    "boot2qt", "gammarayintegration", "licensechecker",
                    "perfprofiler", "qmlpreview", "qtapplicationmanagerintegration", "vxworks"
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
                var isoIconBrowserPluginFile = path
                        + "/qtquickdesigner/plugins/qmldesigner/isoiconbrowserplugin/isoiconbrowserplugin.qbs";
                if (File.exists(isoIconBrowserPluginFile))
                    plugins.push(isoIconBrowserPluginFile);
                var qdbPluginFile = path + "/boot2qt/plugins/qdb/qdb.qbs";
                if (File.exists(qdbPluginFile))
                    plugins.push(qdbPluginFile);
                return plugins;
            }

            additionalTools: [path + "/perfparser/perfparser.qbs"]
        }
    }
}
