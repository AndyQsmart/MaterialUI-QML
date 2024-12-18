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
                        text: "Color Picker 颜色选择器"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "颜色选择器提供了一个简单的颜色选择功能。"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>用户可以通过 <span style="color: ${Palette.secondaryMain}" >颜色选择器</span>在界面中选择颜色。 通常，我们会在着色功能处使用它们。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }



                // **********颜色选择器

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "颜色选择器"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>通过设置 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >initColor</span> 可以改变颜色的初始值。</p>`
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    implicitHeight: height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Rectangle {
                            id: display_color
                            width: 60
                            height: 30
                            color: "#00ff00"
                            border.width: 1
                            border.color: "#dddddd"
                            radius: 5

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    color_picker.initColor = display_color.color.toString()
                                    color_picker.open()
                                }
                            }

                            MColorPicker {
                                id: color_picker
                                anchorEl: display_color
                                anchorOrigin: Item.Bottom
                                transformOrigin: Item.Top

                                onChange: {
                                    display_color.color = color
                                }
                            }
                        }
                    }
                }

                RowLayout {
                    Layout.topMargin: 10
                    Layout.bottomMargin: 10
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20

                    MButton {
                        variant: "outlined"
                        text: "< > Code"

                        onClicked: {
                            date_code.visible = !date_code.visible
                        }
                    }
                }

                Rectangle {
                    id: date_code
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
Rectangle {
    id: display_color
    width: 60
    height: 30
    color: "#00ff00"
    border.width: 1
    border.color: "#dddddd"
    radius: 5

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            color_picker.initColor = display_color.color.toString()
            color_picker.open()
        }
    }

    MColorPicker {
        id: color_picker
        anchorEl: display_color
        anchorOrigin: Item.Bottom
        transformOrigin: Item.Top

        onChange: {
            display_color.color = color
        }
    }
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
                            text: "MColorPicker { }"
                            onClicked: {
                                Route.redirectTo("/api/colorpicker")
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
