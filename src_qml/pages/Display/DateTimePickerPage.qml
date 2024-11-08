import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.11
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
                        text: "Date/Time Pickers日期/时间选择器"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "日期选择器和时间选择器提供了一个从事先设定好的日期集合中选择单个值的简单方法。"
                        gutterBottom: true
                    }


                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>用户可以通过<span style="color: ${Palette.secondaryMain}" >文本框</span>在界面中输入文本。 通常，我们会在表单域和对话框中使用它们。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }



                // **********日期选择器

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "日期选择器"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >日期选择器</span> 用于选择年月日的日期。</p>`
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "它支持 standard，outlined 和 filled 这几个样式。"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>可以通过 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >size</span> 改变它的大小。</p>`
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

                    Column {
                        anchors.horizontalCenter: parent.horizontalCenter

                        Row {
                            spacing: 20
                            padding: 20
                            anchors.horizontalCenter: parent.horizontalCenter

                            MDatePicker {
                                anchors.verticalCenter: parent.verticalCenter
                                size: "small"
                                color: "secondary"
                            }

                            MDatePicker {
                                variant: "outlined"
                                anchors.verticalCenter: parent.verticalCenter
                                size: "small"
                                color: "secondary"
                            }

                            MDatePicker {
                                variant: "filled"
                                anchors.verticalCenter: parent.verticalCenter
                                size: "small"
                                color: "secondary"
                            }
                        }
                        Row {
                            spacing: 20
                            padding: 20
                            anchors.horizontalCenter: parent.horizontalCenter

                            MDatePicker {
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MDatePicker {
                                variant: "outlined"
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MDatePicker {
                                variant: "filled"
                                anchors.verticalCenter: parent.verticalCenter
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
Column {
    Row {
        spacing: 20
        padding: 20
        anchors.horizontalCenter: parent.horizontalCenter

        MDatePicker {
            anchors.verticalCenter: parent.verticalCenter
            size: "small"
            color: "secondary"
        }

        MDatePicker {
            variant: "outlined"
            anchors.verticalCenter: parent.verticalCenter
            size: "small"
            color: "secondary"
        }

        MDatePicker {
            variant: "filled"
            anchors.verticalCenter: parent.verticalCenter
            size: "small"
            color: "secondary"
        }
    }
    Row {
        spacing: 20
        padding: 20
        anchors.horizontalCenter: parent.horizontalCenter

        MDatePicker {
            anchors.verticalCenter: parent.verticalCenter
        }

        MDatePicker {
            variant: "outlined"
            anchors.verticalCenter: parent.verticalCenter
        }

        MDatePicker {
            variant: "filled"
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
</pre>
                            `
                        }
                    }
                }




                // **********时间选择器

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "时间选择器"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >时间选择器</span> 是对日期选择器的封装，增加了时、分的选择。</p>`
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>可以通过 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >size</span> 改变它的大小。</p>`
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

                    Column {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MTimePicker {
                            size: "small"
                            color: "secondary"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        MTimePicker {
                            variant: "outlined"
                            size: "small"
                            color: "secondary"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        MTimePicker {
                            variant: "filled"
                            size: "small"
                            color: "secondary"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        MTimePicker {
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        MTimePicker {
                            variant: "outlined"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        MTimePicker {
                            variant: "filled"
                            anchors.horizontalCenter: parent.horizontalCenter
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
                            time_code.visible = !time_code.visible
                        }
                    }
                }

                Rectangle {
                    id: time_code
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
Column {
    spacing: 20
    padding: 20

    MTimePicker {
        size: "small"
        color: "secondary"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MTimePicker {
        variant: "outlined"
        size: "small"
        color: "secondary"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MTimePicker {
        variant: "filled"
        size: "small"
        color: "secondary"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MTimePicker {
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MTimePicker {
        variant: "outlined"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MTimePicker {
        variant: "filled"
        anchors.horizontalCenter: parent.horizontalCenter
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
                            text: "MDatePicker { }"
                            onClicked: {
                                Route.redirectTo("/api/datepicker")
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
                            text: "MTimePicker { }"
                            onClicked: {
                                Route.redirectTo("/api/timepicker")
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
