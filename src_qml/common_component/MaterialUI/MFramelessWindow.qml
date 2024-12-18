import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Shapes 1.15
import "./StyleComponent"

Window {
    id: root
    property bool enableBorderShadow: true
    property bool darkMode: false // system_palette.window.hslLightness < 0.5
    property string backgroundColor: "#ffffff"
    property alias dragBar: drag_bar
    property alias winSystemButtonBar: win_system_button_bar
    property alias macSystemButtonBar: mac_system_button_bar
    // 除了mac，其他都按照win的方式渲染 // Qt.platform.os === 'windows' || Qt.platform.os==="winrt"
    property string systemType: Qt.platform.os === 'osx' ? "mac" : "win"
    property bool disableMinimizeButton: false
    property bool disableMaximizeButton: false
    property bool disableCloseButton: false
    property int windowFlags: 0

    // property int safeAreaOrigin: Item.TopLeft // Item.TopLeft | Item.TopRight
    // property Item safeAreaRect: Item {
    //     x: 0
    //     y: 0
    //     width: 0
    //     height: 0
    // }




    default property alias data: bg_container.data
    property int winFlags: windowFlags | Qt.Window | Qt.WindowSystemMenuHint | Qt.WindowMinimizeButtonHint | Qt.FramelessWindowHint | (enableBorderShadow ? 0 : Qt.NoDropShadowWindowHint)
    property int macFlags: windowFlags | Qt.WindowMinimizeButtonHint | Qt.FramelessWindowHint | (enableBorderShadow ? 0 : Qt.NoDropShadowWindowHint)
    flags: Qt.platform.os === 'osx' ? macFlags : winFlags
    color: "transparent"
    // title: "窗口"

    // SystemPalette {
    //     id: system_palette
    // }

    property int lastVisibility: -1

    onVisibilityChanged: {
        if (Qt.platform.os === 'osx') {
            // mac全屏后，退出全屏背景色有问题，重置窗口背景色
            if (root.lastVisibility === Window.FullScreen && root.visibility !== Window.FullScreen) {
                root.flags = 0
                root.flags = macFlags
            }

            // mac最小化需要flags取消无边框，退出最小化后，重置flags
            if (root.lastVisibility === Window.Minimized && root.visibility !== Window.Minimized) {
                root.flags = macFlags
            }

            lastVisibility = root.visibility
        }
    }

    MPaper {
        id: bg_container
        anchors.fill: parent
        radius: systemType == "mac" ? (root.visibility !== Window.FullScreen ? 10 : 0) : (root.visibility !== Window.Maximized ? 6 : 0)
        elevation: 0

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: bg_container.width
                height: bg_container.height
                radius: bg_container.radius
            }
        }

        color: root.backgroundColor

        // 窗口拖动区域
        MouseArea {
            id: drag_bar
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            height: systemType == "mac" ? 28 : 28

            onPressed: {
                startSystemMove()
            }
        }

        // win下的系统按钮
        MFramelessWindowButtonsWin {
            id: win_system_button_bar
            visible: systemType !== "mac"
            disableMinimizeButton: root.disableMinimizeButton
            disableMaximizeButton: root.disableMaximizeButton
            disableCloseButton: root.disableCloseButton
            darkMode: root.darkMode
            target: root
            z: 900
        }

        // mac下的系统按钮
        MFramelessWindowButtonsMac {
            id: mac_system_button_bar
            visible: systemType === "mac" && root.visibility !== Window.FullScreen
            disableMinimizeButton: root.disableMinimizeButton
            disableMaximizeButton: root.disableMaximizeButton
            disableCloseButton: root.disableCloseButton
            darkMode: root.darkMode
            target: root
            z: 900
        }

        // 窗口调整大小区域
        MWindowResizeHandler {
            anchors.fill: parent
            target: root
            z: 1000
        }
    }
}

