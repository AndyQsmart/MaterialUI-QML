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
import "../../common_component/MaterialUI/SvgIcon/FilledMap.js" as FilledMap
import "../../common_component/MaterialUI/SvgIcon/OutlinedMap.js" as OutlinedMap
import "../../common_component/MaterialUI/SvgIcon/RoundedMap.js" as RoundedMap
import "../../common_component/MaterialUI/SvgIcon/TwoToneMap.js" as TwoToneMap
import "../../common_component/MaterialUI/SvgIcon/SharpMap.js" as SharpMap


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
                        text: "Svg Icons 图标"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "你可以在使用 2100 多个 Svg icons。"
                        gutterBottom: true
                    }
                }

                Row {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MRadioGroup {
                        id: variant_select
                        row: true
                        value: "filled"

                        MFormControlLabel {
                            value: "filled"
                            label: "Filled"
                            control: MRadio { }
                        }
                        MFormControlLabel {
                            value: "outlined"
                            label: "Outlined"
                            control: MRadio { }
                        }
                        MFormControlLabel {
                            value: "rounded"
                            label: "Rounded"
                            control: MRadio { }
                        }
                        MFormControlLabel {
                            value: "two tone"
                            label: "Two tone"
                            control: MRadio { }
                        }
                        MFormControlLabel {
                            value: "sharp"
                            label: "Sharp"
                            control: MRadio { }
                        }
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
                            property var keys: {
                                switch (variant_select.value) {
                                    case "filled":
                                        return Object.keys(FilledMap.name).sort()
                                    case "outlined":
                                        return Object.keys(OutlinedMap.name).sort()
                                    case "rounded":
                                        return Object.keys(RoundedMap.name).sort()
                                    case "two tone":
                                        return Object.keys(TwoToneMap.name).sort()
                                    case "sharp":
                                        return Object.keys(SharpMap.name).sort()
                                }
                                return Object.keys(FilledMap.name).sort()
                            }
                            model: keys
                            delegate: Column {
                                width: 160

                                MSvgIcon {
                                    name: modelData.replace('Outlined', '').replace('Rounded', '').replace('TwoTone', '').replace('Sharp', '')
                                    variant: variant_select.value
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }

                                MTypography {
                                    variant: 'caption'
                                    text: modelData.replace('Outlined', '').replace('Rounded', '').replace('TwoTone', '').replace('Sharp', '')
                                    // text: modelData
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
                            text: "MSvgIcon { }"
                            onClicked: {
                                Route.redirectTo("/api/svgicon")
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
