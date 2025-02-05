/*
    SPDX-FileCopyrightText: 2016 Marco Martin <mart@kde.org>

    SPDX-License-Identifier: LGPL-2.0-or-later
*/

import QtQuick 2.6
import QtQuick.Templates 2.15 as T
import org.kde.plasma.core 2.0 as PlasmaCore

T.ProgressBar {
    id: control

    implicitWidth: units.gridUnit * 8
    implicitHeight: background.implicitHeight

    hoverEnabled: true

    contentItem: Item {
        scale: control.mirrored ? -1 : 1
        PlasmaCore.FrameSvgItem {
            id: indicator
            height: parent.height
            width: control.indeterminate ? units.gridUnit * 2 : parent.width * control.position
            imagePath: "widgets/bar_meter_horizontal"
            prefix: "bar-active"
            colorGroup: PlasmaCore.ColorScope.colorGroup
            visible: width > indicator.fixedMargins.left
        }

        SequentialAnimation {
            id: anim
            loops: Animation.Infinite

            alwaysRunToEnd: true
            running: control.indeterminate && control.visible

            PropertyAnimation {
                target: indicator
                property: "x"
                duration: 800
                to: control.width - indicator.width
                onToChanged: {
                    //the animation won't update the boundaries automatically
                    if (anim.running) {
                        anim.restart();
                    }
                }
            }
            PropertyAnimation {
                target: indicator
                property: "x"
                duration: 800
                to: 0
            }
        }
    }

    background: PlasmaCore.FrameSvgItem {
        imagePath: "widgets/bar_meter_horizontal"
        prefix: "bar-inactive"
        colorGroup: PlasmaCore.ColorScope.colorGroup
    }
}
