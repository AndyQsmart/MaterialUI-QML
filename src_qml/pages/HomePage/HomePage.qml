import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../common_component/MaterialUI"
import "../../common_component/Route"
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

        Rectangle {
            id: right_area
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.fillHeight: true
                }

                MTypography {
                    Layout.alignment: Qt.AlignHCenter
                    text: "MaterialUI-QML"
                    textColor: "primary"
                    fontSize: 48
                }

                MTypography {
                    Layout.alignment: Qt.AlignHCenter
                    text: "QML组件用于更快速、更简便的QML开发。"
                    textColor: "primary"
                    fontSize: 24
                }

                Rectangle {
                    Layout.fillHeight: true
                }
            }
        }
    }
}
