import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"

Item {
    property int timeout: 225
    property string direction: 'down' // 'down' 'left' 'right' 'up'

    property Transition enter: Transition {
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
            to: 0.0;
        }
    }

    property Transition exit: Transition {
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
}
