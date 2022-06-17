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
import WelcomeScreen 1.0
import QtQuick.Layouts
import projectmodel 1.0
import DataModels 1.0

Item {
    id: thumbnails
    width: 1500
    height: 800
    clip: true
    property alias listStackLayoutCurrentIndex: listStackLayout.currentIndex
    property alias stackLayoutCurrentIndex: gridStackLayout.currentIndex

    property var projectModel: Constants.projectModel

    Rectangle {
        id: thumbnailGridBack
        color: Constants.currentThumbnailGridBackground
        anchors.fill: parent

        StackLayout {
            id: gridStackLayout
            visible: !Constants.isListView
            anchors.fill: parent
            currentIndex: 0

            CustomGrid {
                id: myRecentGrid
                anchors.fill: parent
                anchors.margins: Constants.gridMargins
                myModel: thumbnails.projectModel
                myDelegate: ThumbnailDelegate {
                    tagged: false
                    likable: false
                    downloadable: false
                    hasPath: true
                    isRecentProject: true
                    hasDescription: false
                    hasPrice: false
                    thumbnailPlaceholderSource: previewUrl
                    onClicked: projectModel.openProjectAt(index)
                }
            }


            CustomGrid {
                id: myExamplesGrid
                anchors.fill: parent
                anchors.margins: Constants.gridMargins
                myModel: ExamplesModel { id: examplesModel}
                myDelegate: ThumbnailDelegate {
                    thumbnailPlaceholderSource: examplesModel.resolveUrl(thumbnail)
                    tagged: false
                    likable: false
                    isRecentProject: false
                    downloadable: showDownload
                    isExample: true
                    hasUpdate: showUpdate
                    hasPath: false
                    hasDescription: false
                    hasPrice: false
                    downloadUrl: url
                    onClicked: projectModel.openExample(targetPath,
                                                        projectName,
                                                        qmlFileName,
                                                        explicitQmlproject)
                }
            }

            CustomGrid {
                id: myTutorialsGrid
                anchors.fill: parent
                anchors.margins: Constants.gridMargins
                myModel: TutorialsModel { id: tutorialsModel}
                myDelegate: ThumbnailDelegate {
                    thumbnailPlaceholderSource: tutorialsModel.resolveUrl(thumbnail)
                    tagged: false
                    likable: false
                    downloadable: false
                    hasPath: false
                    hasDescription: false
                    isRecentProject: false
                    isTutorial: true
                    hasPrice: false
                    onClicked: Qt.openUrlExternally(url)
                }
            }

            /*
            CustomGrid {
                id: myMarketplaceGrid
                anchors.fill: parent
                anchors.margins: Constants.gridMargins
                myModel: thumbnails.projectModel
                myDelegate: ThumbnailDelegate {
                    tagged: true
                    likable: false
                    downloadable: false
                    hasDescription: true
                    hasPath: false
                    hasPrice: true
                }
            }
            */
        }

        StackLayout {
            id: listStackLayout
            visible: Constants.isListView
            anchors.fill: parent
            currentIndex: 0
            /*
            CustomGrid {
                id: myRecentList
                anchors.fill: parent
                anchors.margins: Constants.gridMargins
                myModel: thumbnails.projectModel
                myDelegate: MyRecentThumbnailDelegate {}
                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            CustomGrid {
                id: myExamplesList
                anchors.fill: parent
                anchors.margins: Constants.gridMargins
                myModel: ExamplesModel {}
                myDelegate: MyExampleThumbnailDelegate {}
            }
            */
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66;height:838;width:1509}
}
##^##*/
