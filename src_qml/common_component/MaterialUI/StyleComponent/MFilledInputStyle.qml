import QtQuick 2.15
import QtQuick.Shapes 1.15
import "../styles"
import "../"

Item {
    id: root
    property string color: 'primary'
    property string size: 'medium' // 'medium' | 'small'
    property var padding: size === 'small' ? [14, 12, 15, 12] : [18, 12, 19, 12]
    property bool disabled: false
    property bool hover: false
    property bool active: false
    property string _main_color: Palette.string2Color(root.color, Palette.primaryMain)

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

    property int strokeStyle: disabled ? ShapePath.DashLine : ShapePath.SolidLine
    property int strokeWidth: 1
    property string strokeColor: hover && !disabled ? Palette.lightTextPrimary : '#3B000000'

    // 下划线
    Shape {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        ShapePath {
           strokeWidth: {
               return root.strokeWidth
           }
           strokeColor: root.strokeColor
           strokeStyle: root.strokeStyle
           dashPattern: [2, 2]

           startX: root.strokeWidth/2
           startY: -root.strokeWidth/2

           PathLine {
               x: root.width-root.strokeWidth/2;
               y: -root.strokeWidth/2
           }
       }
    }

    MScaleX {
        target: underline
        open: active
    }

    Rectangle {
        id: underline
        width: parent.width
        anchors.bottom: parent.bottom
        height: 2
        color: root._main_color
    }
}
