import QtQuick 2.15
import QtQuick.Controls 2.15
import "./styles"
import "./colors"

ToolTip {
    id: control

    contentItem: MTypography {
        variant: 'caption'
        lineHeight: 1
        text: control.text
        color: Colors.commonWhite
    }

    background: Rectangle {
        color: Colors.alpha('#616161', 0.9)
        radius: 4
    }
}
