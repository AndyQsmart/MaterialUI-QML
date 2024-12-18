import QtQuick 2.15
import "./styles"
import "./colors"

MAnimation {
    id: control
    timeout: 200
    property int transformOrigin: Item.Center // Item.Center Item.BottomRight Item.TopLeft ...
    property real origin: {
        if (transformOrigin == Item.TopLeft || transformOrigin == Item.Left || transformOrigin == Item.BottomLeft) {
            return 0
        }
        else if (transformOrigin == Item.TopRight || transformOrigin == Item.Right || transformOrigin == Item.BottomRight) {
            return control.target ? control.target.width : 0

        }
        else {
            return control.target ? control.target.width / 2 : 0
        }
    }

    Binding {
        target: control.target
        property: "transform"
        value: Scale {
            id: scaleTransform
            xScale: 0
            origin.x: control.origin
            origin.y: control.target ? control.target.height / 2 : 0
        }
    }

    enter: Transition {
        to: "enter"
        NumberAnimation {
            duration: timeout
            property: "xScale"
            easing.type: Easing.InOutQuad
            from: 0.0
            to: 1.0
        }
    }
    enterState: State {
        name: "enter"
        PropertyChanges {
            target: scaleTransform
            xScale: 1
        }
    }

    exit: Transition {
        to: "exit"
        NumberAnimation {
            duration: timeout
            property: "xScale"
            easing.type: Easing.InOutQuad
            from: 1.0
            to: 0.0
        }
    }
    exitState: State {
        name: "exit"
        PropertyChanges {
            target: scaleTransform
            xScale: 0
        }
    }
}
