import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"

MAnimation {
    id: control
    timeout: 242
    property int transformOrigin: Item.Center // Item.Center Item.BottomRight Item.TopLeft ...

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
            to: transformOrigin
        }
    }
    enterState: State {
        name: "enter"
        PropertyChanges {
            target: control.target
            opacity: 1
            scale: 1
            height: undefined
            transformOrigin: transformOrigin
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
            to: transformOrigin
        }
    }
    exitState: State {
        name: "exit"
        PropertyChanges {
            target: control.target
            opacity: 0
            scale: 0
            height: 0
            transformOrigin: transformOrigin
        }
    }
}
