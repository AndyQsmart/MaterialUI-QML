import QtQuick 2.13
import QtQuick.Controls 2.15
import "./styles"
import "./colors"

Rectangle {
    id: container
    default property alias children: childrenContainer.children
    property bool row: false
    property var value: null



    width: childrenRect.width
    implicitWidth: width
    height: childrenRect.height
    implicitHeight: height
    color: "#00ffffff"

    signal change(string value)

    onValueChanged: {
        for (let i = 0; i < radioGroup.buttons.length; i++) {
            let the_button = radioGroup.buttons[i]
            if (the_button.value === value && !the_button.checked) {
                the_button.checked = true
            }
        }
    }

    Item {
        visible: false
        id: childrenContainer
    }

    ButtonGroup {
        id: radioGroup

        buttons: {
            let ans = []
            if (loader.item) {
                for (let i = 0; i < loader.item.children.length; i++) {
                    let the_child = loader.item.children[i]
                    if (the_child instanceof MFormControlLabel) {
                        if (the_child.control && the_child.control.length > 0 && the_child.control[0] instanceof MRadio) {
                            if (!the_child.control[0].disabled) {
                                ans.push(the_child.control[0])
                            }
                        }
                    }
                    else if (the_child instanceof MRadio) {
                        if (!the_child.disabled) {
                            ans.push(the_child)
                        }
                    }
                }
            }
            return ans
        }

        onClicked: {
            value = button.value
            change(value)
        }
    }

    Loader {
        id: loader
        sourceComponent: row ? row_container : column_container

        Component.onCompleted: {
            if (loader.item) {
                // 将外部传入的子元素添加到加载的组件的子元素列表中
                let the_child_list = []
                let i = 0
                for (i = 0; i < childrenContainer.children.length; i++) {
                    the_child_list.push(childrenContainer.children[i])
                }
                for (i = 0; i < the_child_list.length; i++) {
                    let the_child = the_child_list[i]
                    loader.item.children.push(the_child)
                    if (the_child.value === value && !the_child.checked) {
                        the_child.checked = true
                    }
                }
            }
        }
    }

    Component {
        id: row_container
        Row {
        }
    }

    Component {
        id: column_container
        Column {
        }
    }
}
