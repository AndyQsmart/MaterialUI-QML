import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls.Material 2.0
import QtQuick.Controls 2.15
import Qt.labs.platform 1.1

SystemTrayIcon {
    signal showWindow()
    signal quitApp()

    visible: true
    icon.source: "../../common_image/Icon/logo.png"

    onActivated: {
        if (reason === SystemTrayIcon.Trigger) {
            showWindow()
        }
    }

    menu: Menu {
        MenuItem {
            text: qsTr("显示窗口")
            onTriggered: showWindow()
        }

        MenuItem {
            text: qsTr("退出")
            onTriggered: quitApp()
        }
    }
}
