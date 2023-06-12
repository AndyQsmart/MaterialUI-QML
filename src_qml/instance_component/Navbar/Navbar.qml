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
    width: 150
    background: Rectangle {
        color: Color.primary
    }

    Item {
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            anchors.bottomMargin: 10
            anchors.topMargin: 10

            MListItem {
                id: button_task_list
                button: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                ColumnLayout.fillWidth: true
                color: Color.white

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: parent.rightPadding
                    anchors.rightMargin: parent.rightPadding

                    MIcon {
                        name: "download"
                        size: 14
                        color: Color.white
                    }

                    MTypography {
                        RowLayout.fillWidth: true
                        leftPadding: 10
                        text: qsTr("下载")
                        color: Color.white
                    }
                }

                onClicked: {
                    Route.redirectTo("/")
                }
            }

            Item {
                ColumnLayout.fillHeight: true
            }

            MListItem {
                id: button_about
                button: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                ColumnLayout.fillWidth: true
                color: Color.white

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: parent.leftPadding
                    anchors.rightMargin: parent.rightPadding

                    MIcon {
                        name: "info-circle"
                        size: 14
                        color: Color.white
                    }

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
