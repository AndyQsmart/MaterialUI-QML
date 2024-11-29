import QtQuick 2.13
import "./StyleComponent"
import "./styles"

MInputBase {
    id: textInput
    color: 'primary'
    size: 'medium' // 'medium' | 'small'
    disabled: false
    _padding: styles.padding

    MOutlinedInputStyle {
        target: textInput
        size: textInput.size
    }
}
