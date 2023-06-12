import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"


Popup {
    id: dialog
    property bool fullScreen: false
    property bool fullWidth: false
    property bool disableBackdropClick: false
    property string maxWidth: 'sm' //'lg' 'md' 'sm' 'xl' 'xs' false
    property Item transitionComponent: null

    x: ((parent ? parent.width : 0) - dialog.width)/2
    y: ((parent ? parent.height : 0) - dialog.height)/2
    padding: 0
    visible: false
    modal: true
    focus: true
    closePolicy: disableBackdropClick ? Popup.CloseOnEscape : (Popup.CloseOnEscape | Popup.CloseOnPressOutside)

    background: MPaper {
        elevation: 24
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
