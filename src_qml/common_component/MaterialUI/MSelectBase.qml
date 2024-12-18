import QtQuick 2.15
import QtQuick.Shapes 1.15
import "./StyleComponent"
import "./styles"
import "./colors"

Rectangle {
    id: control
    property string variant: 'standard' // 'filled' 'outlined' 'standard'
    property alias displayItem: display_container.children // list<string>
    property int index: -1
    property string value: ""
    property string selectColor: "primary"
    property string size: 'medium' // 'medium' | 'small'
    property bool disabled: false
    property bool hover: false
    property string placeholder: ""
    property real minWidth: 0
    property real maxWidth: -1
    property var padding: {
        if (size === 'small') {
            variant === 'outlined' ? [10.5, 32, 10.5, 14] : (variant === 'filled' ? [14, 32, 15, 12] : [5, 24, 5, 0])
        }
        else {
            variant === 'outlined' ? [18.5, 32, 18.5, 14] : (variant === 'filled' ? [18, 32, 19, 12] : [6, 24, 7, 0])
        }
    }
    property var topPadding: padding && padding[0] ? padding[0] : 0
    property var rightPadding: padding && padding[1] ? padding[1] : 0
    property var bottomPadding: padding && padding[2] ? padding[2] : 0
    property var leftPadding: padding && padding[3] ? padding[3] : 0




    signal change(string value, int index)
    signal selectOpen()

    width: text_container.width
    height: text_container.height

    color: menuOpened ? Colors.alpha('#000000', 0.05) : "#00ffffff"
    property bool menuOpened: false

    Loader {
        id: loader
        sourceComponent: variant === 'outlined' ? outlined_style : (variant === 'filled' ? filled_style : standard_style)
        anchors.fill: parent
        z: -1
    }

    Component {
        id: standard_style
        MInputStyle {
            size: control.size
            disabled: control.disabled
            hover: control.hover
            active: control.menuOpened
            color: control.selectColor
        }
    }

    Component {
        id: outlined_style
        MOutlinedInputStyle {
            size: control.size
            disabled: control.disabled
            hover: control.hover
            active: control.menuOpened
            color: control.selectColor
        }
    }

    Component {
        id: filled_style
        MFilledInputStyle {
            size: control.size
            disabled: control.disabled
            hover: control.hover
            active: control.menuOpened
            color: control.selectColor
        }
    }

    Row {
        id: text_container
        topPadding: control.topPadding
        bottomPadding: control.bottomPadding
        leftPadding: control.leftPadding
        spacing: control.rightPadding-24
        rightPadding: variant === 'standard' ? 0 : 7

        Item {
            id: display_container
            width: {
                let text_width = Math.max(childrenRect.width, control.minWidth-control.leftPadding-control.rightPadding, 16)
                if (control.maxWidth >= 0) {
                    text_width = Math.min(text_width, control.maxWidth)
                }
                return text_width
            }
            height: childrenRect.height
            anchors.verticalCenter: parent.verticalCenter
        }

        Item {
            width: 24
            height: 10
            anchors.verticalCenter: parent.verticalCenter

            Image {
                anchors.centerIn: parent

                width: 24
                height: 24
                sourceSize.width: width*2
                sourceSize.height: height*2
                source: `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" fill="${control.disabled ? "#bdbdbd" : "#757575"}" viewBox="0 0 24 24" ><path d="M7 10l5 5 5-5z"></path></svg>`
            }
        }
    }

    MTypography {
        visible: !control.value
        variant: "body1"
        textColor: 'textSecondary'
        text: placeholder
        noWrap: true
        lineHeight: TypographyStyle.convertLineHeight(1.2)
        anchors.verticalCenter: parent.verticalCenter
        leftPadding: control.leftPadding
    }

    MouseArea {
        visible: !control.disabled
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onEntered: {
            control.hover = true
        }

        onExited: {
            control.hover = false
        }

        onClicked: {
            selectOpen()
        }
    }
}
