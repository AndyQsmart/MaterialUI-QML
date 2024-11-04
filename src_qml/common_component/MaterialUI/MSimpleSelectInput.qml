import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12
import QtGraphicalEffects 1.15
import "./styles"
import "./colors"

Rectangle {
    id: control
    property string variant: 'standard' // 'filled' 'outlined' 'standard'
    property alias model: menu_repeater.model // list<string>
    property int index: -1
    property string value: ""
    property bool disabled: false

    signal change(string value, int index)

    width: 100
    height: 100
    color: "#ff0000"

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            menu_dialog.open()
        }
    }

    MMenu {
        id: menu_dialog
        anchorEl: control

        Repeater {
            id: menu_repeater

            delegate: MMenuItem {
                text: modelData

                onClicked: {
                    console.log(control.focus)
                    control.value = modelData
                    control.index = index
                    change(control.value, control.index)
                    menu_dialog.close()
                }
            }
        }
    }
}
