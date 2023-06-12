import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"

Slider {
    id: control
    value: 0.5
    from: 0
    to: 1

    property string color: 'primary' // 'primary' 'secondary'

    property int _handleSize: 12

    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 120
        implicitHeight: 2
        width: control.availableWidth
        height: implicitHeight
        radius: 2
        color: Colors.alpha(color == 'secondary' ? Palette.secondaryMain : Palette.primaryMain, 0.38)

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            color: color == 'secondary' ? Palette.secondaryMain : Palette.primaryMain
            radius: 2
        }
    }


    handle: Rectangle {
        x: control.leftPadding + control.visualPosition * control.availableWidth - width/2
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: _handleSize
        implicitHeight: _handleSize
        radius: _handleSize / 2
        color: color == 'secondary' ? Palette.secondaryMain : Palette.primaryMain

        Rectangle {
            id: outer

            x: parent.width/2-width/2
            y: parent.height/2-height/2
            width: {
                if (hovered || pressed) {
                    return pressed ? 40 : 28
                }
                else {
                    return 0
                }
            }
            height: width
            color: Colors.alpha(color == 'secondary' ? Palette.secondaryMain : Palette.primaryMain, 0.12)
            radius: width/2

            Behavior on width {
                NumberAnimation {
                    duration: 150
                    easing.type: Easing.InOutQuad
                }
            }

            MouseArea {
                cursorShape: Qt.PointingHandCursor
                anchors.fill: parent
                enabled: false
            }
        }
    }
}
