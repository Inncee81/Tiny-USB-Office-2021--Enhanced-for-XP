/*
    SPDX-FileCopyrightText: 2016 Marco Martin <mart@kde.org>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick 2.7
import QtQuick.Controls 2.15
import QtQuick.Templates 2.15 as T
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kirigami 2.5 as Kirigami

T.Menu {
    id: control

 palette: Kirigami.Theme.palette
    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem ? contentItem.implicitWidth + leftPadding + rightPadding : 0)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem ? contentItem.implicitHeight : 0) + topPadding + bottomPadding

    delegate: MenuItem { width: parent.width; onImplicitWidthChanged: control.contentItem.contentItem.childrenChanged() }

    margins: 0
    leftPadding: background.margins.left
    topPadding: background.margins.top
    rightPadding: background.margins.right
    bottomPadding: background.margins.bottom

    contentItem: ListView {
        implicitHeight: contentHeight
        property bool hasCheckables: false
        property bool hasIcons: false
        model: control.contentModel

        implicitWidth: {
            var maxWidth = 0;
            for (var i = 0; i < contentItem.children.length; ++i) {
                maxWidth = Math.max(maxWidth, contentItem.children[i].implicitWidth);
            }
            return maxWidth;
        }

        interactive: ApplicationWindow.window ? contentHeight > ApplicationWindow.window.height : false
        clip: true
        currentIndex: control.currentIndex || 0
        keyNavigationEnabled: true
        keyNavigationWraps: true

        T.ScrollBar.vertical: ScrollBar {}
    }

    enter: Transition {
        NumberAnimation {
            property: "opacity"
            from: 0
            to: 1
            easing.type: Easing.InOutQuad
            duration: 150
        }
    }

    exit: Transition {
        NumberAnimation {
            property: "opacity"
            from: 1
            to: 0
            easing.type: Easing.InOutQuad
            duration: 150
        }
    }

    background: PlasmaCore.FrameSvgItem {
        imagePath: "widgets/background"
        implicitWidth: units.gridUnit * 8
        implicitHeight: units.gridUnit * 2
    }
}
