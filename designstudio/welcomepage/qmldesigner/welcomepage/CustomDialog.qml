/****************************************************************************
**
** Copyright (C) 2022 The Qt Company Ltd.
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

Dialog {
    id: root
    padding: 12

    background: Rectangle {
        color: Constants.currentDialogBackground
        border.color: Constants.currentDialogBorder
        border.width: 1
    }

    header: Label {
        text: root.title
        visible: root.title
        elide: Label.ElideRight
        font.bold: true
        padding: 12
        color: Constants.currentGlobalText

        background: Rectangle {
            x: 1
            y: 1
            width: parent.width - 2
            height: parent.height - 1
            color: Constants.currentDialogBackground
        }
    }

    footer: CustomDialogButtonBox {
        visible: count > 0
    }

    Overlay.modal: Rectangle {
        color: Color.transparent(Constants.currentDialogBackground, 0.5)
    }
}

/*##^##
Designer {
    D{i:0;height:272;width:272}D{i:4}D{i:5}
}
##^##*/
