import QtQuick 2.13
import "./StyleComponent"
import "./styles"

MInputBase {
    id: root
    property string variant: 'standard' // 'filled' | 'outlined' | 'standard'

    _padding: loader.item ? loader.item.padding : []

    Loader {
        id: loader
        sourceComponent: variant === 'outlined' ? outlined_style : (variant === 'filled' ? filled_style : standard_style)
        anchors.fill: parent
        z: -1
    }

    Component {
        id: standard_style
        MInputStyle {
            target: root
            size: root.size
            disabled: root.disabled
            active: root.activeFocus
            color: root.color
        }
    }

    Component {
        id: outlined_style
        MOutlinedInputStyle {
            target: root
            size: root.size
            disabled: root.disabled
            active: root.activeFocus
            color: root.color
        }
    }

    Component {
        id: filled_style
        MFilledInputStyle {
            target: root
            size: root.size
            disabled: root.disabled
            active: root.activeFocus
            color: root.color
        }
    }
}
