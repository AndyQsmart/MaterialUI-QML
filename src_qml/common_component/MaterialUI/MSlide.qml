import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"

MAnimation {
    id: control
    timeout: 225
    property string direction: 'down' // 'down' 'left' 'right' 'up'

    property real enterPosX: offsetX
    property real enterPosY: offsetY

    property real exitPosX: {
        switch (direction) {
            case 'left':
                return offsetX+500
            case 'right':
                return offsetX+-500-control.target.width
            case 'up':
                return offsetX
            default:
                return offsetX
        }
    }

    property real exitPosY: {
        switch (direction) {
            case 'left':
                return offsetY
            case 'right':
                return offsetY
            case 'up':
                return offsetY+250
            default:
                return offsetY-250-control.target.height
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
