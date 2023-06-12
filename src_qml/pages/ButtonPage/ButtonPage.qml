import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.11
import "../../common_component/MaterialUI"
import "../../common_component/Route"
import "../../common_qml"
import "../../instance_component/Navbar"
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

        Navbar {
            RowLayout.fillHeight: true
        }

        MOverflowYBox {
            RowLayout.fillHeight: true
            RowLayout.fillWidth: true
            // ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            ColumnLayout {
                spacing: 0

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        variant: "h4"
                        text: "Button 按钮"
                    }

                    MTypography {
                        variant: "h5"
                        text: "只需轻点按钮，用户就可以触发动作或做出选择。"
                        gutterBottom: true
                    }

                    Row {
                        MTypography {
                            variant: "body1"
                            textColor: "secondary"
                            text: "按钮"
                        }

                        MTypography {
                            variant: "body1"
                            text: "传达了一系列用户可以执行的操作命令。 他们通常直接放置在您的用户界面中，例如："
                            gutterBottom: true
                        }
                    }

                    MTypography {
                        variant: "body1"
                        text: "○ Dialogs 对话框"
                    }
                    MTypography {
                        variant: "body1"
                        text: "○ Modal windows 模态窗口"
                    }
                    MTypography {
                        variant: "body1"
                        text: "○ Forms 表单"
                    }
                    MTypography {
                        variant: "body1"
                        text: "○ Cards 卡片"
                    }
                    MTypography {
                        variant: "body1"
                        text: "○ Toolbars 工具栏"
                        gutterBottom: true
                    }
                }

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        variant: "h5"
                        text: "Contained Buttons 实心按钮"
                    }

                    Row {
                        MTypography {
                            variant: "body1"
                            textColor: "secondary"
                            text: "实心按钮 "
                        }

                        MTypography {
                            variant: "body1"
                            text: "表示高度的强调，你根据它们的立体效果和填充颜色来区分彼此。"
                            gutterBottom: true
                        }
                    }
                    MTypography {
                        variant: "body1"
                        text: "它们用于触发应用程序所具有的主要功能。"
                        gutterBottom: true
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: contained_button_display.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        id: contained_button_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20

                        MButton {
                            variant: "contained"
                            text: "DEFAULT"
                        }

                        MButton {
                            variant: "contained"
                            color: "primary"
                            text: "PRIMARY"
                        }

                        MButton {
                            variant: "contained"
                            color: "secondary"
                            text: "SECONDARY"
                        }

                        MButton {
                            variant: "contained"
                            disabled: true
                            text: "DISABLED"
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: Color.black
                    height: contained_button_code.height
                    radius: 4


                    Column {
                        id: contained_button_code
                        Layout.fillWidth: true
                        leftPadding: 20
                        rightPadding: 20

                        MTypography {
                            color: Color.white
                            text: `
MButton {
    variant: "contained"
    text: "DEFAULT"
}

MButton {
    variant: "contained"
    color: "primary"
    text: "PRIMARY"
}

MButton {
    variant: "contained"
    color: "secondary"
    text: "SECONDARY"
}

MButton {
    variant: "contained"
    disabled: true
    text: "DISABLED"
}
                            `
                        }
                    }
                }

                MTypography {
                    Layout.topMargin: 20
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    variant: "body1"
                    text: "你也可以使用属性 disableElevation 属性来消除实心按钮的立体效果。"
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: contained_button_disableElevation_display.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        id: contained_button_disableElevation_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20

                        MButton {
                            variant: "contained"
                            color: "primary"
                            disableElevation: true
                            text: "Disable elevation"
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: Color.black
                    height: contained_button_disableElevation_code.height
                    radius: 4


                    Column {
                        id: contained_button_disableElevation_code
                        Layout.fillWidth: true
                        leftPadding: 20
                        rightPadding: 20

                        MTypography {
                            color: Color.white
                            text: `
MButton {
    variant: "contained"
    color: "primary"
    disableElevation: true
    text: "Disable elevation"
}
                            `
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
