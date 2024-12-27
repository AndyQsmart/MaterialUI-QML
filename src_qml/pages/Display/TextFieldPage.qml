import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../../common_component/MaterialUI"
import "../../common_component/MaterialUI/styles"
import "../../common_component/Route"
import "../../common_js/Color.js" as Color
import "../../common_js/Tools.js" as Tools

Pane {
    id: container
    x: 0
    y: 0
    padding: 0
    background: null

    RowLayout {
        id: main_area
        anchors.fill: parent
        spacing: 0

        MOverflowYBox {
            id: scroll_list
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout {
                width: scroll_list.availableWidth
                spacing: 0

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "h4"
                        text: "TextField 文本框"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "用户可以在文本框内输入或编辑文字。"
                        gutterBottom: true
                    }


                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>用户可以通过<span style="color: ${MPalette.secondaryMain}" >文本框</span>在界面中输入文本。 通常，我们会在表单域和对话框中使用它们。</p>`
                        wrapMode: MTypography.WordWrap
                        gutterBottom: true
                    }
                }



                // **********TextField

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "TextField"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >TextField</span> wrapper 组件是一个完整的表单控件，它包括了标签，输入和帮助文本。</p>`
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "它支持 standard，outlined 和 filled 这几个样式。"
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

                    Flow {
                        width: parent.width
                        spacing: 20
                        padding: 20

                        MTextField {
                            placeholder: "Standard"
                            width: 180
                        }

                        MTextField {
                            variant: "filled"
                            placeholder: "Filled"
                            width: 180
                        }

                        MTextField {
                            variant: "outlined"
                            placeholder: "Outlined"
                            width: 180
                        }

                        MTextField {
                            disabled: true
                            placeholder: "Standard disabled"
                            width: 180
                        }

                        MTextField {
                            disabled: true
                            variant: "filled"
                            placeholder: "Filled disabled"
                            width: 180
                        }

                        MTextField {
                            disabled: true
                            variant: "outlined"
                            placeholder: "Outlined disabled"
                            width: 180
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
                            textfield_code.visible = !textfield_code.visible
                        }
                    }
                }

                Rectangle {
                    id: textfield_code
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
Row {
    spacing: 20
    padding: 20

    MTextField {
        placeholder: "Standard"
        width: 160
        anchors.verticalCenter: parent.verticalCenter
    }

    MTextField {
        variant: "filled"
        placeholder: "Filled"
        width: 160
        anchors.verticalCenter: parent.verticalCenter
    }

    MTextField {
        variant: "outlined"
        placeholder: "Outlined"
        width: 160
        anchors.verticalCenter: parent.verticalCenter
    }
}
</pre>
                            `
                        }
                    }
                }


                // **********大小

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "大小"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>想要使用外观看起来比较小的选择器吗？ 你可以使用 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >size</span> 属性。</p>`
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    implicitHeight: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Column {
                            spacing: 20

                            MTextField {
                                size: "small"
                                placeholder: "Standard"
                                width: 180
                            }

                            MTextField {
                                size: "small"
                                variant: "filled"
                                placeholder: "Filled"
                                width: 180
                            }

                            MTextField {
                                size: "small"
                                variant: "outlined"
                                placeholder: "Outlined"
                                width: 180
                            }
                        }

                        Column {
                            spacing: 20

                            MTextField {
                                placeholder: "Standard"
                                width: 180
                            }

                            MTextField {
                                variant: "filled"
                                placeholder: "Filled"
                                width: 180
                            }

                            MTextField {
                                variant: "outlined"
                                placeholder: "Outlined"
                                width: 180
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
                            size_code.visible = !size_code.visible
                        }
                    }
                }

                Rectangle {
                    id: size_code
                    visible: false
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: "#272c34"
                    height: 420
                    radius: 4

                    MOverflowYBox {
                        anchors.fill: parent

                        MCopyText {
                            color: Color.white
                            padding: 20
                            bottomPadding: 20
                            textFormat: TextEdit.RichText
                            text: `
<pre >
Row {
    spacing: 20
    padding: 20

    Column {
        spacing: 20

        MTextField {
            size: "small"
            placeholder: "Standard"
            width: 180
        }

        MTextField {
            size: "small"
            variant: "filled"
            placeholder: "Filled"
            width: 180
        }

        MTextField {
            size: "small"
            variant: "outlined"
            placeholder: "Outlined"
            width: 180
        }
    }

    Column {
        spacing: 20

        MTextField {
            placeholder: "Standard"
            width: 180
        }

        MTextField {
            variant: "filled"
            placeholder: "Filled"
            width: 180
        }

        MTextField {
            variant: "outlined"
            placeholder: "Outlined"
            width: 180
        }
    }
}
</pre>
`
                        }
                    }
                }



                // **********颜色属性

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "颜色属性"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>当使用 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >color</span> 属性时，聚焦文本框时的高亮颜色会被改变。</p>`
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

                        MTextField {
                            color: "secondary"
                            placeholder: "Standard secondary"
                            width: 180
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MTextField {
                            variant: "filled"
                            color: "secondary"
                            placeholder: "Filled secondary"
                            width: 180
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MTextField {
                            variant: "outlined"
                            color: "secondary"
                            placeholder: "Outlined secondary"
                            width: 180
                            anchors.verticalCenter: parent.verticalCenter
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
                            color_code.visible = !color_code.visible
                        }
                    }
                }

                Rectangle {
                    id: color_code
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
Row {
    spacing: 20
    padding: 20

    MTextField {
        color: "secondary"
        placeholder: "Standard secondary"
        width: 180
        anchors.verticalCenter: parent.verticalCenter
    }

    MTextField {
        variant: "filled"
        color: "secondary"
        placeholder: "Filled secondary"
        width: 180
        anchors.verticalCenter: parent.verticalCenter
    }

    MTextField {
        variant: "outlined"
        color: "secondary"
        placeholder: "Outlined secondary"
        width: 180
        anchors.verticalCenter: parent.verticalCenter
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
                            text: "MTextField { }"
                            onClicked: {
                                Route.redirectTo("/api/textfield")
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
