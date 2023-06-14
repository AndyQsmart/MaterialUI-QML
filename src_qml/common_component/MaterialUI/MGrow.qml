import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"

MAnimation {
    id: control
    timeout: 242

    enter: Transition {
        to: "enter"
        NumberAnimation {
            duration: timeout
            property: "opacity"
            easing.type: Easing.InOutQuad
            from: 0.0
            to: 1.0
        }
        NumberAnimation {
            duration: timeout*0.666
            property: "scale"
            easing.type: Easing.InOutQuad
            from: 0
            to: 1
        }
        NumberAnimation {
            duration: timeout*0.666
            property: "height"
            easing.type: Easing.InOutQuad
            from: 0
        }
        PropertyAnimation {
            duration: 0
            property: "transformOrigin"
            to: Item.TopLeft
        }
    }
    enterState: State {
        name: "enter"
        PropertyChanges {
            target: control.target
            opacity: 1
            scale: 1
            height: undefined
            transformOrigin: Item.TopLeft
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
        NumberAnimation {
            duration: timeout*0.666
            property: "scale"
            easing.type: Easing.InOutQuad
            from: 1
            to: 0
        }
        NumberAnimation {
            duration: timeout*0.666
            property: "height"
            easing.type: Easing.InOutQuad
            to: 0
        }
        PropertyAnimation {
            duration: 0
            property: "transformOrigin"
            to: Item.TopLeft
        }
    }
    exitState: State {
        name: "exit"
        PropertyChanges {
            target: control.target
            opacity: 0
            scale: 0
            height: 0
            transformOrigin: Item.TopLeft
        }
    }
}
