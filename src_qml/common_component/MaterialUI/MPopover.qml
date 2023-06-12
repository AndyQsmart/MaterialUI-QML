import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"


Popup {
    id: popover
    property int elevation: 8
    property bool disableBackdropClick: false
    property Item transitionComponent: MGrow { }

    padding: 0
    visible: false
    modal: true
    Overlay.modal: Rectangle {
        color: Colors.commonTransparent
    }
    focus: true
    closePolicy: disableBackdropClick ? Popup.CloseOnEscape : (Popup.CloseOnEscape | Popup.CloseOnPressOutside)

    background: MPaper {
        elevation: popover.elevation
    }

    enter: {
        if (transitionComponent) {
            return transitionComponent.enter
        }
        else {
            return null
        }
    }

    exit: {
        if (transitionComponent) {
            return transitionComponent.exit
        }
        else {
            return null
        }
    }
}
