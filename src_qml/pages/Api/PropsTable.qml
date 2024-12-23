import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../../common_component/MaterialUI"
import "../../common_component/MaterialUI/styles"
import "../../common_qml"

ColumnLayout {
    property var propsList: []

    Row {
        Layout.leftMargin: 20
        Layout.rightMargin: 20
        Layout.topMargin: 20
        Layout.fillWidth: true

        Column {
            width: parent.width/5
            leftPadding: 10
            bottomPadding: 10

            MTypography {
                text: "Name"
                font.weight: Font.DemiBold
            }
        }
        Column {
            width: parent.width/5
            bottomPadding: 10

            MTypography {
                text: "Type"
                font.weight: Font.DemiBold
            }
        }
        Column {
            width: parent.width/5
            bottomPadding: 10

            MTypography {
                text: "Default"
                font.weight: Font.DemiBold
            }

        }
        Column {
            width: parent.width*2/5
            bottomPadding: 10

            MTypography {
                text: "Description"
                font.weight: Font.DemiBold
            }
        }
    }

    MDivider {
        Layout.fillWidth: true
        Layout.leftMargin: 20
        Layout.rightMargin: 20
    }

    Repeater {
        model: propsList

        Column {
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.rightMargin: 20

            Row {
                id: row
                topPadding: 20
                bottomPadding: 20
                width: parent.width

                Column {
                    width: parent.width/5
                    anchors.verticalCenter: parent.verticalCenter
                    leftPadding: 10

                    MTypography {
                        width: parent.width
                        text: modelData.name
                    }
                }
                Column {
                    width: parent.width/5
                    anchors.verticalCenter: parent.verticalCenter

                    MTypography {
                        width: parent.width
                        color: Palette.secondaryDark
                        text: modelData.type
                    }
                }
                Column {
                    width: parent.width/5
                    anchors.verticalCenter: parent.verticalCenter

                    MTypography {
                        width: parent.width
                        text: modelData.default_value ? modelData.default_value : " "
                    }

                }
                Column {
                    width: parent.width*2/5
                    anchors.verticalCenter: parent.verticalCenter

                    MTypography {
                        width: parent.width
                        text: modelData.description
                    }
                }
            }
            MDivider {
                width: parent.width
            }
        }
    }
}
