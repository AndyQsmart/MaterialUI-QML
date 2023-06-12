import QtQuick 2.13
import QtQuick.Controls.Material 2.0
import QtQuick.Controls 2.15
import "./styles"

// 需要优化

Rectangle {
    property bool light: false

    height: 1
    color: light ? Palette.lightTextDivider : Palette.lightTextDivider
}
