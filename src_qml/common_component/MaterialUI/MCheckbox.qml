import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "./styles"
import "./colors"

CheckBox {
    id: checkbox
    property string color: 'secondary' // 'default' 'primary' 'secondary' color
    property bool disabled: false
    property bool disableRipple: false
    property string size: 'medium' // 'medium' 'small' 暂未实现
    property string value: ""


    checked: false
    checkable: !disabled
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

    indicator: Image {
        x: parent.width/2 - width/2
        y: parent.height/2 - height/2
        width: 24
        height: 24
        sourceSize.width: width*2
        sourceSize.height: height*2

        property string svgColor: {
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

        source: {
            let unchecked_src = `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" fill="${svgColor}" viewBox="0 0 24 24" ><path d="M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"></path></svg>`
            let checked_src = `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" fill="${svgColor}" viewBox="0 0 24 24" ><path d="M19 3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.11 0 2-.9 2-2V5c0-1.1-.89-2-2-2zm-9 14l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"></path></svg>`

            return checkbox.checked ? checked_src : unchecked_src
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
        id: mouse_area
        cursorShape: checkbox.disabled ? Qt.ArrowCursor : Qt.PointingHandCursor
        anchors.fill: parent
        enabled: false
    }
}
