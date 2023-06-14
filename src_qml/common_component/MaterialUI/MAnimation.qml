import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Item {
    id: control
    property var open: null
    property int timeout: 242
    property Item target: null
    property Transition enter: null
    property Transition exit: null
    property State enterState: null
    property State exitState: null

    onOpenChanged: {
        if (open) {
            control.state = "enter"
        }
        else {
            control.state = "exit"
        }
    }

    state: {
        if (open == null) {
            return ""
        }

        return open ? "enter" : "exit"
    }

    states: [enterState, exitState]
    transitions: [enter, exit]
}
