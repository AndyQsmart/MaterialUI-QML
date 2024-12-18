import QtQuick 2.15
import "./styles"
import "./colors"

MAnimation {
    id: control
    timeout: 300
    property int collapsedSize: 0

    enter: Transition {
        to: "enter"
        NumberAnimation {
            duration: timeout*0.666
            property: "height"
            easing.type: Easing.InOutQuad
            from: collapsedSize
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
            restoreEntryValues: true
            clip: true
        }
    }

    exit: Transition {
        to: "exit"
        NumberAnimation {
            duration: timeout*0.666
            property: "height"
            easing.type: Easing.InOutQuad
            to: collapsedSize
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
            restoreEntryValues: true
            height: collapsedSize
            clip: true
        }
    }
}
