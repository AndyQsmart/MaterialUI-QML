import QtQuick 2.15
import QtQuick.Shapes 1.15;
import "../styles"

Item {
    id: root
    property var target: null
    property string size: 'medium' // 'medium' | 'small'
    property var padding: size === 'small' ? [14, 12, 15, 12] : [18, 12, 19, 12]
    z: -1

    anchors.fill: parent


    Shape {
        id: filledComponent
        anchors.fill: parent
        property real shapeWidth: parent.width
        property real shapeHeight: parent.height

        ShapePath {
            strokeWidth: 0.1
            strokeColor: "#e8e8e8"
            fillColor: "#e8e8e8"

            startX: 0
            startY: Palette.borderRadius

            PathLine {
                x: 0
                y: filledComponent.shapeHeight
            }

            PathLine {
                x: filledComponent.shapeWidth
                y: filledComponent.shapeHeight
            }

            PathLine {
                x: filledComponent.shapeWidth
                y: Palette.borderRadius
            }

            PathArc {
                x: filledComponent.shapeWidth-Palette.borderRadius
                y: 0
                radiusX: Palette.borderRadius
                radiusY: Palette.borderRadius
                direction: PathArc.Counterclockwise
            }

            PathLine {
                x: Palette.borderRadius
                y: 0
            }

            PathArc {
                x: 0
                y: Palette.borderRadius
                radiusX: Palette.borderRadius
                radiusY: Palette.borderRadius
                direction: PathArc.Counterclockwise
            }
        }
    }

    // 下划线
    Rectangle {
        enabled: false
        color: target ? (target.activeFocus ? target._main_color : '#3B000000') : ""
        width: target ? target.width : 0
        height: target ? (target.activeFocus ? 2 : 1) : 0
        anchors.bottom: parent.bottom
    }
}
