import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "./styles"
import "./colors"

RadioButton {
    id: checkbox
    property string color: 'secondary' // 'default' 'primary' 'secondary'
    property bool disabled: false
    property bool disableRipple: false
    property string size: 'medium' // 'medium' 'small' 暂未实现
    property string value: ""


    checkable: !disabled
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
        visible: checkbox.hovered && !checkbox.disabled
        anchors.fill: parent
        radius: width/2
        color: {
            if (checkbox.checked) {
                return Colors.alpha(Palette.string2Color(checkbox.color, Grey._600), 0.04)
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
        border.width: 2
        border.color: {
            if (checkbox.disabled) {
                return Grey._400
            }

            if (checkbox.checked) {
                return Palette.string2Color(checkbox.color, Grey._600)
            }
            else {
                return Grey._600
            }
        }
        radius: width/2
        color: Colors.commonTransparent

        Rectangle {
            property int size: checkbox.checked ? 10 : 0
            width: size
            height: size
            radius: size/2
            x: parent.width/2 - width/2
            y: parent.height/2 - height/2
            color: parent.border.color

            Behavior on size {
                NumberAnimation {
                    duration: 150
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }

    onPressed: {
        if (!checkbox.disabled) {
            touch_ripple.start()
        }
    }

    onReleased: {
        if (!checkbox.disabled) {
            touch_ripple.stop()
        }
    }

    Rectangle {
        id: ripple
        clip: true
        anchors.fill: parent
        radius: width/2
        color: Colors.commonTransparent

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: ripple.width
                height: ripple.height
                radius: ripple.radius
            }
        }

        MTouchRipple {
            id: touch_ripple
            visible: !disableRipple && !checkbox.disabled
            width: checkbox.width
            height: checkbox.height
            center: true
            currentColor: {
                if (checkbox.checked) {
                    return Palette.string2Color(checkbox.color, Grey._600)
                }
                else {
                    return Grey._600
                }
            }
        }
    }

    MouseArea {
        cursorShape: checkbox.disabled ? Qt.ArrowCursor : Qt.PointingHandCursor
        anchors.fill: parent
        enabled: false
    }
}
