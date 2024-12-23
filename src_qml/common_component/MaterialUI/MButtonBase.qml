import QtQuick 2.15
import QtQuick.Controls 2.15
import "./styles"
import "./colors"

// 原版
Button {
    id: button
    property bool disabled: false
    // text: ''
    // property bool centerRipple: false
    property bool disableRipple: false
    property string textColor: ''
    property int fontSize: 14 // 新增字体大小
    property bool disableCursor: false // 新增鼠标属性

    enabled: !button.disabled

    contentItem: MTypography {
        variant: 'button'
        text: button.text
        align: 'center'
        // 字体不居中特殊处理
        lineHeight: 1
        font.pointSize: TypographyStyle.convertFontSize(button.fontSize)
        topPadding: (TypographyStyle.fontStyleList.button.line_height-1)*TypographyStyle.fontStyleList.button.size/2
        bottomPadding: (TypographyStyle.fontStyleList.button.line_height-1)*TypographyStyle.fontStyleList.button.size/2
        // 字体不居中特殊处理
        color: button.textColor
    }

//    ToolTip.contentItem: MTypography {
//        text: ToolTip.text
//    }

    ToolTip.toolTip.contentItem: MTypography {
        variant: 'caption'
        lineHeight: 1
        text: ToolTip.toolTip.text
        color: Colors.commonWhite
    }

    ToolTip.toolTip.background: Rectangle {
        color: Colors.alpha('#616161', 0.9)
        radius: 4
    }

    onPressed: {
        if (!button.disabled) {
            ripple.start(mouse_area.mouseX, mouse_area.mouseY)
        }
    }

    onReleased: {
        if (!button.disabled) {
            ripple.stop()
        }
    }

    MTouchRipple {
        id: ripple
        anchors.fill: parent
        currentColor: button.textColor && button.textColor != '' ? button.textColor : Colors.commonBlack
    }

    MouseArea {
        id: mouse_area
        cursorShape: disableCursor ? Qt.ArrowCursor : Qt.PointingHandCursor
        anchors.fill: parent

        onPressed: function(mouse) {
            mouse.accepted = false
        }

        onReleased: function(mouse) {
            mouse.accepted = false
        }

        onClicked: function(mouse) {
            mouse.accepted = false
        }
    }
}
