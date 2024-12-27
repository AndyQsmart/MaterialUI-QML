import QtQuick 2.15
import "../styles"

Item {
    id: root
    property string color: 'primary'
    property string size: 'medium' // 'medium' | 'small'
    property var padding: size === 'small' ? [10.5, 14, 10.5, 14] : [18.5, 14, 18.5, 14]
    property bool disabled: false
    property bool hover: false
    property bool active: false
    property string _main_color: Palette.string2Color(root.color, Palette.primaryMain)

    z: -1
    anchors.fill: parent

    // outlined外边框
    Rectangle {
        enabled: false
        color: Colors.commonTransparent
        border.width: active ? 2 : 1
        border.color: active ? root._main_color : (hover && !disabled ? Palette.lightTextPrimary : '#3B000000')
        anchors.fill: parent
        radius: Palette.borderRadius
    }
}
