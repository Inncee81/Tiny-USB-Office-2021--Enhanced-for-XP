/*
    SPDX-FileCopyrightText: 2016 Marco Martin <mart@kde.org>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick 2.6
import QtQuick.Templates 2.15 as T
import org.kde.plasma.core 2.0 as PlasmaCore

T.DialogButtonBox {
    id: control

    implicitWidth: contentItem.implicitWidth + leftPadding + rightPadding
    implicitHeight: contentItem.implicitHeight + topPadding + bottomPadding

    spacing: units.smallSpacing
    leftPadding: parent.leftPadding
    topPadding: parent.topPadding
    rightPadding: parent.rightPadding
    bottomPadding: parent.bottomPadding
    alignment: Qt.AlignRight

    delegate: Button {
        width: Math.min(implicitWidth, control.width / control.count - control.rightPadding - control.spacing * (control.count-1))
    }

    contentItem: ListView {
        implicitWidth: contentWidth
        implicitHeight: units.gridUnit * 1.6

        model: control.contentModel
        spacing: control.spacing
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        snapMode: ListView.SnapToItem
    }

    background: Item {}
}
