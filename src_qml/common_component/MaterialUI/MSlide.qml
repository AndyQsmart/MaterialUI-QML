import QtQuick 2.15
import "./styles"
import "./colors"

MAnimation {
    id: control
    timeout: 225
    property string direction: 'down' // 'down' 'left' 'right' 'up'


    property real enterPosX: originX
    property real enterPosY: originY

    property real exitPosX: {
        switch (direction) {
            case 'left':
                return originX+500
            case 'right':
                return originX+-500-control.target.width
            case 'up':
                return originX
            default:
                return originX
        }
    }

    property real exitPosY: {
        switch (direction) {
            case 'left':
                return originY
            case 'right':
                return originY
            case 'up':
                return originY+250
            default:
                return originY-250-control.target.height
        }
    }

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
            duration: timeout
            property: "x"
            easing.type: Easing.InOutQuad
            from: control.exitPosX
            to: enterPosX
        }
        NumberAnimation {
            duration: timeout
            property: "y"
            easing.type: Easing.InOutQuad
            from: control.exitPosY
            to: enterPosY
        }
    }
    enterState: State {
        name: "enter"
        PropertyChanges {
            target: control.target
            opacity: 1
            x: enterPosX
            y: enterPosY
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
            duration: timeout
            property: "x"
            easing.type: Easing.InOutQuad
            from: enterPosX
            to: control.exitPosX
        }
        NumberAnimation {
            duration: timeout
            property: "y"
            easing.type: Easing.InOutQuad
            from: enterPosY
            to: control.exitPosY
        }
    }
    exitState: State {
        name: "exit"
        PropertyChanges {
            target: control.target
            opacity: 0
            x: control.exitPosX
            y: control.exitPosY
        }
    }
}
