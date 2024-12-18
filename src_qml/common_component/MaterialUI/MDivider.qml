import QtQuick 2.15
import "./styles"

// 需要优化

Rectangle {
    property bool light: false

    height: 1
    color: light ? Palette.lightTextDivider : Palette.lightTextDivider
}
