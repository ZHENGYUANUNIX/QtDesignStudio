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
//import QtQuickDesignerTheme 1.0

QtObject {
    id: values

    // Theme Colors

    property string themePanelBackground: "#eaeaea"//Theme.color(Theme.DSpanelBackground)
    property string welcomeScreenBackground: "#EAEAEA" //NEW COLOR _ NEEDS ADDING TO THEME
    property string themeSubPanelBackground: "#EFEFEF"//NEW COLOR _ NEEDS ADDING TO THEME
    property string themeThumbnailBackground: "#F2F2F2"//NEW COLOR _ NEEDS ADDING TO THEME
    property string themeThumbnailLabelBackground: "#EBEBEB"//NEW COLOR _ NEEDS ADDING TO THEME


    property string themeInteraction: "#2aafd3"//Theme.color(Theme.DSinteraction)
    property string themeError: "#df3a3a"//Theme.color(Theme.DSerrorColor)
    property string themeDisabled: "#707070"

    // Control colors
    property string themeControlBackground: values.themePanelBackground//Theme.color(Theme.DScontrolBackground)
    property string themeControlBackgroundInteraction: "#EAEAEA"//Theme.color(Theme.DScontrolBackgroundInteraction)
    property string themeControlBackgroundDisabled: values.themePanelBackground//Theme.color(Theme.DScontrolBackgroundDisabled)
    property string themeControlBackgroundGlobalHover: "#E1E1E1"
    property string themeControlBackgroundHover: "#E5E5E5"

    property string themeControlOutline: "#cecccc"//Theme.color(Theme.DScontrolOutline)
    property string themeControlOutlineInteraction: values.themeInteraction
    property string themeControlOutlineDisabled: values.themeDisabled//Theme.color(Theme.DScontrolOutlineDisabled)

    // Text colors
    property string themeTextColor: "#262626"//Theme.color(Theme.DStextColor)
    property string themeTextColorDisabled: values.themeDisabled//Theme.color(Theme.DStextColorDisabled)
    property string themeTextSelectionColor: values.themeInteraction//Theme.color(Theme.DStextSelectionColor)
    property string themeTextSelectedTextColor: "#000000"//Theme.color(Theme.DStextSelectedTextColor)

    // Icon colors
    property string themeIconColor: "#262626"
    property string themeIconColorHover: "#191919"
    property string themeIconColorInteraction: "#ffffff" // press
    property string themeIconColorDisabled: values.themeDisabled
    property string themeIconColorSelected: values.themeInteraction

    property string themeLinkIndicatorColor: "grey"
    property string themeLinkIndicatorColorHover: "1f1f1f"
    property string themeLinkIndicatorColorInteraction: values.themeInteraction

    // Popup background color (ComboBox, SpinBox, TextArea)
    property string themePopupBackground: "#d3d3d3"

    // Slider colors
    property string themeSliderActiveTrack: "#7c7b7b"//Theme.color(Theme.DSsliderActiveTrack)
    property string themeSliderActiveTrackHover: "#000000"//Theme.color(Theme.DSactiveTrackHover)
    property string themeSliderActiveTrackFocus: "#aaaaaa"//Theme.color(Theme.DSsliderActiveTrackFocus)
    property string themeSliderInactiveTrack: "#aaaaaa"//Theme.color(Theme.DSsliderInactiveTrack)
    property string themeSliderInactiveTrackHover: "#505050"//Theme.color(Theme.DSsliderInactiveTrackHover)
    property string themeSliderInactiveTrackFocus: "#606060"//Theme.color(Theme.DSsliderInactiveTrackFocus)
    property string themeSliderHandle: "#1f1f1f"//Theme.color(Theme.DSsliderHandle)
    property string themeSliderHandleHover: "#606060"//Theme.color(Theme.DSsliderHandleHover)
    property string themeSliderHandleFocus: "#0492c9"//Theme.color(Theme.DSsliderHandleFocus)
    property string themeSliderHandleInteraction: values.themeInteraction

    property string themeScrollBarTrack: "#b5b4b4"//Theme.color(Theme.DSscrollBarTrack)
    property string themeScrollBarHandle: "#9b9b9b"//Theme.color(Theme.DSscrollBarHandle)

    property string themeSectionHeadBackground: "#d8d8d8"//Theme.color(Theme.DSsectionHeadBackground)

    property string themeTabDark: "#111111"//Theme.color(Theme.QmlDesigner_TabDark)
    property string themeTabLight: "#262626"//Theme.color(Theme.QmlDesigner_TabLight)

    property string themeStateDefaultHighlight: "#ffe400"

    // Taken out of Constants.js
    property string themeChangedStateText: "#99ccff"//Theme.color(Theme.DSchangedStateText)

    // 3D
    property string theme3DAxisXColor: "#d00000"//Theme.color(Theme.DS3DAxisXColor)
    property string theme3DAxisYColor: "#009900"//Theme.color(Theme.DS3DAxisYColor)
    property string theme3DAxisZColor: "#5050ff"//Theme.color(Theme.DS3DAxisZColor)

    property string themeActionBinding: "#2aafd3"
    property string themeActionAlias: "#f93a3a"
    property string themeActionKeyframe: "#e0e01b"
    property string themeActionJIT: "#2db543"
}
