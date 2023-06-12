import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"

Item {
    property int timeout: 225

    property Transition enter: Transition {
        NumberAnimation {
            duration: timeout
            property: "opacity"
            easing.type: Easing.InOutQuad
            from: 0.0
            to: 1.0
        }
    }

    property Transition exit: Transition {
        NumberAnimation {
            duration: timeout
            property: "opacity"
            easing.type: Easing.InOutQuad
            from: 1.0
            to: 0.0
        }
    }
}
