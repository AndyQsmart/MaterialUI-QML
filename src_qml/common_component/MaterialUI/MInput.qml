import QtQuick 2.15
import "./StyleComponent"
import "./styles"

MInputBase {
    id: textInput
    color: 'primary'
    size: 'medium' // 'medium' | 'small'
    disabled: false
    _padding: styles.padding

    MInputStyle {
        id: styles
        size: textInput.size
        disabled: textInput.disabled
        active: textInput.activeFocus
        color: textInput.color
    }
}
