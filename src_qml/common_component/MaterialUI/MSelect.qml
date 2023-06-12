import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Styles 1.4
import "./styles"
import "./colors"

ComboBox {
    id: select
    property string color: 'primary' // 'primary' 'secondary'
    property string variant: 'standard' // filled | outlined | standard
    property bool disabled: false
    property bool disableCursor: false // 新增鼠标属性

//    popup.height: 400

    property var m_padding: {
        let ans = [6, Palette.unit*3, 7, 0]
        switch (variant) {
            case 'filled': {
                // ans = [27, Palette.unit*4, 19, 16]
                // ans = [19, Palette.unit*4, 19, 12]
                ans = [Palette.unit+3, Palette.unit*4, Palette.unit+3, 12]
                break
            }
            case 'outlined': {
                // ans = [18.5, Palette.unit*4, 18.5, 12]
                ans = [Palette.unit+3, Palette.unit*2, Palette.unit+3, Palette.unit*2]
                break
            }
        }

        return ans
    }

    contentItem: MTypography {
        topPadding: m_padding[0]
        rightPadding: m_padding[1]
        bottomPadding: m_padding[2]
        leftPadding: m_padding[3]

        variant: 'body1'
        text: select.displayText
        lineHeight: 1

        MouseArea {
            cursorShape: disableCursor ? Qt.ArrowCursor : Qt.PointingHandCursor
            anchors.fill: parent
            enabled: false
        }
    }

    indicator: MIcon {
        id: indicator
        size: 14
        name: 'caret-down'
        color: Colors.alpha('#000000', '0.54')
        x: parent.width-indicator.width-10
        y: (parent.height-indicator.height)/2
    }

    popup.background: Rectangle {
        color: Colors.commonWhite
        radius: 4
        border.width: 0

        layer.enabled: true
        layer.effect: MShadow {
            elevation: 8
        }
    }

    background: Rectangle {
        border.width: {
            if (variant == 'outlined') {
                return select.activeFocus ? 2 : 1
            }
            return 0
        }

        border.color: {
            if (disabled) {
                return Palette.lightActionDisabled
            }

            if (select.activeFocus) {
                return Palette.string2Color(select.color, null)
            }
            else {
                return Colors.alpha('#000000', 0.87)
            }
        }

        radius: {
            if (variant == 'standard') {
                return 0
            }
            else {
                return 4
            }
        }

        color: {
            if (select.activeFocus) {
                if (variant == 'filled') {
                    return Grey.a100
                }
                else {
                    return Colors.alpha('#000000', 0.04)
                }
            }
            else {
                if (variant == 'filled') {
                    // return Colors.alpha('#000000', 0.09)
                    return '#e9e9e9'
                }
                else {
                    return Colors.commonTransparent
                }

            }
        }

        // 填充filled底部
        Repeater {
            id: repeater_filled
            model: variant == 'filled' ? 1 : 0
            delegate: Rectangle {
                width: select.width
                height: 4
                anchors.bottom: parent.bottom
                enabled: false
                color: select.activeFocus ? Grey.a100 : '#e9e9e9'
            }
        }

        // 下划线
        Repeater {
            id: repeater
            model: variant !== 'outlined' ? 1 : 0
            delegate: Rectangle {
                width: select.width
                height: select.activeFocus ? 2 : 1
                anchors.bottom: parent.bottom
                enabled: false
                color: select.activeFocus ? Palette.string2Color(select.color, null) : '#3B000000'
            }
        }
    }
}
