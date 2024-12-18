import QtQuick 2.15
import "./styles"

MButton {
    id: list_item
    property bool dense: false
    property bool disableGutters: false
    property bool divider: false
    property bool selected: false

    property var m_padding: {
        let ans = [6, Palette.unit*2, 6, Palette.unit*2]

        if (dense) {
            ans[0] = ans[2] = 4
        }
        if (disableGutters) {
            ans[1] = ans[3] = 0
        }
        return ans
    }
    topPadding: m_padding[0]
    rightPadding: m_padding[1]
    bottomPadding: m_padding[2]
    leftPadding: m_padding[3]

    contentItem: MTypography {
        variant: 'body1'
        text: list_item.text
        color: list_item.textColor
    }

    background: Rectangle {
        color: {
            if (list_item.selected) {
                return Palette.lightActionSelected
            }

            if (list_item.hovered) {
                return Palette.lightActionHover
            }

            return Colors.commonTransparent
        }

        Rectangle {
            visible: divider
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 1
            color: Palette.lightTextDivider
        }
    }
}
