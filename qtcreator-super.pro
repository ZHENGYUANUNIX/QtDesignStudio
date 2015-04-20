TEMPLATE = subdirs

!contains(QT_CONFIG, openssl):!contains(QT_CONFIG, openssl-linked) {
    error("LicenseChecker requires OpenSSL support in Qt. Giving up.")
}

mkpath($$OUT_PWD/qtcreator) # so the qtcreator.pro is able to create a .qmake.cache there

SUBDIRS = \
    qtcreator \
    licensechecker \
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

licensechecker.depends = qtcreator

perfprofiler.depends = qtcreator licensechecker

qmlprofiler.depends = qtcreator licensechecker

qtquickdesigner.depends = qtcreator licensechecker

boot2qt.depends = qtcreator perfprofiler licensechecker

clangstaticanalyzer.depends = qtcreator licensechecker

vxworks.depends = qtcreator licensechecker

autotest.depends = qtcreator licensechecker

OTHER_FILES += .qmake.conf
