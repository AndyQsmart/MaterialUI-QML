import QtQuick 2.15
import QtQuick.Shapes 1.15
import "../styles"
import "../"

Item {
    id: root
    property string color: 'primary'
    property string size: 'medium' // 'medium' | 'small'
    property var padding: size === 'small' ? [5, 0, 5, 0] : [6, 0, 7, 0]
    property bool disabled: false
    property bool hover: false
    property bool active: false
    property string _main_color: Palette.string2Color(root.color, Palette.primaryMain)

    z: -1
    anchors.fill: parent

    property int strokeStyle: disabled ? ShapePath.DashLine : ShapePath.SolidLine
    property int strokeWidth: hover && !disabled ? 2 : 1
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
