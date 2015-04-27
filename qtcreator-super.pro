TEMPLATE = subdirs

mkpath($$OUT_PWD/qtcreator) # so the qtcreator.pro is able to create a .qmake.cache there

SUBDIRS = \
    qtcreator \
    perfprofiler \
    qmlprofiler \
    qtquickdesigner \
    boot2qt \
    clangstaticanalyzer \
    vxworks \
    autotest

exists(gammaray-qtc-integration/gammarayintegration.pro):!isEmpty(QT.GammaRayClient.name) {
    SUBDIRS += gammaray
    gammaray.file = gammaray-qtc-integration/gammarayintegration.pro
    gammaray.depends = qtcreator
}

perfprofiler.depends = qtcreator

qmlprofiler.depends = qtcreator

qtquickdesigner.depends = qtcreator

boot2qt.depends = qtcreator perfprofiler

clangstaticanalyzer.depends = qtcreator

vxworks.depends = qtcreator

autotest.depends = qtcreator

OTHER_FILES += .qmake.conf

!exists(licensechecker/licensechecker.pro): CONFIG += no_licensechecker

!no_licensechecker {
    !contains(QT_CONFIG, openssl):!contains(QT_CONFIG, openssl-linked): \
        error("LicenseChecker requires OpenSSL support in Qt. Giving up.")

    SUBDIRS += licensechecker
    licensechecker.depends = qtcreator
    perfprofiler.depends += licensechecker
    qmlprofiler.depends += licensechecker
    qtquickdesigner.depends += licensechecker
    boot2qt.depends += licensechecker
    clangstaticanalyser.depends += licensechecker
    vxworks.depends += licensechecker
    autotest.depends += licensechecker

    !licensechecker {
        # make it available to sub-project files
        CONFIG_LICENSECHECKER = licensechecker
        cache(CONFIG, add, CONFIG_LICENSECHECKER)
    }
} else {
    licensechecker {
        # remove cached value
        CONFIG_LICENSECHECKER = licensechecker
        cache(CONFIG, sub, CONFIG_LICENSECHECKER)
    }
}
