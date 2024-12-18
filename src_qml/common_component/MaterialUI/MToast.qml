import QtQuick 2.15
import QtQuick.Controls 2.15
import "./styles"

ToolTip {
    id: control
    padding: 10
    visible: false
    font.bold: true
    font.pointSize: TypographyStyle.fontStyleList.body1.size
    parent: Overlay.overlay
    anchors.centerIn: parent
    opacity: 0.8
    timeout: 3000
    property string color: "green"

    function success(message) {
        control.color = 'green'
        show(message, timeout)
    }

    function warning(message) {
        control.color = '#FFC107'
        show(message, timeout)
    }

    function error(message) {
        control.color = '#fc4a37'
        show(message, timeout)
    }

    enter: Transition {
        // toast_enter
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; easing.type: Easing.OutQuad; duration: 500 }
    }

    exit: Transition {
        // toast_exit
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; easing.type: Easing.InQuad; duration: 500 }
    }

    contentItem: Text {
        text: control.text
        font: control.font
        wrapMode: Text.Wrap
        color: Colors.commonWhite
    }

    background: Rectangle {
        color: control.color
        opacity: 0.9
        radius: Palette.borderRadius
    }
}
