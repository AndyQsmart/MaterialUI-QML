import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Shapes 1.15
import "./StyleComponent"

Window {
    id: root
    property bool enableBorderShadow: true
    property bool darkMode: false // system_palette.window.hslLightness < 0.5
    property int safeAreaOrigin: Item.TopLeft // Item.TopLeft | Item.TopRight
    property Item safeAreaRect: Item {
        x: 0
        y: 0
        width: 0
        height: 0
    }
    property string backgroundColor: "#ffffff"
    // property Item toolBarButton: mac_system_button

    // Qt.platform.os === 'windows' || Qt.platform.os==="winrt"
    // 除了mac，其他都按照win的方式渲染
    property string systemType: Qt.platform.os === 'osx' ? "mac" : "win"

//    default property alias children: bg_container.children



    flags: Qt.WindowMinimizeButtonHint | Qt.WA_TranslucentBackground | Qt.FramelessWindowHint | (enableBorderShadow ? 0 : Qt.NoDropShadowWindowHint)
    color: "transparent"


    // SystemPalette {
    //     id: system_palette
    // }

    onVisibilityChanged: {
        // mac全平后，退出全屏背景色有问题，重置窗口背景色
        if (Qt.platform.os === 'osx') {
            if (root.visibility !== Window.FullScreen) {
                root.flags = 0
                root.flags = Qt.WindowMinimizeButtonHint | Qt.WA_TranslucentBackground | Qt.FramelessWindowHint | (enableBorderShadow ? 0 : Qt.NoDropShadowWindowHint)
            }
        }
    }


    MPaper {
        id: bg_container
        anchors.fill: parent
        z: -1
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

        // win下的系统按钮
        MFramelessWindowButtonsWin {
            visible: systemType !== "mac"
            darkMode: root.darkMode
            target: root
        }

        MFramelessWindowButtonsMac {
            visible: systemType === "mac" && root.visibility !== Window.FullScreen
            darkMode: root.darkMode
            target: root
        }

    }

    // 拖动需要排除按钮区域
    DragHandler {
        onActiveChanged: {
            if(active) startSystemMove()
        }
    }

    // startSystemResize 参数：
    // startSystemResize 需要一个参数，指示在哪个位置启动调整大小操作。常见的枚举值有：
    // Qt.LeftEdge：窗口左边缘
    // Qt.RightEdge：窗口右边缘
    // Qt.TopEdge：窗口上边缘
    // Qt.BottomEdge：窗口下边缘
    // Qt.TopLeftCorner：窗口左上角
    // Qt.TopRightCorner：窗口右上角
    // Qt.BottomLeftCorner：窗口左下角
    // Qt.BottomRightCorner：窗口右下角

    // MouseArea {
    //     id: mouseArea
    //     anchors.fill: parent
    //     hoverEnabled: true
    //     acceptedButtons: Qt.LeftButton
    //     z: 100

    //     property int edges: 0;
    //     property int edgeOffest: 5;

    //     function setEdges(x, y) {
    //         edges = 0;
    //         if(x < edgeOffest) edges |= Qt.LeftEdge;
    //         if(x > (width - edgeOffest))  edges |= Qt.RightEdge;
    //         if(y < edgeOffest) edges |= Qt.TopEdge;
    //         if(y > (height - edgeOffest)) edges |= Qt.BottomEdge;
    //     }

    //     cursorShape: {
    //         return !containsMouse ? Qt.ArrowCursor:
    //                 edges == 3 || edges == 12 ? Qt.SizeFDiagCursor :
    //                 edges == 5 || edges == 10 ? Qt.SizeBDiagCursor :
    //                 edges & 9 ? Qt.SizeVerCursor :
    //                 edges & 6 ? Qt.SizeHorCursor : Qt.ArrowCursor;
    //     }

    //     onPositionChanged: {
    //         setEdges(mouseX, mouseY);
    //     }
    //     onPressed: {
    //         setEdges(mouseX, mouseY);
    //         if(edges && containsMouse) {
    //             startSystemResize(edges);
    //         }
    //     }
    // }
}

