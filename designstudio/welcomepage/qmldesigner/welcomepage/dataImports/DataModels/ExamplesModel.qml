/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Creator.
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
****************************************************************************/

import QtQuick 2.0

ListModel {
    function resolveUrl(source)
    {
        if (typeof(source) === "undefined")
            return ""
        return Qt.resolvedUrl(source)
    }

    ListElement {
        projectName: "ClusterTutorial"
        qmlFileName: "content/Cluster_Art.ui.qml"
        thumbnail: "images/tutorialclusterdemo_thumbnail.png"
        displayName: "Cluster Tutorial"
        showDownload: true
        showUpdate: false
        tagData: "Qt 6, Timeline, Effects"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/ClusterTutorial.zip"
        description: "Simple example of a cluster that illustrates how to use the timeline to create custom gauges."
    }

    ListElement {
        projectName: "CoffeeMachine"
        qmlFileName: "content/ApplicationFlowForm.ui.qml"
        thumbnail: "images/coffeemachinedemo_thumbnail.png"
        displayName: "Coffee Machine"
        showDownload: true
        showUpdate: false
        tagData: "Qt 6, Timeline"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/CoffeeMachine.zip"
        description: "Demo of a Coffee Machine that illustrates how to use the timeline and states to animate transitions in a UI."
    }

    ListElement {
        projectName: "SideMenu"
        qmlFileName: "content/MainForm.ui.qml"
        thumbnail: "images/sidemenu_demo.png"
        displayName: "Side Menu"
        showDownload: true
        showUpdate: false
        tagData: "Qt 6, Effects"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/SideMenu.zip"
        description: "Demo that Illustrates how to create reusable components and an animated menu for applying 2D visual effects."
    }

    ListElement {
        projectName: "WebinarDemo"
        qmlFileName: "content/MainApp.ui.qml"
        thumbnail: "images/webinardemo_thumbnail.png"
        displayName: "Webinar Demo"
        showDownload: true
        showUpdate: false
        tagData: "Qt 6"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/WebinarDemo.zip"
        description: "Demo that contains sources for the From Photoshop to Prototype video tutorial."
    }

    ListElement {
        projectName: "EBikeDesign"
        qmlFileName: "content/Screen01.ui.qml"
        thumbnail: "images/ebike_demo_thumbnail.png"
        displayName: "E-Bike Design"
        showDownload: true
        showUpdate: false
        tagData: "Qt 6, Timeline"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/EBikeDesign.zip"
        description: "Demo of an Ebike UI that illustrates how to use the timeline and states to animate transitions in an application."
    }

    ListElement {
        projectName: "ProgressBar"
        qmlFileName: "content/ProgressBar.ui.qml"
        thumbnail: "images/progressbar_demo.png"
        displayName: "Progress Bar"
        showDownload: true
        showUpdate: false
        tagData: "Qt 6, Timeline"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/ProgressBar.zip"
        description: "Simple demo on how to use timelines to create an animated progress bar."
    }

    ListElement {
        projectName: "washingMachineUI"
        qmlFileName: "RunningScreen.ui.qml"
        thumbnail: "images/washingmachinedemo_thumbnail.png"
        displayName: "Washing Machine"
        showDownload: true
        showUpdate: false
        tagData: "Qt for MCU"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/washingMachineUI.zip"
        description: "The UI for a washing machine that demonstrates how to create a UI that can be run both on the desktop and on MCUs."
    }

    ListElement {
        projectName: "SimpleKeyboard"
        qmlFileName: "content/Measurements.ui.qml"
        thumbnail: "images/virtualkeyboard_thumbnail.png"
        displayName: "Virtual Keyboard"
        showDownload: true
        showUpdate: false
        tagData: "Keyboard"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/SimpleKeyboard.zip"
        description: "Virtual Keyboard shows how to use a virtual keyboard in an application."
    }

    ListElement {
        projectName: "highendivisystem"
        qmlFileName: "Screen01.ui.qml"
        thumbnail: "images/highendivi_thumbnail.png"
        displayName: "IVI System"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/highendivisystem.zip"
        showDownload: true
        showUpdate: false
        tagData: "Qt 5, 3D"
        description: "Demo of a Qt 5 based IVI system using Qt Quick 3D."
    }

    ListElement {
        projectName: "digitalcluster"
        qmlFileName: "Screen01.ui.qml"
        thumbnail: "images/digital_cluster_thumbnail.png"
        displayName: "Digital Cluster"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/digitalcluster.zip"
        showDownload: true
        showUpdate: false
        tagData: "Qt 5, 3D"
        description: "Demo of a Qt 5 based digital cluster using Qt Quick 3D."
    }

    ListElement {
        projectName: "EffectDemo"
        qmlFileName: "Screen01.ui.qml"
        thumbnail: "images/effectdemo_thumbnail.png"
        displayName: "Effect Demo"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/EffectDemo.zip"
        showDownload: true
        showUpdate: false
        tagData: "Qt 6, Effects"
        description: "Demo that shows how to use effects."
    }


    ListElement {
        projectName: "cppdemoproject"
        explicitQmlproject: "qml/qdsproject.qmlproject"
        qmlFileName: "WashingMachineHome/MainFile.ui.qml"
        thumbnail: "images/cppdemo_thumbnail.png"
        displayName: "C++ Demo Project"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/cppdemoproject.zip"
        showDownload: true
        showUpdate: false
        tagData: "Qt 5, C++"
        description: "Demo that shows to integrate a Qt Design Studio based project with Qt 5."
    }

    ListElement {
        projectName: "particles"
        qmlFileName: "Screen01.ui.qml"
        thumbnail: "images/particles_thumbnail.png"
        displayName: "Particle Demo"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/particles.zip"
        showDownload: true
        showUpdate: false
        tagData: "Qt 6, 3D, Particles"
        description: "Simple demo showing the capabilites of 3D particles."
    }

    ListElement {
        projectName: "thermo"
        qmlFileName: "thermo.ui.qml"
        thumbnail: "images/thermo_thumbnail.png"
        displayName: "Thermostat Demo"
        url: "https://download.qt.io/learning/examples/qtdesignstudio/thermo.zip"
        showDownload: true
        showUpdate: false
        tagData: "Qt for MCU"
        description: "Thermostat Demo compatible with Qt for MCU."
    }
}
