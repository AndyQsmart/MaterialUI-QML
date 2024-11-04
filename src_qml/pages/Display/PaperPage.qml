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
                        text: "Paper 纸张组件"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "在 Material Design 中，我们在屏幕上展现了纸张的物理属性。"
                    }
                }

                // **********Paper

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "应用程序的的背景类似纸张一样平坦、不透明，而其行为也像纸张一样，能够改变大小、与其他纸张绑定或者调换顺序。"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    Layout.topMargin: 10
                    height: childrenRect.height
                    color: "#f5f5f5"

                    Row {
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20

                        MPaper {
                            width: 128
                            height: 128
                            elevation: 0
                        }

                        MPaper {
                            width: 128
                            height: 128
                        }

                        MPaper {
                            width: 128
                            height: 128
                            elevation: 3
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
MPaper {
    width: 128
    height: 128
    elevation: 0
}

MPaper {
    width: 128
    height: 128
}

MPaper {
    width: 128
    height: 128
    elevation: 3
}
</pre>
                            `
                        }
                    }
                }

                // 变体

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "变体"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "如果你想要一个轮廓的曲面，你可以使用 variant 属性。"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    Layout.topMargin: 10
                    height: childrenRect.height

                    Row {
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20

                        MPaper {
                            width: 128
                            height: 128
                            variant: "outlined"
                        }

                        MPaper {
                            width: 128
                            height: 128
                            variant: "outlined"
                            square: true
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
MPaper {
    width: 128
    height: 128
    variant: "outlined"
}

MPaper {
    width: 128
    height: 128
    variant: "outlined"
    square: true
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
                            text: "MPaper { }"
                            onClicked: {
                                Route.redirectTo("/api/paper")
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
