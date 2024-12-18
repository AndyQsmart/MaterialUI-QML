import QtQuick 2.15
import "./styles"
import "./colors"

MAnimation {
    id: control
    timeout: 225

    enter: Transition {
        to: "enter"
        NumberAnimation {
            duration: timeout
            property: "opacity"
            easing.type: Easing.InOutQuad
            from: 0.0
            to: 1.0
        }
    }
    enterState: State {
        name: "enter"
        PropertyChanges {
            target: control.target
            opacity: 1
        }
    }

    exit: Transition {
        to: "exit"
        NumberAnimation {
            duration: timeout
            property: "opacity"
            easing.type: Easing.InOutQuad
            from: 1.0
            to: 0.0
        }
    }
    exitState: State {
        name: "exit"
        PropertyChanges {
            target: control.target
            opacity: 0
        }
    }
}
