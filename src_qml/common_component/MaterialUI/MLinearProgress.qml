import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"

ProgressBar {
    id: control
    property string variant: 'indeterminate' // 'determinate' 'indeterminate' 'query' 'buffer'
    property string color: 'primary' // 'primary' 'secondary'
    value: 0 // 区间0~1
    property real valueBuffer: 1
    width: 120
    height: 4

    background: Rectangle {
        id: bg
        width: control.width
        height: control.height
        color: Colors.alpha(control.color == 'secondary' ? Palette.secondaryMain : Palette.primaryMain, 0.38)

        Rectangle {
            visible: control.variant == 'buffer'
            height: parent.height
            width: parent.width*(1-control.valueBuffer)
            x: parent.width*control.valueBuffer
            color: Colors.alpha('#000000', 0.18)
        }
    }

    contentItem: Item {
        width: control.width
        height: control.height

        Rectangle {
            id: progress
            property real animation_x: 0
            x: {
                if (control.variant === 'indeterminate') {
                    if (animation_x < 0) {
                        return 0
                    }
                    else {
                        return animation_x
                    }
                }
                else {
                    return 0
                }
            }
            width: {
                if (control.variant === 'indeterminate') {
                    if (animation_x < 0) {
                        return parent.width/2+animation_x
                    }
                    else if (animation_x < parent.width/2) {
                        return parent.width/2
                    }
                    else {
                        return parent.width-animation_x
                    }
                }
                else {
                    return control.visualPosition * parent.width
                }
            }
            height: parent.height
            color: control.color == 'secondary' ? Palette.secondaryMain : Palette.primaryMain

            NumberAnimation {
                target: progress
                properties: 'animation_x'
                from: -bg.width/2
                to: bg.width/2+bg.width
                duration: 2100/3
                running: variant == 'indeterminate'
                loops: Animation.Infinite
            }
        }
    }
}
