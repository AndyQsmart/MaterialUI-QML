import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
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

    ButtonGroup {
        id: radioGroup

        buttons: {
            let ans = []
            for (let i = 0; i < childrenContainer.children.length; i++) {
                let the_child = childrenContainer.children[i]
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
            return ans
        }

        onClicked: {
            value = button.value
            change(value)
        }
    }

    GridLayout {
        id: childrenContainer
        x: -1
        y: -1
        rowSpacing: 0
        columnSpacing: 0
        flow: row ? GridLayout.LeftToRight : GridLayout.TopToBottom

        Component.onCompleted: {
            for (let i = 0; i < childrenContainer.children.length; i++) {
                let the_child = childrenContainer.children[i]
                if (the_child.value === value && !the_child.checked) {
                    the_child.checked = true
                }
            }
        }
    }
}
