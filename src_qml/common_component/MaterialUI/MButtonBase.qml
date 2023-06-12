import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12
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
        font.pointSize: button.fontSize
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

    Ripple {
        visible: !disableRipple
        clipRadius: 4
        width: parent.width
        height: parent.height
        pressed: button.pressed
        anchor: button
        color: Colors.alpha(button.textColor && button.textColor != '' ? button.textColor : Colors.commonBlack, 0.3)
    }

    MouseArea {
        cursorShape: disableCursor ? Qt.ArrowCursor : Qt.PointingHandCursor
        anchors.fill: parent
        enabled: false
    }
}
