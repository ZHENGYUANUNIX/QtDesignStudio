TEMPLATE = subdirs

mkpath($$OUT_PWD/qtcreator) # so the qtcreator.pro is able to create a .qmake.cache there

SUBDIRS = \
    qtcreator \
    perfprofiler \
    qtquickdesigner \
    boot2qt \
    vxworks \
    qmlpreview

!isEmpty(QT.GammaRayClient.name) {
    SUBDIRS += gammarayintegration
    gammarayintegration.depends = qtcreator boot2qt
}

win32 {
    # Windows doesn't have system elfutils, so if no install dir is given we won't find them.
    !isEmpty(ELFUTILS_INSTALL_DIR): SUBDIRS += perfparser
    PERFPARSER_APP_DESTDIR = $$IDE_BUILD_TREE/bin
    PERFPARSER_APP_INSTALLDIR = $$QTC_PREFIX/bin

    # On windows we take advantage of the fixed path in eblopenbackend.c: "..\lib\elfutils\"
    PERFPARSER_ELFUTILS_INSTALLDIR = $$QTC_PREFIX/bin
    PERFPARSER_ELFUTILS_BACKENDS_INSTALLDIR = $$QTC_PREFIX/lib/elfutils
} else {
    linux-g++: SUBDIRS += perfparser
    PERFPARSER_APP_DESTDIR = $$IDE_BUILD_TREE/libexec/qtcreator
    PERFPARSER_APP_INSTALLDIR = $$QTC_PREFIX/libexec/qtcreator

    # On linux we have "$ORIGIN/../$LIB/elfutils" in eblopenbackend.c. Unfortunately $LIB can be
    # many different things, so we target the second try where it just loads the plain file name.
    # This also allows us to put libdw and libelf in a subdir of lib.
    PERFPARSER_ELFUTILS_INSTALLDIR = $$QTC_PREFIX/lib/elfutils
    PERFPARSER_ELFUTILS_BACKENDS_INSTALLDIR = $$QTC_PREFIX/lib/elfutils
}

cache(PERFPARSER_APP_DESTDIR)
cache(PERFPARSER_APP_INSTALLDIR)
cache(PERFPARSER_ELFUTILS_INSTALLDIR)
cache(PERFPARSER_ELFUTILS_BACKENDS_INSTALLDIR)

exists(qtapplicationmanagerintegration/qtapplicationmanagerintegration.pro) {
    SUBDIRS += qtapplicationmanagerintegration
    qtapplicationmanagerintegration.depends = qtcreator boot2qt
}

perfprofiler.depends = qtcreator

qtquickdesigner.depends = qtcreator

boot2qt.depends = qtcreator

vxworks.depends = qtcreator

qmlpreview.depends = qtcreator

!exists(licensechecker/licensechecker.pro): CONFIG += no_licensechecker

!no_licensechecker {

    greaterThan(QT_MAJOR_VERSION, 5)|greaterThan(QT_MINOR_VERSION, 7) { # Qt 5.8 or later
        QT_FOR_CONFIG += network
        !qtConfig(ssl): error("LicenseChecker requires OpenSSL/SecureTransport support in Qt. Giving up.")
    } else {
        !contains(QT_CONFIG, openssl):!contains(QT_CONFIG, openssl-linked):!contains(QT_CONFIG, securetransport): \
            error("LicenseChecker requires OpenSSL/SecureTransport support in Qt. Giving up.")
    }
    SUBDIRS += licensechecker
    licensechecker.depends = qtcreator
    perfprofiler.depends += licensechecker
    qtquickdesigner.depends += licensechecker
    boot2qt.depends += licensechecker
    vxworks.depends += licensechecker
    qmlpreview.depends += licensechecker

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

OTHER_FILES += \
    .qmake.conf \
    qtcreator-super.qbs \
    qbs_resources/imports/QtcCommercialPlugin.qbs \
    README
