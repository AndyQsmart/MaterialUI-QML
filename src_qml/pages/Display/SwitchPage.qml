import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
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
                        text: "Switch 开关组件"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "开关控制能切换单个设置的开/关两个状态。"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>在移动设备上调整设置时，<span style="color: ${Palette.secondaryMain}" >Switches</span> 是一个首选方式。 开关控制的选项，以及它当前所处的状态，都应该在相应的描述标签中明确说明。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }


                // **********基本的开关

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "基本的开关"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    implicitHeight: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MSwitch {
                            checked: true
                        }

                        MSwitch {
                            checked: true
                            color: "primary"
                        }

                        MSwitch {
                        }

                        MSwitch {
                            disabled: true
                        }

                        MSwitch {
                            disabled: true
                            checked: true
                        }

                        MSwitch {
                            checked: true
                            color: "default"
                        }
                    }
                }

                RowLayout {
                    Layout.topMargin: 10
                    Layout.bottomMargin: 10
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20

                    MButton {
                        variant: "outlined"
                        text: "< > Code"

                        onClicked: {
                            simple_switch_code.visible = !simple_switch_code.visible
                        }
                    }
                }

                Rectangle {
                    id: simple_switch_code
                    visible: false
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: "#272c34"
                    height: 420
                    radius: 4

                    MOverflowYBox {
                        anchors.fill: parent

                        MCopyText {
                            color: Color.white
                            padding: 20
                            bottomPadding: 20
                            textFormat: TextEdit.RichText
                            text: `
<pre >
Row {
    spacing: 20
    padding: 20

    MSwitch {
        checked: true
    }

    MSwitch {
        checked: true
        color: "primary"
    }

    MSwitch {
    }

    MSwitch {
        disabled: true
    }

    MSwitch {
        disabled: true
        checked: true
    }

    MSwitch {
        checked: true
        color: "default"
    }
}
</pre>
`
                        }
                    }
                }


                // **********带有 FormControlLabel 的开关

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "带有 FormControlLabel 的开关"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>借助 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >FormControlLabel</span> 组件，<span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >Switch</span> 能够提供一些描述。</p>`
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    implicitHeight: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Flow {
                        width: parent.width
                        spacing: 20
                        padding: 20

                        MFormControlLabel {
                            label: "Secondary"
                            control: MSwitch {
                                checked: true
                            }
                        }

                        MFormControlLabel {
                            label: "Primary"
                            control: MSwitch {
                                checked: true
                                color: "primary"
                            }
                        }

                        MFormControlLabel {
                            label: "Unchecked"
                            control: MSwitch {
                            }
                        }

                        MFormControlLabel {
                            label: "Disabled"
                            control: MSwitch {
                                disabled: true
                            }
                        }

                        MFormControlLabel {
                            label: "Disabled"
                            control: MSwitch {
                                disabled: true
                                checked: true
                            }
                        }

                        MFormControlLabel {
                            label: "Default"
                            control: MSwitch {
                                checked: true
                                color: "default"
                            }
                        }
                    }
                }

                RowLayout {
                    Layout.topMargin: 10
                    Layout.bottomMargin: 10
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20

                    MButton {
                        variant: "outlined"
                        text: "< > Code"

                        onClicked: {
                            form_switch_code.visible = !form_switch_code.visible
                        }
                    }
                }

                Rectangle {
                    id: form_switch_code
                    visible: false
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: "#272c34"
                    height: 420
                    radius: 4

                    MOverflowYBox {
                        anchors.fill: parent

                        MCopyText {
                            color: Color.white
                            padding: 20
                            bottomPadding: 20
                            textFormat: TextEdit.RichText
                            text: `
<pre >
Flow {
    spacing: 20
    padding: 20

    MFormControlLabel {
        label: "Secondary"
        control: MSwitch {
            checked: true
        }
    }

    MFormControlLabel {
        label: "Primary"
        control: MSwitch {
            checked: true
            color: "primary"
        }
    }

    MFormControlLabel {
        label: "Unchecked"
        control: MSwitch {
        }
    }

    MFormControlLabel {
        label: "Disabled"
        control: MSwitch {
            disabled: true
        }
    }

    MFormControlLabel {
        label: "Disabled"
        control: MSwitch {
            disabled: true
            checked: true
        }
    }

    MFormControlLabel {
        label: "Default"
        control: MSwitch {
            checked: true
            color: "default"
        }
    }
}
</pre>
`
                        }
                    }
                }


                // **********标签放置

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "标签放置"
                    }

                    MTypography {
                        variant: "body1"
                        text: `你可以更改标签的位置：`
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    implicitHeight: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MFormControlLabel {
                            value: "top"
                            label: "Top"
                            labelPlacement: "top"
                            control: MSwitch { }
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MFormControlLabel {
                            value: "start"
                            label: "Start"
                            labelPlacement: "start"
                            control: MSwitch { }
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MFormControlLabel {
                            value: "bottom"
                            label: "Bottom"
                            labelPlacement: "bottom"
                            control: MSwitch { }
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MFormControlLabel {
                            value: "end"
                            label: "End"
                            labelPlacement: "end"
                            control: MSwitch { }
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                RowLayout {
                    Layout.topMargin: 10
                    Layout.bottomMargin: 10
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20

                    MButton {
                        variant: "outlined"
                        text: "< > Code"

                        onClicked: {
                            labelPlacement_switch_code.visible = !labelPlacement_switch_code.visible
                        }
                    }
                }

                Rectangle {
                    id: labelPlacement_switch_code
                    visible: false
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: "#272c34"
                    height: 420
                    radius: 4

                    MOverflowYBox {
                        anchors.fill: parent

                        MCopyText {
                            color: Color.white
                            padding: 20
                            bottomPadding: 20
                            textFormat: TextEdit.RichText
                            text: `
<pre >
Row {
    spacing: 20
    padding: 20

    MFormControlLabel {
        value: "top"
        label: "Top"
        labelPlacement: "top"
        control: MSwitch { }
        anchors.verticalCenter: parent.verticalCenter
    }

    MFormControlLabel {
        value: "start"
        label: "Start"
        labelPlacement: "start"
        control: MSwitch { }
        anchors.verticalCenter: parent.verticalCenter
    }

    MFormControlLabel {
        value: "bottom"
        label: "Bottom"
        labelPlacement: "bottom"
        control: MSwitch { }
        anchors.verticalCenter: parent.verticalCenter
    }

    MFormControlLabel {
        value: "end"
        label: "End"
        labelPlacement: "end"
        control: MSwitch { }
        anchors.verticalCenter: parent.verticalCenter
    }
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
                            text: "MFormControlLabel { }"
                            onClicked: {
                                Route.redirectTo("/api/formcontrollabel")
                            }
                        }
                    }

                    RowLayout {
                        MTypography {
                            variant: "body1"
                            text: "○"
                        }
                        MButton {
                            color: "secondary"
                            text: "MSwitch { }"
                            onClicked: {
                                Route.redirectTo("/api/switch")
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
