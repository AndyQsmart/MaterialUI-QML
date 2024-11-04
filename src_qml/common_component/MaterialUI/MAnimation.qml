import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Item {
    id: control
    property bool open: false
    property int timeout: 242
    property var target: Item { }
    property Transition enter: null
    property Transition exit: null
    property State enterState: null
    property State exitState: null
    property real offsetX: 0 // 和x相关的动画，设置起始值
    property real offsetY: 0 // 和y相关的动画，设置起始值

    signal aboutToEnter()
    signal aboutToExit()

    onOpenChanged: {
        if (open) {
            aboutToEnter()
            control.state = "enter"
        }
        else {
            aboutToExit()
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
