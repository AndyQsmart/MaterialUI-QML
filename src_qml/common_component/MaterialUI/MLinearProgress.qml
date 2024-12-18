import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import "./styles"
import "./colors"

Item {
    id: root
    property string variant: 'indeterminate' // 'determinate' 'indeterminate' 'query' 'buffer'
    property string color: 'primary' // 'primary' 'secondary'
    property real value: 0 // 区间0~100
    property real valueBuffer: 100 // 区间0~100


    width: 120
    height: 4
    implicitWidth: width
    implicitHeight: height

    ProgressBar {
        id: control
        value: root.value/100 // 区间0~1
        property real valueBuffer: root.valueBuffer/100





        width: root.width
        height: root.height

        background: Item {
            id: bg
            width: control.width
            height: control.height

            Rectangle {
                width: root.variant == 'buffer' ? parent.width*control.valueBuffer : parent.width
                height: parent.height
                color: Colors.alpha(root.color == 'secondary' ? Palette.secondaryMain : Palette.primaryMain, 0.38)
            }

            Shape {
                id: buffer_line
                visible: root.variant == 'buffer' && control.valueBuffer < 1
                height: parent.height
                width: parent.width*(1-control.valueBuffer)
                x: parent.width*control.valueBuffer

                ShapePath {
                    strokeWidth: buffer_line.height
                    strokeColor: Colors.alpha(root.color == 'secondary' ? Palette.secondaryMain : Palette.primaryMain, 0.18)
                    strokeStyle: ShapePath.DashLine
                    dashPattern: [1, 3]

                    startX: strokeWidth/2
                    startY: buffer_line.height/2

                    PathLine {
                        x: buffer_line.width-buffer_line.height/2
                        y: buffer_line.height/2
                    }
                }
            }
        }

        contentItem: Item {
            width: control.width
            height: control.height

            Rectangle {
                id: progress
                property real animation_x: 0
                x: {
                    if (root.variant === 'indeterminate') {
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
                    if (root.variant === 'indeterminate') {
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
                color: root.color == 'secondary' ? Palette.secondaryMain : Palette.primaryMain

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
}

