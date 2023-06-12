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

        Rectangle {
            id: right_area
            RowLayout.fillHeight: true
            RowLayout.fillWidth: true

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    RowLayout.fillHeight: true
                }

                MTypography {
                    Layout.alignment: Qt.AlignHCenter
                    text: "MaterialUI-QML"
                    textColor: "primary"
                    font.pointSize: 48
                }

                MTypography {
                    Layout.alignment: Qt.AlignHCenter
                    text: "QML组件用于更快速、更简便的QML开发。"
                    textColor: "primary"
                    font.pointSize: 24
                }

                Rectangle {
                    RowLayout.fillHeight: true
                }
            }
        }
    }
}
