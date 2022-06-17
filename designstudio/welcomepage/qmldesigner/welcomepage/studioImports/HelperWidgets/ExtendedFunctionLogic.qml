import QtQuick 2.12

import StudioControls 1.0 as StudioControls
import StudioTheme 1.0 as StudioTheme

Item {
    id: root

    property bool hasBinding: false
    property bool hasAlias: false
    property bool hasKeyframe: false
    property bool hasJIT: false

    property string glyph: StudioTheme.Constants.actionIcon
    property string color: StudioTheme.Values.themeTextColor
    property alias menuLoader: menuLoader

    signal reseted

    property bool menuVisible: false

    onReseted: {
        root.hasBinding = false
        root.hasAlias = false
        root.hasKeyframe = false
        root.hasJIT = false

        root.setIcon()
    }

    function show() {
        menuLoader.show()
    }

    function setIcon() {
        if (root.hasBinding) {
            root.glyph = StudioTheme.Constants.actionIconBinding
            root.color = StudioTheme.Values.themeActionBinding
            return
        }

        if (root.hasAlias) {
            root.glyph = StudioTheme.Constants.aliasProperty
            root.color = StudioTheme.Values.themeActionAlias
            return
        }

        if (root.hasKeyframe) {
            root.glyph = StudioTheme.Constants.keyframe
            root.color = StudioTheme.Values.themeActionKeyframe
            return
        }

        if (root.hasJIT) {
            root.glyph = StudioTheme.Constants.promote
            root.color = StudioTheme.Values.themeActionJIT
            return
        }

        root.glyph = StudioTheme.Constants.actionIcon
        root.color = StudioTheme.Values.themeTextColor
    }

    onHasBindingChanged: root.setIcon()
    onHasAliasChanged: root.setIcon()
    onHasKeyframeChanged: root.setIcon()
    onHasJITChanged: root.setIcon()

    Loader {
        id: menuLoader

        active: false

        function show() {
            menuLoader.active = true
            item.popup()
        }

        sourceComponent: Component {
            StudioControls.Menu {
                id: menu

                width: 134 * StudioTheme.Values.scaleFactor // TODO static width 134

                onAboutToShow: root.menuVisible = true
                onAboutToHide: root.menuVisible = false

                StudioControls.MenuItemWithIcon {
                    text: qsTr("Reset All")
                    onTriggered: root.reseted()
                }
                StudioControls.MenuItemWithIcon {
                    id: bindingItem
                    text: bindingItem.checked ? qsTr("Remove Binding") : qsTr("Add Binding")
                    onTriggered: root.hasBinding = !root.hasBinding
                    checkable: true
                    checked: root.hasBinding
                }
                StudioControls.MenuItemWithIcon {
                    id: aliasItem
                    text: aliasItem.checked ? qsTr("Remove Alias") : qsTr("Create Alias")
                    onTriggered: root.hasAlias = !root.hasAlias
                    checkable: true
                    checked: root.hasAlias
                }
                StudioControls.MenuItemWithIcon {
                    id: keyframeItem
                    text: keyframeItem.checked ? qsTr("Remove Keyframe") : qsTr("Add Keyframe")
                    onTriggered: root.hasKeyframe = !root.hasKeyframe
                    checkable: true
                    checked: root.hasKeyframe
                }
                StudioControls.MenuItemWithIcon {
                    id: jitItem
                    text: jitItem.checked ? qsTr("Remove from JIT") : qsTr("Promote to JIT")
                    onTriggered: root.hasJIT = !root.hasJIT
                    checkable: true
                    checked: root.hasJIT
                }
            }
        }
    }
}
