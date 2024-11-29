import QtQuick 2.13
import QtQuick.Shapes 1.15;
import "./StyleComponent"
import "./styles"

MInputBase {
    id: textInput
    color: 'primary'
    size: 'medium' // 'medium' | 'small'
    disabled: false
    _padding: styles.padding

    MFilledInputStyle {
        id: styles
        target: textInput
        size: textInput.size
    }
}
