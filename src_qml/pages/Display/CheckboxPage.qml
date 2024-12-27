import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../../common_component/MaterialUI"
import "../../common_component/MaterialUI/styles"
import "../../common_component/Route"
import "../../common_js/Color.js" as Color
import "../../common_js/Tools.js" as Tools

Pane {
    id: container
    x: 0
    y: 0
    padding: 0
    background: null

    RowLayout {
        id: main_area
        anchors.fill: parent
        spacing: 0

        MOverflowYBox {
            id: scroll_list
            Layout.fillHeight: true
            Layout.fillWidth: true

            ColumnLayout {
                width: scroll_list.availableWidth
                spacing: 0

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "h4"
                        text: "Checkbox 多选框"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "在一个集合内，用户可以通过多选框组件进行一项或者多项选择。"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="color: ${MPalette.secondaryMain}" >多选框</span>可以在打开或者关闭一个选项中切换。</p>`
                        wrapMode: MTypography.WordWrap
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "若一个列表存在多个选择项时，使用多选框替代开关控件，可以节省空间。 若只存在一个选择项，请避免使用多选框，而改用开关控件。"
                        wrapMode: MTypography.WordWrap
                    }
                }

                // **********简单的多选框

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "简单的多选框"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MCheckbox {
                            checked: true
                        }
                        MCheckbox {
                            checked: true
                            color: "primary"
                        }
                        MCheckbox {

                        }
                        MCheckbox {
                            disabled: true
                        }
                        MCheckbox {
                            checked: true
                            disabled: true
                        }
                        MCheckbox {
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
                            simple_check_code.visible = !simple_check_code.visible
                        }
                    }
                }

                Rectangle {
                    id: simple_check_code
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
<pre>
MCheckbox {
    checked: true
}

MCheckbox {
    checked: true
    color: "primary"
}

MCheckbox {

}

MCheckbox {
    disabled: true
}

MCheckbox {
    checked: true
    disabled: true
}

MCheckbox {
    checked: true
    color: "default"
}
</pre>
                            `
                        }
                    }
                }

                // **********带有 FormControlLabel 的多选框

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "带有 FormControlLabel 的多选框"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>借助 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >FormControlLabel</span> 组件，<span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >多选框组件</span>可以和标签一起使用。</p>`
                        wrapMode: MTypography.WordWrap
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
                            label: 'Secondary'
                            control: MCheckbox {
                                checked: true
                            }
                        }

                        MFormControlLabel {
                            label: 'Primary'
                            control: MCheckbox {
                                checked: true
                                color: "primary"
                            }
                        }

                        MFormControlLabel {
                            label: 'Uncontrolled'
                            control: MCheckbox {
                            }
                        }

                        MFormControlLabel {
                            label: 'Disabled'
                            control: MCheckbox {
                                disabled: true
                            }
                        }

                        MFormControlLabel {
                            label: 'Disabled'
                            control: MCheckbox {
                                disabled: true
                                checked: true
                            }
                        }

                        MFormControlLabel {
                            label: 'Custom color'
                            control: MCheckbox {
                                color: "#00ff00"
                                checked: true
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
                            formcontrol_label_code.visible = !formcontrol_label_code.visible
                        }
                    }
                }

                Rectangle {
                    id: formcontrol_label_code
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
<pre>
MFormControlLabel {
    label: 'Secondary'
    control: MCheckbox {
        checked: true
    }
}

MFormControlLabel {
    label: 'Primary'
    control: MCheckbox {
        checked: true
        color: "primary"
    }
}

MFormControlLabel {
    label: 'Uncontrolled'
    control: MCheckbox {
    }
}

MFormControlLabel {
    label: 'Disabled'
    control: MCheckbox {
        disabled: true
    }
}

MFormControlLabel {
    label: 'Disabled'
    control: MCheckbox {
        disabled: true
        checked: true
    }
}

MFormControlLabel {
    label: 'Custom color'
    control: MCheckbox {
        color: "#00ff00"
        checked: true
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
                        text: "你可以更改标签的位置:"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Column {
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MTypography {
                            textColor: "textSecondary"
                            text: "Label Placement"
                        }

                        Row {
                            spacing: 20

                            MFormControlLabel {
                                labelPlacement: 'top'
                                label: 'Top'
                                control: MCheckbox {
                                }
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MFormControlLabel {
                                labelPlacement: 'start'
                                label: 'Start'
                                control: MCheckbox {
                                }
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MFormControlLabel {
                                labelPlacement: 'bottom'
                                label: 'Bottom'
                                control: MCheckbox {
                                }
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MFormControlLabel {
                                labelPlacement: 'end'
                                label: 'End'
                                control: MCheckbox {
                                }
                                anchors.verticalCenter: parent.verticalCenter
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
                            label_placement_code.visible = !label_placement_code.visible
                        }
                    }
                }

                Rectangle {
                    id: label_placement_code
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
<pre>
Column {
    padding: 20
    anchors.horizontalCenter: parent.horizontalCenter

    MTypography {
        textColor: "textSecondary"
        text: "Label Placement"
    }

    Row {
        spacing: 20

        MFormControlLabel {
            labelPlacement: 'top'
            label: 'Top'
            control: MCheckbox {
            }
            anchors.verticalCenter: parent.verticalCenter
        }

        MFormControlLabel {
            labelPlacement: 'start'
            label: 'Start'
            control: MCheckbox {
            }
            anchors.verticalCenter: parent.verticalCenter
        }

        MFormControlLabel {
            labelPlacement: 'bottom'
            label: 'Bottom'
            control: MCheckbox {
            }
            anchors.verticalCenter: parent.verticalCenter
        }

        MFormControlLabel {
            labelPlacement: 'end'
            label: 'End'
            control: MCheckbox {
            }
            anchors.verticalCenter: parent.verticalCenter
        }
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
                            text: "MCheckbox { }"
                            onClicked: {
                                Route.redirectTo("/api/checkbox")
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
                            text: "MFormControlLabel { }"
                            onClicked: {
                                Route.redirectTo("/api/formcontrollabel")
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
