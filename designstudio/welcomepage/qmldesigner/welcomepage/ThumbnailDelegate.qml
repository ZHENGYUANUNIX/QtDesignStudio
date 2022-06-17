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

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import WelcomeScreen 1.0
import ExampleCheckout 1.0

Item {
    id: thumbnailDelegate
    width: Constants.thumbnailSize
    height: Constants.thumbnailSize
    clip: true
    state: "normal"

    property bool textWrapped: false
    property bool hasPrice: true
    property bool hasDescription: true
    property bool hasPath: true
    property bool likable: true
    property bool downloadable: true
    property bool tagged: true
    property int numberOfPanels: 3

    property bool isRecentProject: true
    property bool isExample: false
    property bool isTutorial: false

    property bool hasUpdate: false
    property alias projectNameLabelText: projectNameLabel.text
    property alias projectPathLabelText: projectPathLabel.text
    property alias thumbnailPlaceholderSource: thumbnailPlaceholder.source

    property alias downloadUrl: downloader.url
    property alias tempFile: downloader.tempFile
    property alias completeBaseName: downloader.completeBaseName
    property alias targetPath: extractor.targetPath

    property alias bannerLabelText: updateText.text

    enum Panel {
        InBetween,
        Download,
        Main,
        Details
    }

    property int currentPanel: ThumbnailDelegate.Panel.Main

    signal clicked()

    function startDownload() {
        twirlToDownloadAnimation.start()
        downloadPanel.text = downloadPanel.downloadText
        downloadPanel.value = Qt.binding(function() { return downloader.progress })
        downloader.start()
        mouseArea.enabled = false
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        propagateComposedEvents: true
        hoverEnabled: true

        Connections {
            target: mouseArea
            onClicked: {
                if (thumbnailDelegate.isRecentProject || thumbnailDelegate.isTutorial)
                    thumbnailDelegate.clicked() // open recent project/tutorial

                if (thumbnailDelegate.isExample) {
                    if (thumbnailDelegate.downloadable
                        && !downloadButton.alreadyDownloaded
                        && !downloadButton.downloadUnavailable) {
                        thumbnailDelegate.startDownload()
                    } else if (downloadButton.alreadyDownloaded) {
                        thumbnailDelegate.clicked() // open example
                    }
                }
            }
        }
    }

    CustomDialog {
        id: overwriteDialog
        title: qsTr("Confirm example overwrite")
        standardButtons: Dialog.Yes | Dialog.No
        modal: true
        anchors.centerIn: parent

        onAccepted: thumbnailDelegate.startDownload()

        Text {
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
            color: Constants.currentGlobalText
            text: qsTr("Example already exists.<br>Do you want to replace it?")
        }
    }

    Item {
        id: canvas
        width: Constants.thumbnailSize
        height: Constants.thumbnailSize * thumbnailDelegate.numberOfPanels

        DownloadPanel {
            id: downloadPanel

            height: Constants.thumbnailSize
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: mainPanel.top
            value: downloader.progress

            readonly property string downloadText: qsTr("Downloading...")
            readonly property string extractText: qsTr("Extracting...")
        }

        Item {
            id: mainPanel
            height: Constants.thumbnailSize
            anchors.left: parent.left
            anchors.right: parent.right

            Rectangle {
                id: recentThumbBackground
                color: "#ea8c8c"
                radius: 3
                border.color: "#00000000"
                anchors.fill: parent

                property int localMargin: 10

                Image {
                    id: thumbnailPlaceholder
                    //source: typeof(thumbnail) === "undefined" ? "" : thumbnail
                    anchors.fill: parent
                    anchors.bottomMargin: 90
                    anchors.rightMargin: recentThumbBackground.localMargin
                    anchors.leftMargin: recentThumbBackground.localMargin
                    anchors.topMargin: recentThumbBackground.localMargin
                    fillMode: Image.PreserveAspectFit
                    verticalAlignment: Image.AlignTop
                    mipmap: true

                    // Marketplace related items, not relevant for now
                    Rectangle {
                        id: rectangle
                        x: 10
                        y: 8
                        opacity: 0.903
                        color: Constants.currentNormalThumbnailBackground
                        border.color: "#00323232"
                        anchors.fill: parent

                        Text {
                            id: text1
                            x: 5
                            y: 5
                            color: Constants.currentGlobalText
                            text: qsTr("Description Place Holder Text For marketplace icons")
                            font.pixelSize: 12
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.WordWrap
                            anchors.fill: parent
                            anchors.margins: 5
                        }
                    }
                }
            }

            property bool truncated: (projectNameLabelMetric.width >= projectNameLabel.width)

            TextMetrics {
                id: projectNameLabelMetric
                text: projectNameLabel.text
                font: projectNameLabel.font
            }

            Rectangle {
                id: projectNameBackground
                height: mainPanel.truncated ? 60 : 30
                color: "#e5b0e4"
                radius: 3
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.bottom
                anchors.topMargin: -85
                anchors.leftMargin: recentThumbBackground.localMargin
                anchors.rightMargin: recentThumbBackground.localMargin

                Text {
                    id: projectNameLabel
                    height: mainPanel.truncated ? 60 : 30
                    color: Constants.currentGlobalText
                    text: typeof(displayName) === "undefined" ? projectName : displayName
                    elide: mainPanel.truncated ? Text.ElideNone : Text.ElideRight
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignTop
                    lineHeight: 1.4
                    wrapMode: Text.WordWrap
                    topPadding: 5
                    leftPadding: 5
                    maximumLineCount: 2
                    clip: true
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    anchors.rightMargin: 4 // margin to avoid elide dots touching the edge
                }

                RowLayout {
                    id: downloadFavorite
                    x: 140
                    width: 62
                    height: 30
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    layoutDirection: Qt.RightToLeft

                    DownloadButton {
                        id: downloadButton
                        visible: thumbnailDelegate.downloadable
                        enabled: !downloadButton.downloadUnavailable

                        globalHover: mouseArea.containsMouse
                                     && !downloadButton.alreadyDownloaded
                                     && !downloadButton.downloadUnavailable
                                     && !downloadButton.updateAvailable

                        alreadyDownloaded: extractor.targetFolderExists
                        downloadUnavailable: !downloader.available
                        updateAvailable: downloader.lastModified > extractor.birthTime

                        FileDownloader {
                            id: downloader
                            onFinishedChanged: {
                                downloadPanel.text = downloadPanel.extractText
                                downloadPanel.value = Qt.binding(function() { return extractor.progress })
                                extractor.extract()
                            }
                        }

                        FileExtractor {
                            id: extractor
                            archiveName: downloader.completeBaseName
                            sourceFile: downloader.tempFile
                            onFinishedChanged: {
                                twirlToMainAnimation.start()
                                thumbnailDelegate.clicked()
                                mouseArea.enabled = true
                            }
                        }

                        Connections {
                            target: downloadButton
                            onDownloadClicked: {
                                if (downloadButton.alreadyDownloaded) {
                                    overwriteDialog.open()
                                } else {
                                    if (downloadButton.enabled)
                                        thumbnailDelegate.startDownload()
                                }
                            }
                        }
                    }

                    FavoriteToggle {
                        id: myFavoriteToggle
                        visible: thumbnailDelegate.likable
                        Layout.preferredHeight: 30
                        Layout.preferredWidth: 27
                    }
                }
            }

            Text {
                id: projectPathLabel
                visible: thumbnailDelegate.hasPath
                color: Constants.currentBrand
                text: typeof(prettyFilePath) === "undefined" ? "" : prettyFilePath
                elide: Text.ElideLeft
                renderType: Text.NativeRendering
                font.pixelSize: 16
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: projectNameBackground.bottom
                anchors.topMargin: 5
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                leftPadding: 5

                MouseArea {
                    id: toolTipMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    // Only enable the MouseArea if label actually contains text
                    enabled: projectPathLabel.text !== "" ? true : false
                }

                ToolTip {
                    id: toolTip
                    y: -toolTip.height
                    visible: toolTipMouseArea.containsMouse
                    text: projectPathLabel.text
                    delay: 1000
                    height: 20
                    background: Rectangle {
                        color: Constants.currentToolTipBackground
                        border.color: Constants.currentToolTipOutline
                        border.width: 1
                    }
                    contentItem: Text {
                        color: Constants.currentToolTipText
                        text: toolTip.text
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }

            Text {
                id: price
                height: 15
                visible: thumbnailDelegate.hasPrice
                color: Constants.currentGlobalText
                text: "€249.99 - Yearly"
                font.pixelSize: 12
                horizontalAlignment: Text.AlignRight
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: projectNameBackground.bottom
                anchors.topMargin: 5
                anchors.rightMargin: 10
                anchors.leftMargin: 10
            }

            Rectangle {
                id: updateBackground
                width: 200
                height: 25
                visible: thumbnailDelegate.bannerLabelText !== ""
                color: Constants.currentBrand
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.rightMargin: 10
                anchors.leftMargin: 10

                Text {
                    id: updateText
                    color: Constants.currentActiveGlobalText
                    text: typeof(displayName) === "bannerText" ? "" : bannerText
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        Item {
            id: detailsPanel
            height: Constants.thumbnailSize
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: mainPanel.bottom

            Rectangle {
                id: recentThumbBackground1
                visible: true
                color: Constants.currentNormalThumbnailBackground
                radius: 3
                border.color: "#00000000"
                anchors.fill: parent

                Text {
                    id: recentProjectInfo
                    visible: thumbnailDelegate.isRecentProject
                    color: Constants.currentGlobalText
                    text: typeof(description) === "undefined" ? "" : description
                    anchors.fill: parent
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
                    anchors.margins: 10
                    anchors.topMargin: 25
                }

                Text {
                    id: exampleInfo
                    visible: thumbnailDelegate.isExample
                    color: Constants.currentGlobalText
                    text: typeof(description) === "undefined" ? "" : description
                    anchors.fill: parent
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
                    anchors.margins: 10
                    anchors.topMargin: 25
                }

                Text {
                    id: tutorialInfo
                    visible: thumbnailDelegate.isTutorial
                    color: Constants.currentGlobalText
                    text: typeof(description) === "undefined" ? "" : description
                    anchors.fill: parent
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
                    anchors.margins: 10
                    anchors.topMargin: 25
                }
            }

            TagArea {
                id: tagArea
                visible: true
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                tags: typeof(tagData) === "undefined" ? "" : tagData.split(",")
            }
        }
    }

    states: [
        State {
            name: "normal"
            when: !mouseArea.containsMouse && !mouseArea.pressed && !toolTipMouseArea.containsMouse
                  && !myFavoriteToggle.isHovered && !downloadButton.isHovered
                  && !twirlButtonDown.isHovered && !twirlButtonUp.isHovered

            PropertyChanges {
                target: recentThumbBackground
                color: Constants.currentNormalThumbnailBackground
                border.color: "#002f779f"
            }

            PropertyChanges {
                target: projectNameBackground
                color: Constants.currentNormalThumbnailLabelBackground
                border.color: "#00000000"
            }

            PropertyChanges {
                target: thumbnailPlaceholder
                opacity: 0.528
                visible: true
            }

            PropertyChanges {
                target: rectangle
                visible: false
            }

            PropertyChanges {
                target: twirlButtonDown
                parentHovered: false
            }
            PropertyChanges {
                target: twirlButtonUp
                parentHovered: false
            }
        },
        State {
            name: "hover"
            when: (mouseArea.containsMouse || toolTipMouseArea.containsMouse || myFavoriteToggle.isHovered
                   || downloadButton.isHovered || twirlButtonDown.isHovered || twirlButtonUp.isHovered)
                  && !mouseArea.pressed && !thumbnailDelegate.hasDescription

            PropertyChanges {
                target: recentThumbBackground
                color: Constants.currentHoverThumbnailBackground
                border.color: "#002f779f"
            }
            PropertyChanges {
                target: recentThumbBackground1
                color: Constants.currentHoverThumbnailBackground
                border.color: "#002f779f"
            }

            PropertyChanges {
                target: projectNameBackground
                color: Constants.currentHoverThumbnailLabelBackground
                border.color: "#00000000"
            }

            PropertyChanges {
                target: thumbnailPlaceholder
                visible: true
            }

            PropertyChanges {
                target: rectangle
                visible: false
            }

            PropertyChanges {
                target: twirlButtonDown
                parentHovered: true
            }
            PropertyChanges {
                target: twirlButtonUp
                parentHovered: true
            }
        },
        State {
            name: "press"
            when: mouseArea.pressed && !thumbnailDelegate.hasDescription

            PropertyChanges {
                target: recentThumbBackground
                color: Constants.currentHoverThumbnailBackground
                border.color: Constants.currentBrand
                border.width: 2
            }

            PropertyChanges {
                target: recentThumbBackground1
                color: Constants.currentHoverThumbnailBackground
                border.color: Constants.currentBrand
                border.width: 2
            }

            PropertyChanges {
                target: projectNameBackground
                color: Constants.currentBrand
                border.color: "#00000000"
            }

            PropertyChanges {
                target: thumbnailPlaceholder
                visible: true
            }

            PropertyChanges {
                target: rectangle
                visible: false
            }

            PropertyChanges {
                target: projectNameLabel
                color: Constants.currentActiveGlobalText
            }
        },
        State {
            name: "hoverDescription"
            when: mouseArea.containsMouse && !mouseArea.pressed && thumbnailDelegate.hasDescription
            PropertyChanges {
                target: recentThumbBackground
                color: Constants.currentHoverThumbnailBackground
                border.color: "#002f779f"
            }

            PropertyChanges {
                target: projectNameBackground
                color: Constants.currentHoverThumbnailLabelBackground
                border.color: "#00000000"
            }

            PropertyChanges {
                target: thumbnailPlaceholder
                visible: true
            }

            PropertyChanges {
                target: rectangle
                visible: true
            }
        },
        State {
            name: "pressDescription"
            when: mouseArea.pressed && thumbnailDelegate.hasDescription
            PropertyChanges {
                target: recentThumbBackground
                color: Constants.currentHoverThumbnailBackground
                border.color: Constants.currentBrand
                border.width: 2
            }

            PropertyChanges {
                target: projectNameBackground
                color: Constants.currentBrand
                border.color: "#00000000"
            }

            PropertyChanges {
                target: thumbnailPlaceholder
                visible: true
            }

            PropertyChanges {
                target: rectangle
                visible: true
            }
        }
    ]

    TwirlButton {
        id: twirlButtonDown
        height: 20
        visible: thumbnailDelegate.currentPanel === ThumbnailDelegate.Panel.Main
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        Connections {
            target: twirlButtonDown
            onTriggerRelease: {
                twirlToDetailsAnimation.start()
                recentThumbBackground1.visible = true
                tagArea.visible = true
            }
        }
    }

    TwirlButton {
        id: twirlButtonUp
        height: 20
        visible: thumbnailDelegate.currentPanel === ThumbnailDelegate.Panel.Details
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        rotation: 180

        Connections {
            target: twirlButtonUp
            onTriggerRelease: twirlToMainAnimation.start()
        }
    }

    NumberAnimation {
        id: twirlToDetailsAnimation
        target: canvas
        property: "y"
        easing.bezierCurve: [0.972,-0.176,0.0271,1.16,1,1]
        duration: 250
        alwaysRunToEnd: true
        to: -Constants.thumbnailSize // dynamic size because of rescale - needs to be inverted because animation goes into negative range
        from: canvas.y
    }

    NumberAnimation {
        id: twirlToMainAnimation
        target: canvas
        property: "y"
        easing.bezierCurve: [0.972,-0.176,0.0271,1.16,1,1]
        alwaysRunToEnd: true
        duration: 250
        to: 0
        from: canvas.y
    }

    NumberAnimation {
        id: twirlToDownloadAnimation
        target: canvas
        property: "y"
        easing.bezierCurve: [0.972,-0.176,0.0271,1.16,1,1]
        alwaysRunToEnd: true
        duration: 250
        to: Constants.thumbnailSize
        from: canvas.y
    }

    Connections {
        target: twirlToDetailsAnimation
        onStarted: thumbnailDelegate.currentPanel = ThumbnailDelegate.Panel.InBetween
        onFinished: {
            thumbnailDelegate.currentPanel = ThumbnailDelegate.Panel.Details
            canvas.y = Qt.binding(function() {return -Constants.thumbnailSize })
        }
    }

    Connections {
        target: twirlToMainAnimation
        onStarted: thumbnailDelegate.currentPanel = ThumbnailDelegate.Panel.InBetween
        onFinished: {
            thumbnailDelegate.currentPanel = ThumbnailDelegate.Panel.Main
            canvas.y = Qt.binding(function() {return 0 })
        }
    }

    Connections {
        target: twirlToDownloadAnimation
        onStarted: thumbnailDelegate.currentPanel = ThumbnailDelegate.Panel.InBetween
        onFinished: {
            thumbnailDelegate.currentPanel = ThumbnailDelegate.Panel.Download
            canvas.y = Qt.binding(function() {return Constants.thumbnailSize })
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:2}D{i:29;invisible:true}
}
##^##*/
