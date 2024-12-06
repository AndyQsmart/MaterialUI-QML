import QtQuick 2.15
import "./styles"

TextInput {
    id: textInput
    property string color: 'primary'
    property string placeholder: ''
    property string size: 'medium' // 'medium' | 'small'
    property bool disabled: false
    property bool hover: false



    property string _main_color: Palette.string2Color(textInput.color, Palette.primaryMain)
    property var _padding: [6, 0, 7, 0]
    enabled: !disabled
    verticalAlignment: Text.AlignVCenter
    clip: true
    selectByMouse: true
    selectionColor: textInput._main_color
    topPadding: _padding[0]
    rightPadding: _padding[1]
    bottomPadding: _padding[2]
    leftPadding: _padding[3]

    font.pointSize: TypographyStyle.fontStyleList.body1.size

    // placeholder
    MTypography {
        visible: textInput.text || textInput.inputMethodComposing ? false : true
        anchors.fill: parent
        noWrap: true
        verticalAlignment: Text.AlignVCenter
        leftPadding: textInput.leftPadding
        rightPadding: textInput.rightPadding
        text: placeholder
        color: textInput.disabled ? Palette.lightTextDisabled : Palette.lightTextSecondary
        font.pointSize: TypographyStyle.fontStyleList.body1.size
        lineHeight: 1
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.IBeamCursor
        acceptedButtons: Qt.NoButton
        hoverEnabled: true

        onEntered: {
            textInput.hover = true
        }

        onExited: {
            textInput.hover = false
        }
    }
}
