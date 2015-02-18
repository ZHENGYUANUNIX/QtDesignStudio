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

licensechecker.depends = qtcreator

perfprofiler.depends = qtcreator licensechecker

qmlprofiler.depends = qtcreator licensechecker

qtquickdesigner.depends = qtcreator licensechecker

boot2qt.depends = qtcreator licensechecker

clangstaticanalyzer.depends = qtcreator licensechecker

vxworks.depends = qtcreator licensechecker

autotest.depends = qtcreator licensechecker

OTHER_FILES += .qmake.conf
