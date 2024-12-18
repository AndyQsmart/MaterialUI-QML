import QtQuick 2.15
import "./styles"

// 网页版原版
Rectangle {
    id: root
    property alias control: control_container.children
    property bool disabled: false
    property string label: ''
    property string labelPlacement: 'end' // 'bottom' 'end' 'start' 'top'
    property bool checked: false
    property var value: null

    property var controlItem: control_container.children[0]
    property bool controlItemDisabled: controlItem && controlItem.disabled !== undefined ? controlItem.disabled : false
    onControlItemDisabledChanged: {
        if (root.disabled !== controlItem.disabled) {
            root.disabled = controlItem.disabled
        }
    }
    onDisabledChanged: {
        if (controlItem && controlItem.disabled !== undefined) {
            controlItem.disabled = root.disabled
        }
    }
    property bool controlItemChecked: controlItem && controlItem.checked !== undefined ? controlItem.checked : false
    onControlItemCheckedChanged: {
        if (root.checked !== controlItem.checked) {
            root.checked = controlItem.checked
        }
    }
    onCheckedChanged: {
        if (controlItem && controlItem.checked !== undefined) {
            controlItem.checked = root.checked
        }
    }

    Component.onCompleted: {
        if (controlItem && controlItem.disabled !== undefined) {
            controlItem.disabled = root.disabled
        }
        if (controlItem && controlItem.checked !== undefined) {
            controlItem.checked = root.checked
        }
        if (value) {
            if (controlItem && controlItem.value !== undefined) {
                controlItem.value = value
            }
        }
    }
    onValueChanged: {
        if (value) {
            if (controlItem && controlItem.value !== undefined) {
                controlItem.value = value
            }
        }
    }

    color: "#00ffffff"
    width: {
        if (labelPlacement === 'top' || labelPlacement === 'bottom') {
            return Math.max(control_container.width, label_container.width)+leftPadding+rightPadding
        }
        else {
            return control_container.width+label_container.width+leftPadding+rightPadding
        }
    }
    height: {
        if (labelPlacement === 'top' || labelPlacement === 'bottom') {
            return control_container.height+label_container.height
        }
        else {
            return Math.max(control_container.height, label_container.height)
        }
    }
    property int leftPadding: labelPlacement !== 'end' ? 16 : -11
    property int rightPadding: labelPlacement === 'start' ? -11 : 16

    Rectangle {
        id: control_container
        width: childrenRect.width
        height: childrenRect.height
        color: "#00ffffff"
        x: {
            if (labelPlacement === 'top' || labelPlacement === 'bottom') {
                if (control_container.width > label_container.width) {
                    return leftPadding
                }
                else {
                    return (label_container.width-control_container.width)/2+leftPadding
                }
            }
            else {
                if (labelPlacement === 'start') {
                    return leftPadding+label_container.width
                }
                else {
                    return leftPadding
                }
            }
        }
        y: {
            if (labelPlacement === 'top') {
                return label_container.height
            }
            else if (labelPlacement === 'bottom') {
                return 0
            }
            else {
                if (control_container.height > label_container.height) {
                    return 0
                }
                else {
                    return (label_container.height-control_container.height)/2
                }
            }
        }
    }

    MTypography {
        id: label_container
        textColor: disabled ? 'textSecondary' : 'initial'
        variant: 'body1'
        text: label

        x: {
            if (labelPlacement === 'top' || labelPlacement === 'bottom') {
                if (control_container.width > label_container.width) {
                    return (control_container.width-label_container.width)/2+root.leftPadding
                }
                else {
                    return root.leftPadding
                }
            }
            else {
                if (labelPlacement === 'start') {
                    return root.leftPadding
                }
                else {
                    return root.leftPadding+control_container.width
                }
            }
        }

        y: {
            if (labelPlacement === 'top') {
                return 0
            }
            else if (labelPlacement === 'bottom') {
                return control_container.height
            }
            else {
                if (control_container.height > label_container.height) {
                    return (control_container.height-label_container.height)/2
                }
                else {
                    return 0
                }
            }
        }

        MouseArea {
            visible: {
                if (root.disabled) {
                    return false
                }
                let item = control_container.children[0]
                return item && item.disabled !== undefined ? !item.disabled : false
            }
            cursorShape: root.disabled ? Qt.ArrowCursor : Qt.PointingHandCursor
            anchors.fill: parent

            onClicked: {
                let item = control_container.children[0]
                if (item.clicked) {
                    item.clicked()
                }
                else {
                    if (item && item.checked !== undefined) {
                        item.checked = !item.checked
                    }
                }
            }
        }
    }
}
