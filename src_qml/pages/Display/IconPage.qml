import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../common_component/MaterialUI"
import "../../common_component/MaterialUI/styles"
import "../../common_component/Route"
import "../../common_qml"
import "../../common_js/Color.js" as Color
import "../../common_js/Tools.js" as Tools

Pane {
    id: container
    x: 0
    y: 0
    padding: 0

    RowLayout {
        id: main_area
        anchors.fill: parent
        spacing: 0

        MOverflowYBox {
            RowLayout.fillHeight: true
            RowLayout.fillWidth: true

            ColumnLayout {
                width: main_area.width
                spacing: 0

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "h4"
                        text: "Icons 图标"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "我们提供了一些建议和指导，能够帮助您在 MaterialUI-QML 中使用图标。"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "MaterialUI-QML 通过以下两种方式来支持图标的使用："
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>1. 通过 <span style="color: ${Palette.secondaryMain}" >MIcon</span> 来使用 <span style="color: ${Palette.secondaryMain}" >FontAwesome</span> 图标。`
                        wrapMode: MTypography.WordWrap
                    }
                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>2. 通过 <span style="color: ${Palette.secondaryMain}" >MSvgIcon</span> 来使用 <span style="color: ${Palette.secondaryMain}" >Svg</span> 图标。`
                        wrapMode: MTypography.WordWrap
                    }
                }


                // **********FontAwesome Icon

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "FontAwesome Icon"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>使用 <span style="color: ${Palette.secondaryMain}" >MIcon</span> 可以渲染 <span style="color: ${Palette.secondaryMain}" >FontAwesome</span> 图标。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MIcon {
                            name: 'home'
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: "#272c34"
                    height: childrenRect.height
                    radius: 4

                    Column {
                        Layout.fillWidth: true
                        padding: 20

                        MCopyText {
                            color: Color.white
                            textFormat: TextEdit.RichText
                            text: `
<pre>
MIcon {
    name: 'home'
}
</pre>
                            `
                        }
                    }
                }

                Row {
                    Layout.fillWidth: true
                    Layout.topMargin: 20
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    MTypography {
                        variant: "body2"
                        text: "您可以"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    MButton {
                        color: "secondary"
                        text: "查看完整的FontAwesome图标列表"
                        anchors.verticalCenter: parent.verticalCenter

                        onClicked: {
                            Route.redirectTo("/fontawesomeiconpage")
                        }
                    }
                }



                // **********Color 颜色

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Color 颜色"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MIcon {
                            name: 'home'
                        }

                        MIcon {
                            name: 'home'
                            color: "#2278cf"
                        }

                        MIcon {
                            name: 'home'
                            color: "#da0d51"
                        }

                        MIcon {
                            name: 'home'
                            color: "#757575"
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: "#272c34"
                    height: childrenRect.height
                    radius: 4

                    Column {
                        Layout.fillWidth: true
                        padding: 20

                        MCopyText {
                            color: Color.white
                            textFormat: TextEdit.RichText
                            text: `
<pre>
MIcon {
    name: 'home'
}

MIcon {
    name: 'home'
    color: "#2278cf"
}

MIcon {
    name: 'home'
    color: "#da0d51"
}

MIcon {
    name: 'home'
    color: "#757575"
}
</pre>
                            `
                        }
                    }
                }


                // **********Size 大小

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Size 大小"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MIcon {
                            name: 'home'
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MIcon {
                            name: 'home'
                            size: 20
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MIcon {
                            name: 'home'
                            size: 24
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MIcon {
                            name: 'home'
                            size: 35
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: "#272c34"
                    height: childrenRect.height
                    radius: 4

                    Column {
                        Layout.fillWidth: true
                        padding: 20

                        MCopyText {
                            color: Color.white
                            textFormat: TextEdit.RichText
                            text: `
<pre>
MIcon {
    name: 'home'
}

MIcon {
    name: 'home'
    size: 20
}

MIcon {
    name: 'home'
    size: 24
}

MIcon {
    name: 'home'
    size: 35
}
</pre>
                            `
                        }
                    }
                }




                // **********Svg Icon

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Svg Icon"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>使用 <span style="color: ${Palette.secondaryMain}" >MSvgIcon</span> 可以渲染我们提供的 <span style="color: ${Palette.secondaryMain}" >Svg</span> 图标。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MSvgIcon {
                            name: 'Home'
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: "#272c34"
                    height: childrenRect.height
                    radius: 4

                    Column {
                        Layout.fillWidth: true
                        padding: 20

                        MCopyText {
                            color: Color.white
                            textFormat: TextEdit.RichText
                            text: `
<pre>
MSvgIcon {
    name: 'Home'
}
</pre>
                            `
                        }
                    }
                }

                Row {
                    Layout.fillWidth: true
                    Layout.topMargin: 20
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    MTypography {
                        variant: "body2"
                        text: "您可以"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    MButton {
                        color: "secondary"
                        text: "查看完整的Svg图标列表"
                        anchors.verticalCenter: parent.verticalCenter

                        onClicked: {
                            Route.redirectTo("/svgiconpage")
                        }
                    }
                }




                // **********Color 颜色

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Color 颜色"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MSvgIcon {
                            name: 'Home'
                        }

                        MSvgIcon {
                            name: 'Home'
                            color: "primary"
                        }

                        MSvgIcon {
                            name: 'Home'
                            color: "secondary"
                        }

                        MSvgIcon {
                            name: 'Home'
                            color: "error"
                        }

                        MSvgIcon {
                            name: 'Home'
                            color: "textSecondary"
                        }

                        MSvgIcon {
                            name: 'Home'
                            color: "#50ae55"
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: "#272c34"
                    height: childrenRect.height
                    radius: 4

                    Column {
                        Layout.fillWidth: true
                        padding: 20

                        MCopyText {
                            color: Color.white
                            textFormat: TextEdit.RichText
                            text: `
<pre>
MSvgIcon {
    name: 'Home'
}

MSvgIcon {
    name: 'Home'
    color: "primary"
}

MSvgIcon {
    name: 'Home'
    color: "secondary"
}

MSvgIcon {
    name: 'Home'
    color: "error"
}

MSvgIcon {
    name: 'Home'
    color: "textSecondary"
}

MSvgIcon {
    name: 'Home'
    color: "#50ae55"
}
</pre>
                            `
                        }
                    }
                }


                // **********Size 大小

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Size 大小"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MSvgIcon {
                            name: "Home"
                            fontSize: "small"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MSvgIcon {
                            name: "Home"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MSvgIcon {
                            name: "Home"
                            fontSize: "large"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MSvgIcon {
                            name: "Home"
                            size: 40
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: "#272c34"
                    height: childrenRect.height
                    radius: 4

                    Column {
                        Layout.fillWidth: true
                        padding: 20

                        MCopyText {
                            color: Color.white
                            textFormat: TextEdit.RichText
                            text: `
<pre>
MSvgIcon {
    name: "Home"
    fontSize: "small"
}

MSvgIcon {
    name: "Home"
}

MSvgIcon {
    name: "Home"
    fontSize: "large"
}

MSvgIcon {
    name: "Home"
    size: 40
}
</pre>
                            `
                        }
                    }
                }



                // API

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "API"
                        gutterBottom: true
                    }

                    RowLayout {
                        MTypography {
                            variant: "body1"
                            text: "○"
                        }
                        MButton {
                            color: "secondary"
                            text: "MIcon { }"
                            onClicked: {
                                Route.redirectTo("/api/icon")
                            }
                        }
                    }

                    RowLayout {
                        MTypography {
                            variant: "body1"
                            text: "○"
                        }
                        MButton {
                            color: "secondary"
                            text: "MSvgIcon { }"
                            onClicked: {
                                Route.redirectTo("/api/svgicon")
                            }
                        }
                    }
                }


                Rectangle {
                    Layout.fillWidth: true
                    height: 20
                }
            }
        }
    }
}
