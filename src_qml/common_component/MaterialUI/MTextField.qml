import QtQuick 2.15
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
            size: root.size
            disabled: root.disabled
            hover: root.hover
            active: root.activeFocus
            color: root.color
        }
    }

    Component {
        id: outlined_style
        MOutlinedInputStyle {
            size: root.size
            disabled: root.disabled
            hover: root.hover
            active: root.activeFocus
            color: root.color
        }
    }

    Component {
        id: filled_style
        MFilledInputStyle {
            size: root.size
            disabled: root.disabled
            hover: root.hover
            active: root.activeFocus
            color: root.color
        }
    }
}
