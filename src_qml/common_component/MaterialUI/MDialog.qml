import QtQuick 2.15
import QtQuick.Controls 2.15
import "./styles"
import "./colors"

Popup {
    id: dialog
    property bool fullScreen: false
    property bool fullWidth: false
    property bool disableBackdropClick: false
    property string maxWidth: 'sm' //'lg' 'md' 'sm' 'xl' 'xs' false
    property MAnimation transitionComponent: MFade { }
    parent: Overlay.overlay
//    anchors.centerIn: parent // 为了使用通用动画，故不使用该属性进行居中

    Binding {
        target: transitionComponent
        property: "originX"
        value: ((parent ? parent.width : 0) - dialog.width)/2
    }

    Binding {
        target: transitionComponent
        property: "originY"
        value: ((parent ? parent.height : 0) - dialog.height)/2
    }

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

    enter: transitionComponent ? transitionComponent.enter : null
    exit: transitionComponent ? transitionComponent.exit : null
}
