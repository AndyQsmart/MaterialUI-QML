import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12
import "./styles"
import "./colors"

Switch {
    id: checkbox
    property string color: 'secondary' // 'default' 'primary' 'secondary'
    property bool disable: false
    property bool disableRipple: false
    property string size: 'medium' // 'medium' 'small' 暂未实现
    checked: false
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
            if (checkbox.disable) {
                opacity = 0.12
            }
            else {
                if (checkbox.checked) {
                    opacity = 0.5
                    if (checkbox.color == 'primary') {
                        the_color = Palette.primaryMain
                    }
                    else if (checkbox.color == 'secondary') {
                        the_color = Palette.secondaryMain
                    }
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
            property int thumb_size: checkbox.size == 'small' ? 16 : 20
            property int thumb_padding: checkbox.size == 'small' ? 4 : 9
            width: thumb_size+thumb_padding*2
            height: thumb_size+thumb_padding*2
            x: checkbox.checked ? parent.width-thumb_size-thumb_padding : -thumb_padding
            y: parent.height/2 - height/2
            radius: width/2

            Behavior on x {
                NumberAnimation {
                    duration: 150
                    easing.type: Easing.InOutQuad
                }
            }

            color: {
                if (!checkbox.hovered) {
                    return Colors.commonTransparent
                }

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

            Rectangle {
                width: parent.thumb_size
                height: parent.thumb_size
                radius: width/2
                x: parent.width/2 - width/2
                y: parent.height/2 - height/2

                color: {
                    if (checkbox.disable) {
                        return '#bdbdbd'
                    }
                    else {
                        if (checkbox.checked) {
                            if (checkbox.color == 'primary') {
                                return Palette.primaryMain
                            }
                            else if (checkbox.color == 'secondary') {
                                return Palette.secondaryMain
                            }
                            else {
                                return '#fafafa'
                            }
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

            Ripple {
                visible: !disableRipple
                clipRadius: parent.width/2
                x: parent.width/2 - width/2
                y: parent.height/2 - height/2
                width: parent.width
                height: parent.height
                pressed: checkbox.pressed
                anchor: parent
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
    }

    MouseArea {
        cursorShape: Qt.PointingHandCursor
        anchors.fill: parent
        enabled: false
    }
}
