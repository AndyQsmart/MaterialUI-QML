import QtQuick 2.13
import "./styles"

Loader {
    id: loader
    property string variant: 'standard' // 'filled' | 'outlined' | 'standard'
    property string color: 'primary'
    property string placeholder: ''
    property string size: 'medium' // 'medium' | 'small'
    property bool disabled: false
    property string text: ''

    source: variant === 'outlined' ? 'MOutlinedInput.qml' : (variant === 'filled' ? "MFilledInput.qml" : "MInput.qml")


    Binding {
        target: loader.item
        property : "color"
        value: loader.color
    }

    Binding {
        target: loader.item
        property : "placeholder"
        value: loader.placeholder
    }

    Binding {
        target: loader.item
        property : "size"
        value: loader.size
    }

    Binding {
        target: loader.item
        property : "disabled"
        value: loader.disabled
    }


    // selection相关
    property int selectionStart: loader.item ? loader.item.selectionStart : 0
    property int selectionEnd: loader.item ? loader.item.selectionEnd : 0

    function select(start, end) {
        if (loader.item) {
            loader.item.select(start, end)
        }
    }


    // text手动实现双向绑定
    onLoaded: {
        if (loader.text !== loader.item.text) {
            loader.item.text = loader.text
        }
    }

    onTextChanged: {
        if (loader.item) {
            if (loader.text !== loader.item.text) {
                loader.item.text = loader.text
            }
        }
    }

    Connections {
        target: loader.item
        function onTextEdited() {
            loader.text = loader.item.text
        }
    }

    // padding相关
    property var _padding: loader.item ? loader.item._padding : [6, 0, 7, 0]
    property var topPadding: null
    property var rightPadding: null
    property var bottomPadding: null
    property var leftPadding: null

    Binding {
        when: topPadding !== null
        target: loader.item
        property : "topPadding"
        value: loader.topPadding
    }

    Binding {
        when: rightPadding !== null
        target: loader.item
        property : "rightPadding"
        value: loader.rightPadding
    }

    Binding {
        when: bottomPadding !== null
        target: loader.item
        property : "bottomPadding"
        value: loader.bottomPadding
    }

    Binding {
        when: leftPadding !== null
        target: loader.item
        property : "leftPadding"
        value: loader.leftPadding
    }
}
