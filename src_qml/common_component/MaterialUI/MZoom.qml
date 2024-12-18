import QtQuick 2.15
import "./styles"
import "./colors"

MAnimation {
    id: control
    timeout: 225

    enter: Transition {
        to: "enter"
        NumberAnimation {
            duration: timeout*0.666
            property: "scale"
            easing.type: Easing.InOutQuad
            from: 0
            to: 1
        }
//        PropertyAnimation {
//            duration: 0
//            property: "transformOrigin"
//            to: transformOrigin
//        }
    }
    enterState: State {
        name: "enter"
        PropertyChanges {
            target: control.target
            // scale: 1
            // transformOrigin: transformOrigin
        }
    }

    exit: Transition {
        to: "exit"
        NumberAnimation {
            duration: timeout
            property: "scale"
            easing.type: Easing.InOutQuad
            from: 1.0
            to: 0.0
        }
//        PropertyAnimation {
//            duration: 0
//            property: "transformOrigin"
//            to: transformOrigin
//        }
    }
    exitState: State {
        name: "exit"
        PropertyChanges {
            target: control.target
            scale: 0
            // transformOrigin: transformOrigin
        }
    }
}
