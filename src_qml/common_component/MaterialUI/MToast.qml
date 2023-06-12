import QtQuick 2.10
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.0
import "./styles"

ToolTip {
    padding: 10
    visible: false
    font.bold: true
    font.pointSize: TypographyStyle.fontStyleList.body1.size
    x: (parent.width-width)/2
    y: (parent.height-height)/2
    opacity: 0.8
    timeout: 3000

    function success(message) {
        Material.background = 'green'
        show(message, timeout)
    }

    function warning(message) {
        Material.background = '#FFC107'
        show(message, timeout)
    }

    function error(message) {
        Material.background = '#fc4a37'
        show(message, timeout)
    }
}
