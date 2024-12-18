import QtQuick 2.15
import "./styles"
import "./colors"

MAnimation {
    id: control
    timeout: 200
    property int transformOrigin: Item.Center // Item.Center Item.BottomRight Item.TopLeft ...
    property real origin: {
        if (transformOrigin == Item.TopLeft || transformOrigin == Item.Top || transformOrigin == Item.TopRight) {
            return 0
        }
        else if (transformOrigin == Item.BottomLeft || transformOrigin == Item.Bottom || transformOrigin == Item.BottomRight) {
            return control.target ? control.target.height : 0

        }
        else {
            return control.target ? control.target.height / 2 : 0
        }
    }

    Binding {
        target: control.target
        property: "transform"
        value: Scale {
            id: scaleTransform
            yScale: 0
            origin.x: control.target ? control.target.width / 2 : 0
            origin.y: control.origin
        }
    }

    enter: Transition {
        to: "enter"
        NumberAnimation {
            duration: timeout
            property: "yScale"
            easing.type: Easing.InOutQuad
            from: 0.0
            to: 1.0
        }
    }
    enterState: State {
        name: "enter"
        PropertyChanges {
            target: scaleTransform
            yScale: 1
        }
    }

    exit: Transition {
        to: "exit"
        NumberAnimation {
            duration: timeout
            property: "yScale"
            easing.type: Easing.InOutQuad
            from: 1.0
            to: 0.0
        }
    }
    exitState: State {
        name: "exit"
        PropertyChanges {
            target: scaleTransform
            yScale: 0
        }
    }
}
