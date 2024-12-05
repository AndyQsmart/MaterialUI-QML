import QtQuick 2.13
import "./styles"

// 需要优化

Rectangle {
    property bool light: false

    height: 1
    color: light ? Palette.lightTextDivider : Palette.lightTextDivider
}
