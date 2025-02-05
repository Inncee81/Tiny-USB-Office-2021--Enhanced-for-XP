/*
    SPDX-FileCopyrightText: 2019 Dan Leinir Turthra Jensen <admin@leinir.dk>

    SPDX-License-Identifier: LGPL-2.1-only OR LGPL-3.0-only OR LicenseRef-KDE-Accepted-LGPL
*/

/**
 * @brief A dialog which has a NewStuff.Page at the base
 *
 * This component is equivalent to the old DownloadDialog, but you should consider
 * using NewStuff.Page instead for a more modern style of integration into your
 * application's flow.
 * @see KNewStuff::DownloadDialog
 * @since 5.63
 */

import QtQuick 2.11
import QtQuick.Controls 2.5 as QtControls
import QtQuick.Layouts 1.11 as QtLayouts
import QtQuick.Dialogs 1.3 as QtDialogs

import org.kde.kirigami 2.7 as Kirigami
import org.kde.newstuff 1.62 as NewStuff

QtDialogs.Dialog {
    id: component

    /**
     * The configuration file to use for this button
     */
    property alias configFile: newStuffPage.configFile

    /**
     * Set the text that should appear as the dialog's title. Will be set as
     * i18nd("knewstuff5", "Download New %1").
     *
     * @default The name defined by your knsrc config file
     * @note For the sake of consistency, you should NOT override the title property, just set this one
     */
    property string downloadNewWhat: engine.name
    title: component.downloadNewWhat.length > 0 ? i18ndc("knewstuff5", "The dialog title when we know which type of stuff is being requested", "Download New %1", component.downloadNewWhat) : i18ndc("knewstuff5", "A placeholder title used in the dialog when there is no better title available", "Download New Stuff")

    /**
     * The engine which handles the content in this dialog
     */
    property alias engine: newStuffPage.engine

    /**
     * The default view mode of the dialog spawned by this button. This should be
     * set using the NewStuff.Page.ViewMode enum
     * @see NewStuff.Page.ViewMode
     */
    property alias viewMode: newStuffPage.viewMode

    /**
     * emitted when the Hot New Stuff dialog is about to be shown, usually
     * as a result of the user having click on the button
     */
    signal aboutToShowDialog();

    /**
     * Contains the entries which have been changed.
     * @note This is cleared when the dialog is shown, so the changed entries are those
     * changed since the dialog was opened most recently (rather than the lifetime
     * of the instance of the Dialog component)
     */
    property alias changedEntries: component.engine.changedEntries

    onVisibleChanged: {
        if (visible === true) {
            newStuffPage.engine.resetChangedEntries();
        }
    }

    contentItem: Rectangle {
        color: Kirigami.Theme.backgroundColor
        implicitWidth: 700
        implicitHeight: 540
        Keys.onEscapePressed: component.close()
        NewStuff.DialogContent {
            id: newStuffPage
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                bottom: buttonBox.top
            }
            downloadNewWhat: component.downloadNewWhat
        }
        QtControls.DialogButtonBox {
            id: buttonBox
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            standardButtons: QtControls.DialogButtonBox.Close
            onRejected: component.close()
        }
    }
}
