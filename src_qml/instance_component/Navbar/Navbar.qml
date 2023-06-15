import QtQuick 2.13
import QtQuick.Controls.Material 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "../../common_js/Color.js" as Color
import "../../common_component/MaterialUI"
import "../../common_component/Route"
import "../../instance_component/AboutDialog"

Pane {
    id: navbar
    x: 0
    y: 0
    padding: 0
    width: 200

    property var buttonList: [
        {
            name: "Components 组件",
            subList: [
                {
                    name: "Inputs 输入框",
                    subList: [
                        {
                            name: "Button 按钮",
                            url: "/buttonpage"
                        }
                    ]
                },
                {
                    name: "Surfaces 表面展示",
                    subList: [
                        {
                            name: "Paper 纸张",
                            url: "/paperpage"
                        }
                    ]
                }
            ],
            open: true
        },
        {
            name: "Component API",
            subList: [
                {
                    name: "Button",
                    url: "/api/button"
                },
                {
                    name: "Button Base",
                    url: "/api/buttonbase"
                },
                {
                    name: "Icon",
                    url: "/api/icon"
                },
                {
                    name: "Paper",
                    url: "/api/paper"
                },
            ]
        }
    ]

    background: Rectangle {
        color: Color.primary
    }

    MOverflowYBox {
        anchors.fill: parent

        Column {
            width: parent.width
            topPadding: 10
            bottomPadding: 10

            MListItem {
                width: parent.width
                button: true
                color: Color.white

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: parent.leftPadding
                    anchors.rightMargin: parent.rightPadding

                    MTypography {
                        RowLayout.fillWidth: true
                        leftPadding: 0
                        text: qsTr("首页")
                        color: Color.white
                    }
                }

                onClicked: {
                    Route.redirectTo("/")
                }
            }

            Repeater {
                model: buttonList

                Column {
                    width: parent.width
                    property var listData1: modelData

                    MListItem {
                        width: parent.width
                        button: true
                        color: Color.white

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: parent.rightPadding
                            anchors.rightMargin: parent.rightPadding

                            MTypography {
                                RowLayout.fillWidth: true
                                leftPadding: 0
                                text: listData1.name
                                variant: "body2"
                                color: Color.white
                                font.weight: Font.DemiBold
                            }
                        }

                        onClicked: {
                            sub_list_animation.open = !sub_list_animation.open
                        }
                    }

                    ColumnLayout {
                        id: sub_list
                        spacing: 0
                        width: parent.width

                        Component.onCompleted: {
                            if (listData1.open) {
                                sub_list_animation.open = true
                            }
                            else {
                                sub_list_animation.open = false
                            }
                        }

                        Repeater {
                            model: listData1.subList

                            ColumnLayout {
                                Layout.fillWidth: true
                                property var listData2: modelData

                                MListItem {
                                    Layout.fillWidth: true
                                    button: true
                                    color: Color.white

                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.leftMargin: parent.rightPadding
                                        anchors.rightMargin: parent.rightPadding

                                        MTypography {
                                            RowLayout.fillWidth: true
                                            leftPadding: 20
                                            text: listData2.name
                                            variant: "body2"
                                            color: Color.white
                                            font.weight: listData2.url ? Font.Normal : Font.DemiBold
                                        }
                                    }

                                    onClicked: {
                                        if (listData2.url) {
                                            Route.redirectTo(listData2.url)
                                        }
                                    }
                                }

                                Repeater {
                                    model: listData2.subList

                                    MListItem {
                                        Layout.fillWidth: true
                                        button: true
                                        color: Color.white

                                        RowLayout {
                                            anchors.fill: parent
                                            anchors.leftMargin: parent.rightPadding
                                            anchors.rightMargin: parent.rightPadding

                                            MTypography {
                                                RowLayout.fillWidth: true
                                                leftPadding: 40
                                                text: modelData.name
                                                variant: "body2"
                                                color: Color.white
                                            }
                                        }

                                        onClicked: {
                                            Route.redirectTo(modelData.url)
                                        }
                                    }
                                }
                            }
                        }

                        MCollapse {
                            id: sub_list_animation
                            open: false
                            target: sub_list
                        }
                    }

                }
            }

            MListItem {
                width: parent.width
                button: true
                color: Color.white

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: parent.leftPadding
                    anchors.rightMargin: parent.rightPadding

                    MTypography {
                        RowLayout.fillWidth: true
                        leftPadding: 0
                        text: qsTr("关于")
                        color: Color.white
                    }
                }

                onClicked: {
                    aboutDialog.open()
                }
            }
        }
    }

    AboutDialog {
        id: aboutDialog
        x: (parent.parent.parent.width-aboutDialog.width)/2
        y: (parent.parent.parent.height-aboutDialog.height)/2
    }
}
