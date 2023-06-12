import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"

Item {
    property int timeout: 242

    property Transition enter: Transition {
        NumberAnimation {
            duration: timeout
            property: "opacity"
            easing.type: Easing.InOutQuad
            from: 0.0
            to: 1.0
        }
        NumberAnimation {
            duration: timeout*0.666
            property: "scale"
            easing.type: Easing.InOutQuad
            from: 0
            to: 1
        }
        PropertyAnimation {
            duration: 0
            property: "transformOrigin"
            to: Item.TopLeft
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
        NumberAnimation {
            duration: timeout*0.666
            property: "scale"
            easing.type: Easing.InOutQuad
            from: 1
            to: 0
        }
        PropertyAnimation {
            duration: 0
            property: "transformOrigin"
            to: Item.TopLeft
        }
    }
}
