import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Item {
    id: control
    property bool open: false
    property int timeout: 242
    property Item target: Item { }
    property Transition enter: null
    property Transition exit: null
    property State enterState: null
    property State exitState: null
    property string type: "default" // "default" "dialog"

    onOpenChanged: {
        if (open) {
            control.state = "enter"
        }
        else {
            control.state = "exit"
        }
    }

    Component.onCompleted: {
        if (open) {
            control.state = "enter"
        }
        else {
            control.state = "exit"
        }
    }

    states: [enterState, exitState]
    transitions: [enter, exit]
}
