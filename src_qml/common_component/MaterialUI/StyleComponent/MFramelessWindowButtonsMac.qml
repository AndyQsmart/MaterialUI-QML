import QtQuick 2.15
import QtQuick.Window 2.15

// mac下的系统按钮
Item {
    id: mac_system_button
    property Window target: null
    property bool darkMode: false
    property bool disableMinimizeButton: false
    property bool disableMaximizeButton: false
    property bool disableCloseButton: false


    anchors.top: parent.top
    anchors.left: parent.left
    anchors.topMargin: 8
    anchors.leftMargin: 8
    width: childrenRect.width
    height: childrenRect.height
    property bool activeSystemButton: mac_system_button_area.containsMouse || root.activeFocusItem
    property string deactiveColor: darkMode ? "#5a5959" : "#d2d2d1"
    property string deactiveBorderColor: "#b5b3b3" // 仅浅色模式按钮有边框

    Row {
        spacing: 8

        // mac关闭按钮
        Rectangle {
            visible: !disableCloseButton
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
                    target.close()
                }
            }
        }

        // mac最小化按钮
        Rectangle {
            visible: !disableMinimizeButton
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
                    if (Qt.platform.os === 'osx') {
                        target.flags = 0 // mac无边框导致不能最小化，先重置成有边框，再最小化
                        target.showMinimized()
                    }
                    else {
                        target.hide()
                    }
                }
            }
        }

        // mac全屏按钮
        Rectangle {
            visible: !disableMaximizeButton
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
                    if (Qt.platform.os === 'osx') {
                        target.showFullScreen()
                    }
                    else {
                        target.showMaximized()
                    }
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
