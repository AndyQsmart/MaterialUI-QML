import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"

// do not support common use
MAnimation {
    id: control
    timeout: 225
    property string direction: 'down' // 'down' 'left' 'right' 'up'

    property real marginTop: {
        switch (direction) {
            case 'left':
                return 0
            case 'right':
                return 0
            case 'up':
                return 250
            default:
                return -250-control.target.height
        }
    }

    property real marginBottom: {
        switch (direction) {
            case 'left':
                return 0
            case 'right':
                return 0
            case 'up':
                return -250-control.target.height
            default:
                return 250
        }
    }

    property real marginLeft: {
        switch (direction) {
            case 'left':
                return -500-control.target.width
            case 'right':
                return 500
            case 'up':
                return 0
            default:
                return 0
        }
    }

    property real marginRight: {
        switch (direction) {
            case 'left':
                return 500
            case 'right':
                return -500-control.target.width
            case 'up':
                return 0
            default:
                return 0
        }
    }

    property Transition default_enter: Transition {
        to: "enter"
        SequentialAnimation {
            NumberAnimation {
                duration: 0
                property: "opacity"
                from: 0.0
                to: 1.0
            }
            ParallelAnimation {
                NumberAnimation {
                    duration: timeout
                    property: "anchors.topMargin"
                    easing.type: Easing.InOutQuad
                    from: marginTop
                    to: 0.0
                }
                NumberAnimation {
                    duration: timeout
                    property: "anchors.bottomMargin"
                    easing.type: Easing.InOutQuad
                    from: marginBottom
                    to: 0.0
                }
                NumberAnimation {
                    duration: timeout
                    property: "anchors.leftMargin"
                    easing.type: Easing.InOutQuad
                    from: marginLeft
                    to: 0.0
                }
                NumberAnimation {
                    duration: timeout
                    property: "anchors.rightMargin"
                    easing.type: Easing.InOutQuad
                    from: marginRight
                    to: 0.0
                }
            }

        }
    }
    enterState: State {
        name: "enter"

        PropertyChanges {
            target: control.target
            // opacity: 1
            // anchors.topMargin: 0
            // anchors.bottomMargin: 0
            // anchors.leftMargin: 0
            // anchors.rightMargin: 0
        }
    }

    property Transition default_exit: Transition {
        to: "exit"
        SequentialAnimation {

            ParallelAnimation {

                NumberAnimation {
                    duration: timeout
                    property: "anchors.topMargin"
                    easing.type: Easing.InOutQuad
                    from: 0
                    to: marginTop
                }
                NumberAnimation {
                    duration: timeout
                    property: "anchors.bottomMargin"
                    easing.type: Easing.InOutQuad
                    from: 0
                    to: marginBottom
                }
                NumberAnimation {
                    duration: timeout
                    property: "anchors.leftMargin"
                    easing.type: Easing.InOutQuad
                    from: 0
                    to: marginLeft
                }
                NumberAnimation {
                    duration: timeout
                    property: "anchors.rightMargin"
                    easing.type: Easing.InOutQuad
                    from: 0
                    to: marginRight
                }
            }
            NumberAnimation {
                duration: 0
                property: "opacity"
                from: 1
                to: 0
            }
        }
    }
    exitState: State {
        name: "exit"

        PropertyChanges {
            target: control.target
            opacity: 0
            anchors.topMargin: marginTop
            anchors.bottomMargin: marginBottom
            anchors.leftMargin: marginLeft
            anchors.rightMargin: marginRight
        }
    }

    property Transition dialog_enter: Transition {
        to: "enter"
        NumberAnimation {
            duration: timeout
            property: {
                switch (direction) {
                    case 'left':
                        return 'rightMargin'
                    case 'right':
                        return 'leftMargin'
                    case 'up':
                        return 'topMargin'
                    default:
                        return 'bottomMargin'
                }
            }
            easing.type: Easing.InOutQuad
            from: direction == 'left' || direction == 'right' ? 250 : 500
            to: 0.0
        }
    }

    property Transition dialog_exit: Transition {
        NumberAnimation {
            duration: timeout
            property: {
                switch (direction) {
                    case 'left':
                        return 'rightMargin'
                    case 'right':
                        return 'leftMargin'
                    case 'up':
                        return 'topMargin'
                    default:
                        return 'bottomMargin'
                }
            }
            easing.type: Easing.InOutQuad
            from: 0.0
            to: direction == 'left' || direction == 'right' ? 250 : 500
        }
    }

    enter: type == "dialog" ? dialog_enter : default_enter
    exit: type == "dialog" ? dialog_exit : default_exit
}
