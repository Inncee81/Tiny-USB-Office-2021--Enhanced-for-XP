/*
    SPDX-FileCopyrightText: 2016 Marco Martin <mart@kde.org>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick 2.6
import QtQuick.Controls 2.15
import QtQuick.Templates 2.15 as T
import org.kde.plasma.core 2.0 as PlasmaCore

T.Frame {
    id: control

    implicitWidth: contentWidth + leftPadding + rightPadding
    implicitHeight: contentHeight + topPadding + bottomPadding

    contentWidth: contentItem.implicitWidth || (contentChildren.length === 1 ? contentChildren[0].implicitWidth : 0)
    contentHeight: contentItem.implicitHeight || (contentChildren.length === 1 ? contentChildren[0].implicitHeight : 0)

    padding: units.smallSpacing

    background: PlasmaCore.FrameSvgItem {
        imagePath: "widgets/frame"
        prefix: "plain"
    }
}
