import QtQuick 2.15
import QtQuick.Window 2.15

// win下的系统按钮
Item {
    id: win_system_button
    property Window target: null
    property bool darkMode: false
    property bool disableMinimizeButton: false
    property bool disableMaximizeButton: false
    property bool disableCloseButton: false


    anchors.right: parent.right
    anchors.top: parent.top
    width: childrenRect.width
    height: childrenRect.height
    property string minMaxHoverColor: "#33888888"
    property string closeHoverColor: "#ccff0000"


    Row {
        spacing: 0

        // win最小化按钮
        Rectangle {
            visible: !disableMinimizeButton
            width: 48
            height: 28

            color: win_min_button.containsMouse ? minMaxHoverColor : "#00ffffff"

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
                    if (Qt.platform.os === 'osx') {
                        target.flags = 0 // mac无边框导致不能最小化，先重置成有边框，再最小化
                        target.showMinimized()
                    }
                    else {
                        // target.hide()
                        target.showMinimized()

                    }
                }
            }
        }

        // win最大化按钮
        Rectangle {
            visible: !disableMaximizeButton
            width: 48
            height: 28

            color: win_max_button.containsMouse ? minMaxHoverColor : "#00ffffff"

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
                    if (target.visibility === Window.Maximized) {
                        target.showNormal()
                    }
                    else {
                        target.showMaximized()
                    }
                }
            }
        }

        // win关闭按钮
        Rectangle {
            visible: !disableCloseButton
            width: 50
            height: 28

            color: win_close_button.containsMouse ? closeHoverColor : "#00ffffff"

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
                    target.close()
                }
            }
        }
    }
}
