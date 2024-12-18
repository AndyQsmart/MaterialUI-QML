// FontAwesomeToolButton.qml

import QtQuick 2.15
import "./styles"
import "./Font"
import "./Font/IconsName.js" as IconsName

Text {
    id: button
    property string name
//    property alias color: text.color
    property real size: 14
//    有Bold和Light两种设置
    font.weight: Font.Bold
//    font.family在Regular、Solid、Brands三种模式下选择，其中Regular、Solid是一样的
    font.family: FontAwesomeFont.solid
    text: IconsName.name[name] ? IconsName.name[name] : ""

    font.pointSize: {
        return TypographyStyle.convertFontSize(size)
    }
}
