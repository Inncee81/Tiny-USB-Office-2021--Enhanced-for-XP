/*
    SPDX-FileCopyrightText: 2016 Marco Martin <mart@kde.org>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.15
import QtQuick.Templates 2.15 as T
import org.kde.plasma.core 2.0 as PlasmaCore
import "private" as Private
import org.kde.kirigami 2.5 as Kirigami
import "mobiletextselection" as MobileTextSelection

T.TextArea {
    id: control

    implicitWidth: Math.max(contentWidth + leftPadding + rightPadding,
                            background ? background.implicitWidth : 0,
                            placeholder.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(contentHeight + topPadding + bottomPadding,
                             background ? background.implicitHeight : 0,
                             placeholder.implicitHeight + topPadding + bottomPadding)

    padding: 6

    color: theme.viewTextColor
    selectionColor: theme.highlightColor
    selectedTextColor: theme.highlightedTextColor
    opacity: control.enabled ? 1 : 0.6
    wrapMode: Text.WordWrap
    verticalAlignment: TextEdit.AlignTop
    hoverEnabled: !Kirigami.Settings.tabletMode

    // Work around Qt bug where NativeRendering breaks for non-integer scale factors
    // https://bugreports.qt.io/browse/QTBUG-70481
    renderType: Screen.devicePixelRatio % 1 !== 0 ? Text.QtRendering : Text.NativeRendering

    selectByMouse: !Kirigami.Settings.tabletMode

    cursorDelegate: Kirigami.Settings.tabletMode ? mobileCursor : null
    Component {
        id: mobileCursor
        MobileTextSelection.MobileCursor {
            target: control
        }
    }

    onTextChanged: MobileTextSelection.MobileTextActionsToolBar.shouldBeVisible = false;
    onPressed: MobileTextSelection.MobileTextActionsToolBar.shouldBeVisible = true;

    onPressAndHold: {
        if (!Kirigami.Settings.tabletMode) {
            return;
        }
        forceActiveFocus();
        cursorPosition = positionAt(event.x, event.y);
        selectWord();
    }

    MobileTextSelection.MobileCursor {
        target: control
        selectionStartHandle: true
        property var rect: target.positionToRectangle(target.selectionStart)
        x: rect.x
        y: rect.y
    }

    onFocusChanged: {
        if (focus) {
            MobileTextSelection.MobileTextActionsToolBar.controlRoot = control;
        }
    }

    Label {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)

        text: control.placeholderText
        font: control.font
        color: theme.viewTextColor
        horizontalAlignment: control.horizontalAlignment
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
    }

    background: Item {
        Private.TextFieldFocus {
            state: control.activeFocus ? "focus" : (control.hovered ? "hover" : "hidden")
            anchors.fill: parent
        }
        PlasmaCore.FrameSvgItem {
            id: base
            anchors.fill: parent
            imagePath: "widgets/lineedit"
            prefix: "base"
        }
    }
}
