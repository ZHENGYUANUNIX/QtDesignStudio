TEMPLATE = subdirs

!contains(QT_CONFIG, openssl):!contains(QT_CONFIG, openssl-linked) {
    error("LicenseChecker requires OpenSSL support in Qt. Giving up.")
}

SUBDIRS = \
    qtcreator \
    licensechecker \
    qmlprofilerextension \
    qtquickdesignerextension \
    b2qt


qtcreator.file = qt-creator/qtcreator.pro
mkpath($$OUT_PWD/qt-creator) # so the qtcreator.pro is able to create a .qmake.cache there

licensechecker.file = licensechecker/licensechecker.pro
licensechecker.depends = qtcreator

qmlprofilerextension.file = qmlprofiler/qmlprofiler.pro
qmlprofilerextension.depends = qtcreator licensechecker

qtquickdesignerextension.file = qtquickdesigner/qmldesignerextension.pro
qtquickdesignerextension.depends = qtcreator licensechecker

b2qt.file = b2qt-qtcreator-plugin/boot2qt.pro
b2qt.depends = qtcreator licensechecker

OTHER_FILES += .qmake.conf
