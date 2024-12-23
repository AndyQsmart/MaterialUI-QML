import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "./styles"
import "./colors"

Switch {
    id: checkbox
    property string color: 'secondary' // 'default' 'primary' 'secondary' color
    property bool disabled: false
    property bool disableRipple: false
    property string size: 'medium' // 'medium' 'small' 暂未实现
    checked: false
    property string value: ""




    checkable: !disabled
    property int _width: size == 'small' ? 26 : 34
    property int _height: size == 'small' ? 10 : 14
    property int _padding: size == 'small' ? 7 : 12
    implicitWidth: _width+_padding*2
    implicitHeight: _height+_padding*2
    width: _width+_padding*2
    height: _height+_padding*2
    topPadding: _padding
    rightPadding: _padding
    bottomPadding: _padding
    leftPadding: _padding

    indicator: Rectangle {
        implicitWidth: checkbox._width
        implicitHeight: checkbox._height
        x: checkbox.width/2 - width/2
        y: checkbox.height/2 - height/2
        radius: height/2
        color: {
            let opacity = 0.38
            let the_color = Colors.commonBlack
            if (checkbox.disabled) {
                opacity = 0.12
            }
            else {
                if (checkbox.checked) {
                    opacity = 0.5
                    the_color = Palette.string2Color(checkbox.color, Colors.commonBlack)
                }
            }

            return Colors.alpha(the_color, opacity)
        }

        Behavior on color {
            ColorAnimation {
                duration: 150
                easing.type: Easing.InOutQuad
            }
        }

        Rectangle {
            id: thumb_container
            property int thumb_size: checkbox.size == 'small' ? 16 : 20
            property int thumb_padding: checkbox.size == 'small' ? 4 : 9
            width: thumb_size+thumb_padding*2
            height: thumb_size+thumb_padding*2
            x: checkbox.checked ? parent.width-thumb_size-thumb_padding : -thumb_padding
            y: parent.height/2 - height/2
            radius: width/2

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: thumb_container.width
                    height: thumb_container.height
                    radius: thumb_container.radius
                }
            }

            Behavior on x {
                NumberAnimation {
                    duration: 150
                    easing.type: Easing.InOutQuad
                }
            }

            color: {
                if (!checkbox.hovered || checkbox.disabled) {
                    return Colors.commonTransparent
                }

                if (checkbox.checked) {
                    return Colors.alpha(Palette.string2Color(checkbox.color, Grey._600), 0.04)
                }
                else {
                    return Colors.alpha(Grey._600, 0.04)
                }
            }

            Rectangle {
                width: parent.thumb_size
                height: parent.thumb_size
                radius: width/2
                x: parent.width/2 - width/2
                y: parent.height/2 - height/2

                color: {
                    if (checkbox.disabled) {
                        return '#bdbdbd'
                    }
                    else {
                        if (checkbox.checked) {
                            return Palette.string2Color(checkbox.color, '#fafafa')
                        }
                        else {
                            return Colors.commonWhite
                        }
                    }
                }

                layer.enabled: true
                layer.effect: MShadow {
                    elevation: 1
                }
            }

            MTouchRipple {
                id: touch_ripple
                visible: !disableRipple && !checkbox.disabled
                width: parent.width
                height: parent.height
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

    MouseArea {
        cursorShape: checkbox.disabled ? Qt.ArrowCursor : Qt.PointingHandCursor
        anchors.fill: parent
        enabled: false
    }
}
