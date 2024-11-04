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
                        text: "Radio 单选框组件"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "用户可以通过单选按钮从一组中选择一个选项。"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>当用户想要看到所有的选项时，可以使用 <span style="color: ${Palette.secondaryMain}" >单选按钮</span>。如果可用选项可以折叠，请您考虑使用占用空间更少的下拉菜单。</p>`
                        wrapMode: MTypography.WordWrap
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "默认情况下，单选按钮应该选择了最常用的选项。"
                        wrapMode: MTypography.WordWrap
                    }
                }


                // **********RadioGroup 单选框组

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "RadioGroup 单选框组"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >RadioGroup</span> 适用于一组 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >Radio</span>，它提供相对简单的 API 并且能够使用键盘对该 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >RadioGroup</span> 进行控制。</p>`
                        wrapMode: MTypography.WordWrap
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

                    Column {
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MTypography {
                            textColor: "textSecondary"
                            text: "Gender"
                        }

                        MRadioGroup {
                            MFormControlLabel {
                                value: "female"
                                label: "Female"
                                control: MRadio {
                                }
                            }
                            MFormControlLabel {
                                value: "male"
                                label: "Male"
                                control: MRadio {
                                }
                            }
                            MFormControlLabel {
                                value: "other"
                                label: "Other"
                                control: MRadio {
                                }
                            }
                            MFormControlLabel {
                                disabled: true
                                value: "disabled"
                                label: "(Disabled option)"
                                control: MRadio {
                                }
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
                            group_list_code.visible = !group_list_code.visible
                        }
                    }
                }

                Rectangle {
                    id: group_list_code
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: "#272c34"
                    height: childrenRect.height
                    radius: 4

                    Column {
                        Layout.fillWidth: true
                        padding: 20

                        MCopyText {
                            color: Color.white
                            textFormat: TextEdit.RichText
                            text: `
<pre>
Column {
    padding: 20

    MTypography {
        textColor: "textSecondary"
        text: "Gender"
    }

    MRadioGroup {
        MFormControlLabel {
            value: "female"
            label: "Female"
            control: MRadio { }
        }
        MFormControlLabel {
            value: "male"
            label: "Male"
            control: MRadio { }
        }
        MFormControlLabel {
            value: "other"
            label: "Other"
            control: MRadio { }
        }
        MFormControlLabel {
            disabled: true
            value: "disabled"
            label: "(Disabled option)"
            control: MRadio { }
        }
    }
}
</pre>
`
                        }
                    }
                }

                MTypography {
                    Layout.topMargin: 20
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    variant: "body1"
                    text: "要横向布置按钮，请将 row 属性设置为：MRadioGroup { row: true }。"
                }

                // **********Standalone radio buttons 独立的单选框按钮

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Standalone radio buttons 独立的单选框按钮"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >Radio</span> 也可以单独使用，无需额外的 RadioGroup wrapper。在同一父节点下的Radio会自动构成组。</p>`
                        wrapMode: MTypography.WordWrap
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

                    Row {
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MRadio {
                        }
                        MRadio {
                        }
                        MRadio {
                            checked: true
                            color: '#00ff00'
                        }
                        MRadio {
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
                            standalone_code.visible = !standalone_code.visible
                        }
                    }
                }

                Rectangle {
                    id: standalone_code
                    visible: false
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    color: "#272c34"
                    radius: 4

                    Column {
                        padding: 20

                        MCopyText {
                            color: Color.white
                            textFormat: TextEdit.RichText
                            text: `
<pre>
Row {
    padding: 20

    MRadio {
    }
    MRadio {
    }
    MRadio {
        checked: true
        color: '#00ff00'
    }
    MRadio {
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
                        width: parent.width-40
                        textFormat: MTypography.RichText
                        text: `<p>你可以用 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >FormControlLabel</span> 组件的 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >labelPlacement</span> 属性来改变标签的位置。</p>`
                        wrapMode: MTypography.WordWrap
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

                    Column {
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MTypography {
                            textColor: "textSecondary"
                            text: "Label Placement"
                        }

                        MRadioGroup {
                            row:true

                            MFormControlLabel {
                                labelPlacement: 'top'
                                value: 'top'
                                label: 'Top'
                                control: MRadio {
                                }
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MFormControlLabel {
                                labelPlacement: 'start'
                                value: 'start'
                                label: 'Start'
                                control: MRadio {
                                }
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MFormControlLabel {
                                labelPlacement: 'bottom'
                                value: 'bottom'
                                label: 'Bottom'
                                control: MRadio {
                                }
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MFormControlLabel {
                                labelPlacement: 'end'
                                value: 'end'
                                label: 'End'
                                control: MRadio {
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

    MTypography {
        textColor: "textSecondary"
        text: "Label Placement"
    }

    MRadioGroup {
        row:true

        MFormControlLabel {
            labelPlacement: 'top'
            value: 'top'
            label: 'Top'
            control: MRadio {
            }
            anchors.verticalCenter: parent.verticalCenter
        }

        MFormControlLabel {
            labelPlacement: 'start'
            value: 'start'
            label: 'Start'
            control: MRadio {
            }
            anchors.verticalCenter: parent.verticalCenter
        }

        MFormControlLabel {
            labelPlacement: 'bottom'
            value: 'bottom'
            label: 'Bottom'
            control: MRadio {
            }
            anchors.verticalCenter: parent.verticalCenter
        }

        MFormControlLabel {
            labelPlacement: 'end'
            value: 'end'
            label: 'End'
            control: MRadio {
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
                            text: "MRadio { }"
                            onClicked: {
                                Route.redirectTo("/api/radio")
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
                            text: "MRadioGroup { }"
                            onClicked: {
                                Route.redirectTo("/api/radiogroup")
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
