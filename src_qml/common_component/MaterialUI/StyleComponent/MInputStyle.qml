import QtQuick 2.15

Item {
    id: root
    property var target: null
    property string size: 'medium' // 'medium' | 'small'
    property var padding: size === 'small' ? [5, 0, 5, 0] : [6, 0, 7, 0]
    z: -1

    anchors.fill: parent

    // 下划线
    Rectangle {
        enabled: false
        color: target ? (target.activeFocus ? target._main_color : '#3B000000') : ''
        width: target ? target.width : 0
        height: target ? (target.activeFocus ? 2 : 1) : 0
        anchors.bottom: parent.bottom
    }
}
