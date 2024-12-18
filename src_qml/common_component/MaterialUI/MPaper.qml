import QtQuick 2.15
import "./styles"
import "./colors"

Rectangle {
    id: paper
    property int elevation: 1 // 0~24
    property bool square: false
    property string variant: 'elevation' // 'elevation' 'outlined'



    radius: paper.square ? 0 : Palette.borderRadius
    color: Colors.commonWhite

    border.width: paper.variant === 'outlined' ? 1 : 0
    border.color: Colors.alpha('#000000', 0.12)

    layer.enabled: paper.variant === 'elevation' && paper.elevation > 0
    layer.effect: MShadow {
        elevation: paper.elevation
    }
}
