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
                    url: "/"
                }
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
                        leftPadding: 10
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

                    MListItem {
                        id: listTitle
                        property var listData: modelData
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
                                text: listTitle.listData.name
                                variant: "body2"
                                color: Color.white
                                font.weight: Font.DemiBold
                            }
                        }
                    }

                    Repeater {
                        model: modelData.subList

                        MListItem {
                            property var listData: modelData
                            width: parent.width
                            button: true
                            color: Color.white

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: parent.rightPadding
                                anchors.rightMargin: parent.rightPadding

                                MTypography {
                                    RowLayout.fillWidth: true
                                    leftPadding: 20
                                    text: listData.name
                                    variant: "body2"
                                    color: Color.white
                                }
                            }

                            onClicked: {
                                Route.redirectTo(listData.url)
                            }
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
                        leftPadding: 10
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
