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
import QtQuick.Templates 2.12 as T
import StudioTheme 1.0 as StudioTheme

Row {
    spacing: 0

    ActionIndicator {
        id: actionIndicator
        myControl: myButton
        x: 0
        y: 0
        width: actionIndicator.visible ? myButton.__actionIndicatorWidth : 0
        height: actionIndicator.visible ? myButton.__actionIndicatorHeight : 0
    }

    T.AbstractButton {
        id: myButton

        property int origin: Item.Center

        // This property is used to indicate the global hover state
        property bool hover: myButton.hovered

        property alias backgroundVisible: buttonBackground.visible
        property alias backgroundRadius: buttonBackground.radius

        property alias actionIndicator: actionIndicator

        property alias actionIndicatorVisible: actionIndicator.visible
        property real __actionIndicatorWidth: StudioTheme.Values.actionIndicatorWidth
        property real __actionIndicatorHeight: StudioTheme.Values.actionIndicatorHeight

        implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                                implicitContentWidth + leftPadding + rightPadding)
        implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                                 implicitContentHeight + topPadding + bottomPadding)
        height: StudioTheme.Values.height
        width: StudioTheme.Values.height
        z: myButton.checked ? 10 : 3
        activeFocusOnTab: false

        onClicked: originPopup.opened ? originPopup.close() : originPopup.open()

        background: Rectangle {
            id: buttonBackground
            color: myButton.checked ? StudioTheme.Values.themeControlBackgroundInteraction
                                    : StudioTheme.Values.themeControlBackground
            border.color: myButton.checked ? StudioTheme.Values.themeInteraction
                                           : StudioTheme.Values.themeControlOutline
            border.width: StudioTheme.Values.border
        }

        indicator: OriginIndicator {
            myControl: myButton
            x: 0
            y: 0
            implicitWidth: myButton.width
            implicitHeight: myButton.height
        }

        T.Popup {
            id: originPopup

            x: 50
            y: 0

            width: (4 * grid.spacing) + (3 * StudioTheme.Values.height)
            height: (4 * grid.spacing) + (3 * StudioTheme.Values.height)

            padding: StudioTheme.Values.border
            margins: 0 // If not defined margin will be -1

            closePolicy: T.Popup.CloseOnPressOutside | T.Popup.CloseOnPressOutsideParent
                         | T.Popup.CloseOnEscape | T.Popup.CloseOnReleaseOutside
                         | T.Popup.CloseOnReleaseOutsideParent

            contentItem: Item {
                Grid {
                    id: grid

                    x: 5
                    y: 5

                    rows: 3
                    columns: 3
                    spacing: 5 // TODO spacingvalue in Values.qml

                    OriginSelector {
                        myControl: myButton
                        enumValue: Item.TopLeft
                    }
                    OriginSelector {
                        myControl: myButton
                        enumValue: Item.Top
                    }
                    OriginSelector {
                        myControl: myButton
                        enumValue: Item.TopRight
                    }
                    OriginSelector {
                        myControl: myButton
                        enumValue: Item.Left
                    }
                    OriginSelector {
                        myControl: myButton
                        enumValue: Item.Center
                    }
                    OriginSelector {
                        myControl: myButton
                        enumValue: Item.Right
                    }
                    OriginSelector {
                        myControl: myButton
                        enumValue: Item.BottomLeft
                    }
                    OriginSelector {
                        myControl: myButton
                        enumValue: Item.Bottom
                    }
                    OriginSelector {
                        myControl: myButton
                        enumValue: Item.BottomRight
                    }
                }
            }

            background: Rectangle {
                color: StudioTheme.Values.themeControlBackground
                border.color: StudioTheme.Values.themeInteraction
                border.width: StudioTheme.Values.border
            }

            enter: Transition {
            }
            exit: Transition {
            }
        }

        states: [
            State {
                name: "default"
                when: myButton.enabled && !myButton.hover && !actionIndicator.hover
                      && !myButton.pressed && !originPopup.opened
                PropertyChanges {
                    target: buttonBackground
                    color: StudioTheme.Values.themeControlBackground
                }
                PropertyChanges {
                    target: myButton
                    z: 3
                }
            },
            State {
                name: "globalHover"
                when: actionIndicator.hover && !myButton.pressed && !originPopup.opened
                PropertyChanges {
                    target: buttonBackground
                    color: StudioTheme.Values.themeControlBackgroundGlobalHover
                    border.color: StudioTheme.Values.themeControlOutline
                }
            },
            State {
                name: "hover"
                when: myButton.hover && !actionIndicator.hover && !myButton.pressed
                      && !originPopup.opened
                PropertyChanges {
                    target: buttonBackground
                    color: StudioTheme.Values.themeControlBackgroundHover
                    border.color: StudioTheme.Values.themeControlOutline
                }
            },
            State {
                name: "press"
                when: myButton.hover && myButton.pressed && !originPopup.opened
                PropertyChanges {
                    target: buttonBackground
                    color: StudioTheme.Values.themeControlBackgroundInteraction
                    border.color: StudioTheme.Values.themeInteraction
                }
                PropertyChanges {
                    target: myButton
                    z: 10
                }
            },
            State {
                name: "disable"
                when: !myButton.enabled
                PropertyChanges {
                    target: buttonBackground
                    color: StudioTheme.Values.themeControlBackgroundDisabled
                    border.color: StudioTheme.Values.themeControlOutlineDisabled
                }
            }
        ]
    }
}
