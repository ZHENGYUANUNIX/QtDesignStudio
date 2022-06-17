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
        displayName: "The Designer Tool Developers Love"
        thumbnail: "images/webinar1.png"
        url: "https://youtu.be/gU_tDbebAzM"
        showTutorial: true
        tagData: "Webinar"
        description: "In this webinar, we will walk you through the challenges associated with the typical designer-developer workflow and how Qt Design Studio does away with them in style."
    }

    ListElement {
        displayName: "From Photoshop to Prototype"
        thumbnail: "images/webinar2.png"
        url: "https://youtu.be/ZzbucmQPU44"
        showTutorial: true
        tagData: "Webinar, Photoshop"
        description: "Learn how to import design elements from Photoshop, and discover the most effective features to start your UI project with fellow designers and developers using Qt UI Design Tools. Import your psd assets to Qt Design Studio, turning them into QML code, and creating timeline-based animations."
    }

    ListElement {
        displayName: "Webinar showing Qt Design Studio and the Photoshop bridge."
        thumbnail: "images/designer_and_developers.png"
        url: "https://www.youtube.com/watch?v=EgjCvZWEPWk"
        showTutorial: true
        tagData: "Workflow"
        description: "Working relationships between designers and developers can be complicated. It's as if they speak different languages. No more! Qt gives you the tool that makes collaboration between designers and developers easier and more efficient than ever before!"
    }

    ListElement {
        displayName: "QTWS - Designer and Developer Workflow"
        thumbnail: "images/qtws_video_thumbnail.png"
        url: "https://www.youtube.com/watch?v=4ug0EUdS2RM"
        showTutorial: true
        tagData: "World Summit"
        description: "Presentation of Qt Design Studio at Qt World Summit 2018. Thomas, Brook, and Vikas share our vision on how we think our design tooling would bring the two camps closer together. They present the optimized workflow with a demo of Qt Design Studio."
    }

    ListElement {
        displayName: "QTWS - Turn UI designs into working prototypes"
        thumbnail: "images/bridging_the_gap.png"
        url: "https://www.youtube.com/watch?v=qQM2oEWRBOw&feature=emb_logo"
        showTutorial: true
        tagData: "World Summit"
        description: "Presentation of Qt Design Studio at Qt World Summit 2019. We will give a presentation of a streamlined designer-developer workflow and use Sketch to create a design that is then converted to QML and brought to action in Qt Design Studio."
    }

    ListElement {
        displayName: "What's New in Design Studio 1.5"
        thumbnail: "images/what_is_new_15.png"
        url: "https://www.youtube.com/watch?v=e-HAZrisi5o"
        showTutorial: true
        tagData: "Webinar"
        description: "Webinar of the new features of Qt Design Studio 1.5. Full 3D Support - Design Studio now fully supports Qt Quick 3D allowing you to import your 3d assets from your content creation tools and create UI’s with a mix of 2D and 3D, all using QML."
    }

    ListElement {
        displayName: "Qt Design Studio QuickTip: UI Navigation"
        thumbnail: "images/Qt_QT_nav.png"
        url: "https://youtu.be/RfEYO-5Mw6s"
        showTutorial: true
        tagData: "QuickTip, UI Navigation"
       description: "QuickTip on implenting UI Navigation."
    }

    ListElement {
        displayName: "Qt Design Studio QuickTip: Text Element"
        thumbnail: "images/Qt_QT_textElement.png"
        url: "https://youtu.be/yOUdg1o2KJM"
        showTutorial: true
        tagData: "QuickTip, Text Element"
        description: "QuickTip on using Text Elemends."
    }

    ListElement {
        displayName: "Qt Design Studio QuickTip: Animated Image"
        thumbnail: "images/Qt_QT_animatedImage.png"
        url: "https://youtu.be/DVWd_xMMgvg"
        showTutorial: true
        tagData: "QuickTip, Animated Image"
        description: "QuickTip on using Animated Image."
    }

    ListElement {
        displayName: "Qt Design Studio QuickTip: Slider Control"
        thumbnail: "images/Qt_QT_sliderControl.png"
        url: "https://youtu.be/Ed8WS03C-Vk"
        showTutorial: true
        tagData: "QuickTip, Controls"
        description: "QuickTip showing how to create a Slider Control."
    }

    ListElement {
        displayName: "Qt Design Studio QuickTip: Bindings"
        thumbnail: "images/Qt_QT_bindings.png"
        url: "https://youtu.be/UfvA04CIXv0"
        showTutorial: true
        tagData: "QuickTip, Bindings"
        description: "QuickTip showing how to use QML bindings."
    }

    ListElement {
        displayName: "Qt Design Studio QuickTip: Interactive 3D"
        thumbnail: "images/Qt_QT_interactive3d.png"
        url: "https://youtu.be/w1yhDl93YI0"
        showTutorial: true
        tagData: "QuickTip, 3D"
        description: "QuickTip on using Qt Quick 3D."
    }

    ListElement {
        displayName: "Sketch Bridge Tutorial - Part 1"
        thumbnail: "images/sketchTutorial_1.png"
        url: "https://www.qt.io/blog/qt-design-studio-sketch-bridge-tutorial-part-1"
        showTutorial: true
        tagData: "Sketch Bridge, Blog"
        description: "With this tutorial I want to show you how to build up a sketch project that creates a clean export and import into Qt Design Studio. Part 1"
    }

    ListElement {
        displayName: "Sketch Bridge Tutorial - Part 2"
        thumbnail: "images/sketchTutorial_2.png"
        url: "https://www.qt.io/blog/qt-design-studio-sketch-bridge-tutorial-part-2"
        showTutorial: true
        tagData: "Sketch Bridge, Blog"
        description: "With this tutorial I want to show you how to build up a sketch project that creates a clean export and import into Qt Design Studio. Part 2"
    }

    ListElement {
        displayName: "Create New Project"
        thumbnail: "images/gettingStarted_newProject.png"
        url: "https://youtu.be/9ihYeC0YJ0M"
        showTutorial: true
        tagData: "Tutorial"
        description: "Thermostat Demo compatible with Qt for MCU."
    }

    ListElement {
        displayName: "Using Qt Quick 3D Components"
        thumbnail: "images/gettingStarted_3dComponents.png"
        url: "https://youtu.be/u3kZJjlk3CY"
        showTutorial: true
        tagData: "Tutorial, 3D"
        description: "Get started with using Qt Design Studio. This video focuses on how to import and use the Qt Quick 3D Components in your scenes."
    }

    ListElement {
        displayName: "Using Custom Shaders, Materials, and Effects"
        thumbnail: "images/gettingStarted_shaders.png"
        url: "https://youtu.be/bMXeeQw6BYs"
        showTutorial: true
        tagData: "Tutorial, Shaders, Maierials, Effects"
        description: "Get started with using Qt Design Studio. This video introduces the Qt Quick 3D Custom Shader Utilities, Materials and Effects."
    }
}
