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

pragma Singleton
import QtQuick 2.12
//import QtQuickDesignerTheme 1.0

QtObject {
    id: values

    property int style: 0

    property QtObject dark: Values_dark {}
    property QtObject light: Values_light {}

    property QtObject theme: style === 0 ? values.dark : values.light
    property bool isLightTheme: themeControlBackground.hsvValue > themeTextColor.hsvValue

    property real baseHeight: 25
    property real baseFont: 12
    property real baseIconFont: 12

    property real scaleFactor: 1.0

    property real height: Math.round(values.baseHeight * values.scaleFactor)
    property real myFontSize: Math.round(values.baseFont * values.scaleFactor)
    property real myIconFontSize: Math.round(values.baseIconFont * values.scaleFactor)

    property real squareComponentWidth: values.height
    property real smallRectWidth: values.height / 2 * 1.5

    property real inputWidth: values.height * 4

    property real sliderHeight: values.height / 2 * 1.5 // TODO:Have a look at -> sliderAreaHeight: Data.Values.height/2*1.5

    property real sliderControlSize: 12
    property real sliderControlSizeMulti: values.sliderControlSize * values.scaleFactor

    property int dragThreshold: 10 // px
    property real spinControlIconSize: 8
    property real spinControlIconSizeMulti: values.spinControlIconSize * values.scaleFactor

    property real sliderTrackHeight: values.height / 3
    property real sliderHandleHeight: values.sliderTrackHeight * 1.8
    property real sliderHandleWidth: values.sliderTrackHeight * 0.5
    property real sliderFontSize: Math.round(8 * values.scaleFactor)
    property real sliderPadding: Math.round(6 * values.scaleFactor)
    property real sliderMargin: Math.round(3 * values.scaleFactor)

    property real sliderPointerWidth: Math.round(7 * values.scaleFactor)
    property real sliderPointerHeight: Math.round(2 * values.scaleFactor)

    property real checkBoxSpacing: Math.round(6 * values.scaleFactor)

    property real columnWidth: 225 + (175 * (values.scaleFactor * 2))

    property real marginTopBottom: 4
    property real border: 1

    property real maxComboBoxPopupHeight: Math.round(300 * values.scaleFactor)
    property real maxTextAreaPopupHeight: Math.round(150 * values.scaleFactor)

    property real contextMenuLabelSpacing: Math.round(30 * values.scaleFactor)
    property real contextMenuHorizontalPadding: Math.round(6 * values.scaleFactor)

    property real inputHorizontalPadding: Math.round(6 * values.scaleFactor)

    property real scrollBarThickness: 10

    // NEW NEW NEW NEW NEW

    // Layout sizes
    property real sectionColumnSpacing: 30 // distance between label and sliderControlSize
    property real sectionRowSpacing: 5
    property real sectionHeadGap: 15
    property real sectionHeadHeight: 21 // tab and section
    property real sectionHeadSpacerHeight: 15

    property real controlLabelWidth: 15
    property real controlLabelGap: 5
    property real controlGap: 5 // TODO different name


    property real columnGap: 10

    property real iconAreaWidth: Math.round(21 * values.scaleFactor)

    property real linkControlWidth: values.iconAreaWidth
    property real linkControlHeight: values.height

    // Control sizes
    property real actionIndicatorWidth: values.iconAreaWidth //StudioTheme.Values.squareComponentWidth
    property real actionIndicatorHeight: values.height

    property real spinBoxIndicatorWidth: values.smallRectWidth - 2 * values.border
    property real spinBoxIndicatorHeight: values.height / 2 - values.border

    property real sliderIndicatorWidth: values.squareComponentWidth
    property real sliderIndicatorHeight: values.height

    property real translationIndicatorWidth: values.squareComponentWidth
    property real translationIndicatorHeight: values.height

    property real checkIndicatorWidth: values.squareComponentWidth
    property real checkIndicatorHeight: values.height

    property real singleControlColumnWidth: 2 * values.twoControlColumnWidth
                                            + values.controlLabelWidth
                                            + values.controlLabelGap + values.controlGap
                                            + values.actionIndicatorWidth
    property real twoControlColumnWidth: 57
    property real twoControlColumnWidthMin: 57
    property real twoControlColumnWidthMax: 171 // tripple

    property real controlColumnWithoutControlsWidth: 2 * (values.actionIndicatorWidth
                                         //+ values.twoControlColumnWidth
                                         + values.controlLabelWidth
                                         + values.controlLabelGap
                                         + values.controlGap)
                                      + values.linkControlWidth
                                      + values.scrollBarThickness

    property real controlColumnWidth: values.controlColumnWithoutControlsWidth
                                      + 2 * values.twoControlColumnWidth

    property real controlColumnWidthMin: values.controlColumnWithoutControlsWidth
                                         + 2 * values.twoControlColumnWidthMin

    property real propertyLabelWidth: 80
    property real propertyLabelWidthMin: 80
    property real propertyLabelWidthMax: 120

    property real columnFactor: values.propertyLabelWidthMin
                                / (values.propertyLabelWidthMin + values.controlColumnWidthMin)

    function responsiveResize(width) {
        console.log("responsiveResize( " + width + " )")
        var tmpWidth = width - values.sectionColumnSpacing
        var labelColumnWidth = Math.round(tmpWidth * values.columnFactor)

        labelColumnWidth = Math.max(Math.min(values.propertyLabelWidthMax, labelColumnWidth),
                                    values.propertyLabelWidthMin)

        var controlColumnWidth = tmpWidth - labelColumnWidth
        var controlWidth = (controlColumnWidth - values.controlColumnWithoutControlsWidth) * 0.5
        controlWidth = Math.max(Math.min(values.twoControlColumnWidthMax, controlWidth),
                                values.twoControlColumnWidthMin)

        values.propertyLabelWidth = labelColumnWidth
        values.twoControlColumnWidth = controlWidth
    }

    property real defaultControlWidth: values.squareComponentWidth * 5
    property real longControlWidth: values.squareComponentWidth * 10
    property real defaultControlHeight: values.height

    // Theme Colors

    property string themePanelBackground: values.theme.themePanelBackground

    property string welcomeScreenBackground: values.theme.welcomeScreenBackground //NEW COLOR _ NEEDS ADDING TO THEME
    property string themeSubPanelBackground: values.theme.themeSubPanelBackground //NEW COLOR _ NEEDS ADDING TO THEME
    property string themeThumbnailBackground: values.theme.themeThumbnailBackground //NEW COLOR _ NEEDS ADDING TO THEME
    property string themeThumbnailLabelBackground: values.theme.themeThumbnailLabelBackground //NEW COLOR _ NEEDS ADDING TO THEME

    property string themeInteraction: values.theme.themeInteraction
    property string themeError: values.theme.themeError
    property string themeDisabled: values.theme.themeDisabled

    // Control colors
    property color themeControlBackground: values.theme.themeControlBackground//Theme.color(Theme.DScontrolBackground)
    property string themeControlBackgroundInteraction: values.theme.themeControlBackgroundInteraction
    property string themeControlBackgroundDisabled: values.themePanelBackground//Theme.color(Theme.DScontrolBackgroundDisabled)
    property string themeControlBackgroundGlobalHover: values.theme.themeControlBackgroundGlobalHover
    property string themeControlBackgroundHover: values.theme.themeControlBackgroundHover

    property string themeControlOutline: values.theme.themeControlOutline
    property string themeControlOutlineInteraction: values.themeInteraction
    property string themeControlOutlineDisabled: values.themeDisabled//Theme.color(Theme.DScontrolOutlineDisabled)

    // Text colors
    property color themeTextColor: values.theme.themeTextColor
    property string themeTextColorDisabled: values.theme.themeTextColorDisabled
    property string themeTextSelectionColor: values.themeInteraction//Theme.color(Theme.DStextSelectionColor)
    property string themeTextSelectedTextColor: values.theme.themeTextSelectedTextColor

    // Icon colors
    property string themeIconColor: values.theme.themeIconColor
    property string themeIconColorHover: values.theme.themeIconColorHover
    property string themeIconColorInteraction: values.theme.themeIconColorInteraction
    property string themeIconColorDisabled: values.themeDisabled
    property string themeIconColorSelected: values.themeInteraction

    property string themeLinkIndicatorColor: values.theme.themeLinkIndicatorColor
    property string themeLinkIndicatorColorHover: values.theme.themeLinkIndicatorColorHover
    property string themeLinkIndicatorColorInteraction: values.themeInteraction

    // Popup background color (ComboBox, SpinBox, TextArea)
    property string themePopupBackground: values.theme.themePopupBackground

    // Slider colors
    property string themeSliderActiveTrack: values.theme.themeSliderActiveTrack
    property string themeSliderActiveTrackHover: values.theme.themeSliderActiveTrackHover
    property string themeSliderActiveTrackFocus: values.theme.themeSliderActiveTrackFocus
    property string themeSliderInactiveTrack: values.theme.themeSliderInactiveTrack
    property string themeSliderInactiveTrackHover: values.theme.themeSliderInactiveTrackHover
    property string themeSliderInactiveTrackFocus: values.theme.themeSliderInactiveTrackFocus
    property string themeSliderHandle: values.theme.themeSliderHandle
    property string themeSliderHandleHover: values.theme.themeSliderHandleHover
    property string themeSliderHandleFocus: values.theme.themeSliderHandleFocus
    property string themeSliderHandleInteraction: values.theme.themeSliderHandleInteraction

    property string themeScrollBarTrack: values.theme.themeScrollBarTrack
    property string themeScrollBarHandle: values.theme.themeScrollBarHandle

    property string themeSectionHeadBackground: values.theme.themeSectionHeadBackground

    property string themeTabDark: values.theme.themeTabDark
    property string themeTabLight: values.theme.themeTabLight

    property string themeStateDefaultHighlight: values.theme.themeStateDefaultHighlight
    // Taken out of Constants.js
    property string themeChangedStateText: values.theme.themeChangedStateText

    // 3D
    property string theme3DAxisXColor: values.theme.theme3DAxisXColor
    property string theme3DAxisYColor: values.theme.theme3DAxisYColor
    property string theme3DAxisZColor: values.theme.theme3DAxisZColor

    property string themeActionBinding: values.theme.themeActionBinding
    property string themeActionAlias: values.theme.themeActionAlias
    property string themeActionKeyframe: values.theme.themeActionKeyframe
    property string themeActionJIT: values.theme.themeActionJIT
}
