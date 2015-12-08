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

!isEmpty(QT.GammaRayClient.name) {
    SUBDIRS += gammarayintegration
    gammarayintegration.depends = qtcreator
}

linux-g++*{
    SUBDIRS += perfparser
    PERFPARSER_BUNDLED_ELFUTILS = true
    PERFPARSER_APP_DESTDIR = $$IDE_BUILD_TREE/libexec/qtcreator
    PERFPARSER_ELFUTILS_DESTDIR = $$IDE_BUILD_TREE/lib/qtcreator
    PERFPARSER_APP_INSTALLDIR = $$QTC_PREFIX/libexec/qtcreator
    PERFPARSER_ELFUTILS_INSTALLDIR = $$QTC_PREFIX/lib/qtcreator
    cache(PERFPARSER_BUNDLED_ELFUTILS)
    cache(PERFPARSER_APP_DESTDIR)
    cache(PERFPARSER_ELFUTILS_DESTDIR)
    cache(PERFPARSER_APP_INSTALLDIR)
    cache(PERFPARSER_ELFUTILS_INSTALLDIR)
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
    !contains(QT_CONFIG, openssl):!contains(QT_CONFIG, openssl-linked):!contains(QT_CONFIG, securetransport): \
        error("LicenseChecker requires OpenSSL support in Qt. Giving up.")

    SUBDIRS += licensechecker
    licensechecker.depends = qtcreator
    perfprofiler.depends += licensechecker
    qmlprofiler.depends += licensechecker
    qtquickdesigner.depends += licensechecker
    boot2qt.depends += licensechecker
    clangstaticanalyzer.depends += licensechecker
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
