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

DialogButtonBox {
    id: root
    padding: 12
    alignment: Qt.AlignRight | Qt.AlignBottom

    background: Rectangle {
        implicitHeight: 40
        x: 1
        y: 1
        width: parent.width - 2
        height: parent.height - 2
        color: Constants.currentDialogBackground
    }

    delegate: DialogButton {
        width: root.count === 1 ? root.availableWidth / 2 : undefined
    }
}

/*##^##
Designer {
    D{i:0;height:272;width:272}D{i:4}D{i:5}
}
##^##*/
