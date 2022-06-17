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

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Templates 2.12 as T
import StudioTheme 1.0 as StudioTheme

Rectangle {
    id: editableListView

    property alias actionIndicator: actionIndicator

    property alias actionIndicatorVisible: actionIndicator.visible
    property real __actionIndicatorWidth: StudioTheme.Values.actionIndicatorWidth
    property real __actionIndicatorHeight: StudioTheme.Values.actionIndicatorHeight

    color: "transparent"
    border.color: StudioTheme.Values.themeControlOutline
    border.width: StudioTheme.Values.border

    width: StudioTheme.Values.height * 10
    height: StudioTheme.Values.height * 6

    ListModel {
        id: myModel
        ListElement { name: "_this_isAvalid1d" }
        ListElement { name: "Material.Singleton" }
        ListElement { name: "woop123" }
        ListElement { name: "This.could.also.be.valid" }
        ListElement { name: "<<but>>this<<is>>not" }
    }

    Component {
        id: myDelegate
        TextField {
            actionIndicatorVisible: false
            translationIndicatorVisible: false

            text: name
            font.pixelSize: 12
            width: myListView.width
            onPressed: myListView.currentIndex = index
            ListView.onAdd: myListView.currentIndex = index
            //ListView.onRemove: myListView.decrementCurrentIndex()
        }
    }

    Column {
        id: column

        ListView {
            id: myListView

            width: editableListView.width
            height: editableListView.height - row.height

            clip: true
            spacing: -StudioTheme.Values.border

            flickableDirection: Flickable.VerticalFlick
            boundsBehavior: Flickable.StopAtBounds
            Layout.fillWidth: true
            Layout.fillHeight: true
            ScrollBar.vertical: ScrollBar {}

            model: myModel
            delegate: myDelegate
            highlight: Rectangle {
                color: "transparent"
                width: parent.width
                border.width: StudioTheme.Values.border
                border.color: StudioTheme.Values.themeInteraction
                z: 50
            }
        }

        spacing: 0

        Row {
            id: row
            spacing: -StudioTheme.Values.border

            ActionIndicator {
                id: actionIndicator
                //myControl: myComboBox
                width: actionIndicator.visible ? __actionIndicatorWidth : 0
                height: actionIndicator.visible ? __actionIndicatorHeight : 0
                showBackground: true
            }
            AbstractButton {
                buttonIcon: "+"
                iconFont: StudioTheme.Constants.font
                onClicked: {
                    myModel.append({"name" : "newId"})
                    print("add")
                }
            }
            AbstractButton {
                buttonIcon: "-"
                iconFont: StudioTheme.Constants.font
                onClicked: {
                    myModel.remove(myListView.currentIndex)
                    print("remove")
                }
            }
            Rectangle {
                color: StudioTheme.Values.themeControlBackground
                border.width: StudioTheme.Values.border
                border.color: StudioTheme.Values.themeControlOutline
                height: StudioTheme.Values.height
                width: editableListView.width - (StudioTheme.Values.height - StudioTheme.Values.border) * (actionIndicatorVisible ? 3 : 2)
            }
        }
    }
}
