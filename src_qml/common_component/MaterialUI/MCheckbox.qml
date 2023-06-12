import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12
import "./styles"
import "./colors"

CheckBox {
    id: checkbox
    property string color: 'secondary' // 'default' 'primary' 'secondary'
    property bool disable: false
    property bool disableRipple: false
    property string size: 'medium' // 'medium' 'small' 暂未实现
    checked: false
    implicitWidth: 42
    implicitHeight: 42
    width: 42
    height: 42
    topPadding: 9
    rightPadding: 9
    bottomPadding: 9
    leftPadding: 9

    Rectangle {
        visible: checkbox.hovered
        anchors.fill: parent
        radius: width/2
        color: {
            if (checkbox.checked) {
                if (checkbox.color == 'primary') {
                    return Colors.alpha(Palette.primaryMain, 0.04)
                }
                else if (checkbox.color == 'secondary') {
                    return Colors.alpha(Palette.secondaryMain, 0.04)
                }
                else {
                    return Colors.alpha(Grey._600, 0.04)
                }
            }
            else {
                return Colors.alpha(Grey._600, 0.04)
            }
        }
    }

    background: Rectangle {
        id: bg
        x: parent.width/2 - width/2
        y: parent.height/2 - height/2
        width: 24
        height: 24
    }

    indicator: Rectangle {
        id: ind
        width: 18
        height: 18
        x: bg.x+3
        y: bg.y+3
        border.width: checkbox.checked ? 0 : 2
        border.color: Grey._600
        radius: 2
        color: {
            if (checkbox.checked) {
                if (checkbox.color == 'secondary') {
                    return Palette.secondaryMain
                }
                else if (checkbox.color == 'primary') {
                    return Palette.primaryMain
                }
                else {
                    return Grey._600
                }
            }
            else {
                return Colors.commonTransparent
            }
        }

        MIcon {
            x: parent.width/2 - width/2
            y: parent.height/2 - height/2
            name: 'check'
            size: 14
            color: checkbox.checked ? Colors.commonWhite : Colors.commonTransparent
        }
    }

    Rectangle {
        id: ripple
        clip: true
        anchors.fill: parent
        radius: width/2
        color: Colors.commonTransparent

        Ripple {
            visible: !disableRipple
            clipRadius: checkbox.width/2
            x: parent.width/2 - width/2
            y: parent.height/2 - height/2
            width: checkbox.width
            height: checkbox.height
            pressed: checkbox.pressed
            anchor: ripple
            color: {
                if (checkbox.checked) {
                    if (checkbox.color == 'primary') {
                        return Colors.alpha(Palette.primaryMain, 0.3)
                    }
                    else if (checkbox.color == 'secondary') {
                        return Colors.alpha(Palette.secondaryMain, 0.3)
                    }
                    else {
                        return Colors.alpha(Grey._600, 0.3)
                    }
                }
                else {
                    return Colors.alpha(Grey._600, 0.3)
                }
            }
        }
    }

    MouseArea {
        cursorShape: Qt.PointingHandCursor
        anchors.fill: parent
        enabled: false
    }
}
