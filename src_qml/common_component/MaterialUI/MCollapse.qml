import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"

MAnimation {
    id: control
    timeout: 300

    enter: Transition {
        to: "enter"
        NumberAnimation {
            duration: timeout*0.666
            property: "height"
            easing.type: Easing.InOutQuad
            from: 0
        }
        PropertyAnimation {
            duration: 0
            property: "clip"
            to: true
        }
    }
    enterState: State {
        name: "enter"
        PropertyChanges {
            target: control.target
            height: undefined
            clip: true
        }
    }

    exit: Transition {
        to: "exit"
        NumberAnimation {
            duration: timeout*0.666
            property: "height"
            easing.type: Easing.InOutQuad
            to: 0
        }
        PropertyAnimation {
            duration: 0
            property: "clip"
            to: true
        }
    }
    exitState: State {
        name: "exit"
        PropertyChanges {
            target: control.target
            height: 0
            clip: true
        }
    }
}
