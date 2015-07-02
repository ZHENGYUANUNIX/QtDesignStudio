import qbs

QtcPlugin {
    Depends {
        name: "LicenseChecker"
        condition: project.licenseCheckerEnabled
    }
    cpp.defines: base.concat(project.licenseCheckerEnabled ? ["LICENSECHECKER"] : [])
}
