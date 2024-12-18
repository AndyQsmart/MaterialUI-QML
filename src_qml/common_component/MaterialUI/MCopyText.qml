import QtQuick 2.15
import QtQuick.Layouts 1.15
import "./styles"
import "./colors"

// 原版
TextEdit {
    id: control
    property string variant: 'body2'
    property string textColor: 'initial' // 'initial' | 'primary' | 'secondary' | 'textPrimary' | 'textSecondary' | 'error'
    property bool gutterBottom: false
    property bool noWrap: false
    property string align: 'inherit' // 'inherit' 'left' 'center' 'right' 'justify'
    property bool paragraph: false
    property real fontSize: -1 // new

    signal copied(string text)
//    height: contentHeight

    readOnly: true
    selectByMouse: true

    wrapMode: {
        if (noWrap) {
            return TextEdit.NoWrap
        }
        else {
            return TextEdit.WrapAnywhere
        }
    }

    verticalAlignment: TextEdit.AlignVCenter
    horizontalAlignment: {
        switch(align) {
            case 'left':
                return TextEdit.AlignLeft
            case 'center':
                return TextEdit.AlignHCenter
            case 'right':
                return TextEdit.AlignRight
            case 'justify':
                return TextEdit.AlignJustify
        }
        return TextEdit.AlignLeft
    }

    // gutterBottom和paragraph下面的边距效果
    bottomPadding: {
        if (gutterBottom) {
            return Palette.unit
        }
        else if (paragraph) {
            return 2*Palette.unit
        }
        else {
            return 0
        }
    }

    color: {
        switch (textColor) {
            case 'primary':
            case 'secondary':
            case 'textPrimary':
            case 'textSecondary':
            case 'error':
                return Palette.string2Color(textColor)
            default:
                return Colors.commonBlack
        }
    }

    font.pointSize: {
        if (fontSize > 0) {
            return TypographyStyle.convertFontSize(fontSize)
        }

        let fontStyleList = TypographyStyle.fontStyleList
        if (!variant) {
            return fontStyleList.body2.size
        }

        return fontStyleList[variant].size ? fontStyleList[variant].size : fontStyleList.body2.size
    }

    font.weight: {
        let fontStyleList = TypographyStyle.fontStyleList
        if (!variant) {
            return fontStyleList.body2.weight
        }

        return fontStyleList[variant].weight ? fontStyleList[variant].weight : fontStyleList.body2.weight
    }


    font.letterSpacing: {
        let fontStyleList = TypographyStyle.fontStyleList
        if (!variant) {
            return fontStyleList.body2.letter_spacing
        }

        return fontStyleList[variant].letter_spacing ? fontStyleList[variant].letter_spacing : fontStyleList.body2.letter_spacing
    }

    Keys.enabled: selectedText && selectedText !== ""
    Keys.onPressed: {
        if (event.key === Qt.Key_C && (event.modifiers & Qt.ControlModifier)) {
            // console.log(selectedText)
            control.copy()
            copied(selectedText)
        }
    }

    MouseArea {
        anchors.fill: parent
        preventStealing: false
        cursorShape: Qt.IBeamCursor
        propagateComposedEvents: true
        acceptedButtons: Qt.RightButton

        onClicked: {
            mouse.accepted = false
        }

        onPressed: {
            if (mouse.button === Qt.RightButton) {
                let the_x = mouseX
                let the_y = mouseY
                // console.log(the_x, the_y)
                right_menu.x = the_x
                right_menu.y = the_y
                right_menu.open()
                return
            }
            mouse.accepted = false
        }

        onReleased: {
            mouse.accepted = false
        }
    }

    MMenu {
        id: right_menu
        parent: control
        width: 120
        focus: false
        property bool copy_after_close: false

        MMenuItem {
            focusPolicy: Qt.NoFocus
            width: 120
            implicitWidth: 120

            Row {
                width: parent.width
                leftPadding: parent.leftPadding
                rightPadding: parent.rightPadding
                anchors.verticalCenter: parent.verticalCenter

                MIcon {
                    name: "copy"
                    size: 14
                    anchors.verticalCenter: parent.verticalCenter
                }

                MTypography {
                    RowLayout.fillWidth: true
                    leftPadding: 10
                    text: "复制"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            onClicked: {
                control.copy()
                copied(selectedText)
                right_menu.close()
            }
        }
    }
}
