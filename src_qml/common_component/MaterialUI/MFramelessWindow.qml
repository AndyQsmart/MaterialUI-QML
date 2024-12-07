import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Shapes 1.15

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
        // 重置窗口背景色
        if (root.visibility !== Window.FullScreen) {
            root.flags = 0
            root.flags = Qt.WindowMinimizeButtonHint | Qt.WA_TranslucentBackground | Qt.FramelessWindowHint | (enableBorderShadow ? 0 : Qt.NoDropShadowWindowHint)
        }
    }


    MPaper {
        id: bg_container
        anchors.fill: parent
        z: -1
        radius: systemType == "mac" ? (root.visibility !== Window.FullScreen ? 10 : 0) : 6
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
        Item {
            visible: systemType !== "mac"

            id: win_system_button
            anchors.right: parent.right
            anchors.top: parent.top
            width: childrenRect.width
            height: childrenRect.height
            // property bool activeSystemButton: win_system_button.containsMouse || root.activeFocusItem
            // property string deactiveColor: darkMode ? "#5a5959" : "#d2d2d1"
            // property string deactiveBorderColor: "#b5b3b3" // 仅浅色模式按钮有边框
            Row {
                spacing: 0

                // win最小化按钮
                Rectangle {
                    width: 48
                    height: 28

                    color: win_min_button.containsMouse ? "#33888888" : "#00ffffff"

                    Image {
                        scale: win_min_button.pressed ? 0.7 : 1 // 0.1秒动画
                        x: (parent.width-width)/2
                        y: (parent.height-height)/2
                        width: 9
                        height: 0.75
                        sourceSize.width: width*2
                        sourceSize.height: height*2
                        source: `data:image/svg+xml;utf8,<svg viewBox="0 0 384 32" xmlns="http://www.w3.org/2000/svg">
<line x1="16" y1="16" x2="368" y2="16" stroke="${darkMode ? "#ffffff" : "#000000"}" stroke-width="32" stroke-linecap="round"/>
</svg>`
                    }

                    MouseArea {
                        id: win_min_button
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            root.flags = 0 // 无边框导致不能最小化，先重置成有边框，再最小化
                            root.showMinimized()
                        }
                    }
                }

                // win最大化按钮
                Rectangle {
                    width: 48
                    height: 28

                    color: win_max_button.containsMouse ? "#33888888" : "#00ffffff"

                    Image {
                        scale: win_max_button.pressed ? 0.7 : 1
                        x: (parent.width-width)/2
                        y: (parent.height-height)/2
                        width: root.visibility === Window.Maximized ? 10 : 9
                        height: width
                        sourceSize.width: width*2
                        sourceSize.height: height*2
                        source: root.visibility === Window.Maximized ?
                            `data:image/svg+xml;utf8,<svg stroke="${darkMode ? "#ffffff" : "#000000"}" stroke-width="32" viewBox="0 0 426 426" xmlns="http://www.w3.org/2000/svg">
<path fill="none" d="M 56 100 L 286 100 A 40 40 0 0 1 326 140 L 326 370 A 40 40 0 0 1 286 410 L 56 410 A 40 40 0 0 1 16 370 L 16 140 A 40 40 0 0 1 56 100" />
<path fill="none" d="M 100 64 A 48 48 0 0 1 148 16 L 330 16 A 80 80 0 0 1 410 96 L 410 278 A 48 48 0 0 1 362 326" />
</svg>`
                        :
                            `data:image/svg+xml;utf8,<svg viewBox="0 0 384 384" xmlns="http://www.w3.org/2000/svg">
<path stroke="${darkMode ? "#ffffff" : "#000000"}" stroke-width="32" fill="none" d="M 56 16 L 328 16 A 40 40 0 0 1 368 56 L 368 326 A 40 40 0 0 1 326 368 L 56 368 A 40 40 0 0 1 16 326 L 16 56 A 40 40 0 0 1 56 16" />
</svg>`
                    }

                    MouseArea {
                        id: win_max_button
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            if (root.visibility === Window.Maximized) {
                                root.showNormal()
                            }
                            else {
                                root.showMaximized()
                            }
                        }
                    }
                }

                // win关闭按钮
                Rectangle {
                    width: 50
                    height: 28

                    color: win_close_button.containsMouse ? "#ccff0000" : "#00ffffff"

                    Image {
                        scale: win_close_button.pressed ? 0.7 : 1
                        x: (parent.width-width)/2
                        y: (parent.height-height)/2
                        width: 10
                        height: 10
                        sourceSize.width: width*2
                        sourceSize.height: height*2
                        source: `data:image/svg+xml;utf8,<svg viewBox="0 0 344 344" stroke="${darkMode || win_close_button.containsMouse ? "#ffffff" : "#000000"}" stroke-width="26" xmlns="http://www.w3.org/2000/svg">
<line x1="19" y1="19" x2="325" y2="325" stroke-linecap="round"/>
<line x1="325" y1="19" x2="19" y2="325" stroke-linecap="round"/>
</svg>`
                    }

                    MouseArea {
                        id: win_close_button
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            root.close()
                        }
                    }
                }
            }
        }


        // mac下的系统按钮
        Item {
            visible: systemType === "mac" && root.visibility !== Window.FullScreen

            id: mac_system_button
            x: 8
            y: 8
            width: childrenRect.width
            height: childrenRect.height
            property bool activeSystemButton: mac_system_button_area.containsMouse || root.activeFocusItem
            property string deactiveColor: darkMode ? "#5a5959" : "#d2d2d1"
            property string deactiveBorderColor: "#b5b3b3" // 仅浅色模式按钮有边框

            Row {
                spacing: 8

                // mac关闭按钮
                Rectangle {
                    width: 12
                    height: 12
                    radius: 6
                    color: mac_system_button.activeSystemButton ? "#fc605c" : mac_system_button.deactiveColor
                    border.width: darkMode ? 0 : 1
                    border.color: mac_system_button.activeSystemButton ? "#f34042" : mac_system_button.deactiveBorderColor

                    Image {
                        visible: mac_system_button_area.containsMouse
                        x: (parent.width-width)/2
                        y: (parent.height-height)/2
                        width: 6
                        height: 6
                        sourceSize.width: width*2
                        sourceSize.height: height*2
                        source: `data:image/svg+xml;utf8,<svg width="100" height="100" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
<line x1="0" y1="0" x2="100" y2="100" stroke="#98040c" stroke-width="17.5" stroke-linecap="round"/>
<line x1="100" y1="0" x2="0" y2="100" stroke="#98040c" stroke-width="17.5" stroke-linecap="round"/>
</svg>`
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            root.close()
                        }
                    }
                }

                // mac最小化按钮
                Rectangle {
                    width: 12
                    height: 12
                    radius: 6
                    color: mac_system_button.activeSystemButton ? "#fcbb40" : mac_system_button.deactiveColor
                    border.width: darkMode ? 0 : 1
                    border.color: mac_system_button.activeSystemButton ? "#eb9d29" : mac_system_button.deactiveBorderColor

                    Image {
                        visible: mac_system_button_area.containsMouse
                        x: (parent.width-width)/2
                        y: (parent.height-height)/2
                        width: 8.5
                        height: 1.5
                        sourceSize.width: width*2
                        sourceSize.height: height*2
                        source: `data:image/svg+xml;utf8,<svg viewBox="0 0 68 12" xmlns="http://www.w3.org/2000/svg">
<line x1="6" y1="6" x2="62" y2="6" stroke="#915619" stroke-width="10" stroke-linecap="round"/>
</svg>`
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            root.flags = 0 // 无边框导致不能最小化，先重置成有边框，再最小化
                            root.showMinimized()
                        }
                    }
                }

                // mac全屏按钮
                Rectangle {
                    width: 12
                    height: 12
                    radius: 6
                    color: mac_system_button.activeSystemButton ? "#34c648" : mac_system_button.deactiveColor
                    border.width: darkMode ? 0 : 1
                    border.color: mac_system_button.activeSystemButton ? "#20a932" : mac_system_button.deactiveBorderColor

                    Image {
                        visible: mac_system_button_area.containsMouse
                        x: (parent.width-width)/2
                        y: (parent.height-height)/2
                        width: 6
                        height: 6
                        sourceSize.width: width*2
                        sourceSize.height: height*2
                        source: `data:image/svg+xml;utf8,<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
<path d="M 0 75 L 0 12.5 A 12.5 12.5 0 0 1 12.5 0 L 75 0" fill="#0a600b"/>
<path d="M 25 100 L 87.5 100 A 12.5 12.5 0 0 0 100 87.5 L 100 25" fill="#0a600b"/>
</svg>`
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            root.showFullScreen()
                        }
                    }
                }
            }

            MouseArea {
                id: mac_system_button_area
                anchors.fill: parent
                acceptedButtons: Qt.NoButton
                hoverEnabled: true
            }
        }
    }

    DragHandler {
        onActiveChanged: if(active) startSystemMove();
    }

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

