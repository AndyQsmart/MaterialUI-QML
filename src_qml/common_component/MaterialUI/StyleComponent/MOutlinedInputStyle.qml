import QtQuick 2.15
import "../styles"

Item {
    id: root
    property var target: null
    property string size: 'medium' // 'medium' | 'small'
    property var padding: size === 'small' ? [10.5, 14, 10.5, 14] : [18.5, 14, 18.5, 14]
    z: -1

    anchors.fill: parent

    // outlined外边框
    Rectangle {
        enabled: false
        color: Colors.commonTransparent
        border.width: target ? (target.activeFocus ? 2 : 1) :0
        border.color: target ? (target.activeFocus ? target._main_color : '#3B000000') : ''
        anchors.fill: parent
        radius: Palette.borderRadius
    }
}
