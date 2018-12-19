TEMPLATE = subdirs

mkpath($$OUT_PWD/qtcreator) # so the qtcreator.pro is able to create a .qmake.cache there

SUBDIRS = \
    qtcreator \
    qtquickdesigner \
    boot2qt \
    vxworks \
    qmlpreview

!isEmpty(QT.GammaRayClient.name) {
    SUBDIRS += gammarayintegration
    gammarayintegration.depends = qtcreator boot2qt
}

exists(qtapplicationmanagerintegration/qtapplicationmanagerintegration.pro) {
    SUBDIRS += qtapplicationmanagerintegration
    qtapplicationmanagerintegration.depends = qtcreator boot2qt
}

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
