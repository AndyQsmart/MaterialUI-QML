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
import "../../common_component/MaterialUI/Font/IconsName.js" as IconsName

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
                        text: "FontAwesome Icons 图标"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "你可以在使用 1400 多个 FontAwesome icons。"
                        gutterBottom: true
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
                        width: parent.width-40
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Repeater {
                            property var keys: Object.keys(IconsName.name).sort()
                            model: keys
                            delegate: Column {
                                width: 160

                                MIcon {
                                    size: 20
                                    name: modelData
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                MTypography {
                                    variant: 'caption'
                                    text: modelData
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }
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
                            text: "MIcon { }"
                            onClicked: {
                                Route.redirectTo("/api/icon")
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
