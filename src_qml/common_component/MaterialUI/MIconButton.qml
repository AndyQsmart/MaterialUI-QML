import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "./styles"
import "./colors"

MButtonBase {
    id: root
    default property alias children: childContainer.children
    property string size: 'medium' // 'small' 'medium'
    property string color: 'default' // 'default' 'primary' 'secondary' color
    property string iconColor: disabled ? Palette.lightActionDisabled : Palette.string2Color(color, Palette.lightActionActive)
    padding: size === "small" ? 3 : 12
    topPadding: padding
    bottomPadding: padding
    leftPadding: padding
    rightPadding: padding

    background: Rectangle {
        id: button_bg
        width: childContainer.width+root.leftPadding+root.rightPadding
        height: childContainer.height+root.topPadding+root.bottomPadding
        color: hovered ? Colors.alpha("#000000", 0.04) : "#00ffffff"
        radius: Math.max(width, height)/2
    }

    contentItem: RowLayout {
        id: childContainer
        width: childrenRect.width
        height: childrenRect.height
    }

    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Rectangle {
            width: button_bg.width
            height: button_bg.height
            radius: button_bg.radius
        }
    }
}
