import QtQuick
import "./styles"

// 原版
MButton {
    id: list_item
    // button模式下，传给button
//    property string color: MPalette.lightTextPrimary

    property string alignItems: 'center' // 'flex-start' 'center'
    property bool dense: false
    // disabled: false
    property bool disableGutters: false
    property bool divider: false
    property bool selected: false
    property bool button: false
    disableCursor: !button
    disableRipple: !button

    property var m_padding: {
        let ans = [MPalette.unit, 0, MPalette.unit, 0]

        if (dense) {
            ans = [MPalette.unit/2, 0, MPalette.unit/2, 0]
        }
        if (!disableGutters) {
            ans[1] = ans[3] = MPalette.unit*2
        }
        return ans
    }
    topPadding: m_padding[0]
    rightPadding: m_padding[1]
    bottomPadding: m_padding[2]
    leftPadding: m_padding[3]

    background: Rectangle {
        anchors.fill: parent

        color: {
            if (list_item.selected) {
                return MPalette.lightActionSelected
            }

            if (button && list_item.hovered) {
                return Colors.alpha('#000000', 0.04)
            }

            return '#00000000'
        }

        Rectangle {
            visible: divider
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 1
            color: MPalette.lightTextDivider
        }
    }
}

