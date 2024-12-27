import QtQuick
import Qt.labs.platform

SystemTrayIcon {
    signal showWindow()
    signal quitApp()

    visible: true
    icon.source: "qrc:/src_qml/common_image/Icon/logo.png"

    onActivated: function(reason) {
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
