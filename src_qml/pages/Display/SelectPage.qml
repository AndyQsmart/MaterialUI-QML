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
                        text: "Select 选择器"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "选择器组件能从一个选项列表中去获得用户所提供的信息。"
                        gutterBottom: true
                    }
                }



                // **********简单的选择器

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "简单的选择器"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "我们通常将菜单（Menus）放置在其所点击的元素上，这样的话能够确保当前选定的菜单项显示在点击的元素之上。"
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
                        anchors.horizontalCenter: parent.horizontalCenter

                        MSelect {
                            placeholder: "Age"
                            model: ['Ten', 'Twenty', 'Thirty']
                            minWidth: 120

                            onChange: {
                                console.log(value, index)
                            }
                        }

                        MSelect {
                            selectColor: "secondary"
                            placeholder: "Age"
                            model: ['Ten', 'Twenty', 'Thirty']
                            minWidth: 120
                        }

                        MSelect {
                            disabled: true
                            placeholder: "Age"
                            value: "Twenty"
                            model: ['Ten', 'Twenty', 'Thirty']
                            minWidth: 120
                        }

                        MSelect {
                            variant: 'outlined'
                            placeholder: "Age"
                            model: ['Ten', 'Twenty', 'Thirty']
                            minWidth: 120
                        }

                        MSelect {
                            variant: 'filled'
                            placeholder: "Age"
                            model: ['Ten', 'Twenty', 'Thirty']
                            minWidth: 120
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
                            simple_select_code.visible = !simple_select_code.visible
                        }
                    }
                }

                Rectangle {
                    id: simple_select_code
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
MSelect {
    placeholder: "Age"
    model: ['Ten', 'Twenty', 'Thirty']
    minWidth: 120

    onChange: {
        console.log(value, index)
    }
}

MSelect {
    selectColor: "secondary"
    placeholder: "Age"
    model: ['Ten', 'Twenty', 'Thirty']
    minWidth: 120
}

MSelect {
    disabled: true
    placeholder: "Age"
    value: "Twenty"
    model: ['Ten', 'Twenty', 'Thirty']
    minWidth: 120
}

MSelect {
    variant: 'outlined'
    placeholder: "Age"
    model: ['Ten', 'Twenty', 'Thirty']
    minWidth: 120
}

MSelect {
    variant: 'filled'
    placeholder: "Age"
    model: ['Ten', 'Twenty', 'Thirty']
    minWidth: 120
}
</pre>
`
                        }
                    }
                }



                // **********大小

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "大小"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>想要使用外观看起来比较小的选择器吗？ 你可以使用 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >size</span> 属性。</p>`
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

                        Column {
                            spacing: 20

                            MSelect {
                                size: "small"
                                placeholder: "Age"
                                model: ['Ten', 'Twenty', 'Thirty']
                                minWidth: 120
                            }

                            MSelect {
                                size: "small"
                                variant: 'outlined'
                                placeholder: "Age"
                                model: ['Ten', 'Twenty', 'Thirty']
                                minWidth: 120
                            }

                            MSelect {
                                size: "small"
                                variant: 'filled'
                                placeholder: "Age"
                                model: ['Ten', 'Twenty', 'Thirty']
                                minWidth: 120
                            }
                        }

                        Column {
                            spacing: 20

                            MSelect {
                                placeholder: "Age"
                                model: ['Ten', 'Twenty', 'Thirty']
                                minWidth: 120
                            }

                            MSelect {
                                variant: 'outlined'
                                placeholder: "Age"
                                model: ['Ten', 'Twenty', 'Thirty']
                                minWidth: 120
                            }

                            MSelect {
                                variant: 'filled'
                                placeholder: "Age"
                                model: ['Ten', 'Twenty', 'Thirty']
                                minWidth: 120
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
                            size_code.visible = !size_code.visible
                        }
                    }
                }

                Rectangle {
                    id: size_code
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

    Column {
        spacing: 20

        MSelect {
            size: "small"
            placeholder: "Age"
            model: ['Ten', 'Twenty', 'Thirty']
            minWidth: 120
        }

        MSelect {
            size: "small"
            variant: 'outlined'
            placeholder: "Age"
            model: ['Ten', 'Twenty', 'Thirty']
            minWidth: 120
        }

        MSelect {
            size: "small"
            variant: 'filled'
            placeholder: "Age"
            model: ['Ten', 'Twenty', 'Thirty']
            minWidth: 120
        }
    }

    Column {
        spacing: 20

        MSelect {
            placeholder: "Age"
            model: ['Ten', 'Twenty', 'Thirty']
            minWidth: 120
        }

        MSelect {
            variant: 'outlined'
            placeholder: "Age"
            model: ['Ten', 'Twenty', 'Thirty']
            minWidth: 120
        }

        MSelect {
            variant: 'filled'
            placeholder: "Age"
            model: ['Ten', 'Twenty', 'Thirty']
            minWidth: 120
        }
    }
}
</pre>
`
                        }
                    }
                }


                // **********Complex Select 复杂的选择器

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Complex Select 复杂的选择器"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "为提高可自定义度，我们支持对Select项目进行自定义渲染，而非仅文本展示。"
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
                        anchors.horizontalCenter: parent.horizontalCenter

                        MComplexSelect {
                            placeholder: "Age"
                            minWidth: 120

                            Repeater {
                                model: ['Ten', 'Twenty', 'Thirty']
                                delegate: MMenuItem {
                                    property string value: modelData
                                    property string label: `Select: ${modelData}`
                                    contentItem: Row {
                                        spacing: 10

                                        MIcon {
                                            color: "#2196f3"
                                            size: 16
                                            name: 'angle-right'
                                            anchors.verticalCenter: parent.verticalCenter
                                        }

                                        MTypography {
                                            variant: 'body1'
                                            text: modelData
                                        }
                                    }
                                }
                            }

                            onChange: {
                                console.log(value, index)
                            }
                        }

                        MComplexSelect {
                            selectColor: 'secondary'
                            placeholder: "Age"
                            minWidth: 120

                            Repeater {
                                model: ['Ten', 'Twenty', 'Thirty']
                                delegate: MMenuItem {
                                    property string value: modelData
                                    property string label: `Select: ${modelData}`
                                    contentItem: Row {
                                        spacing: 10

                                        MIcon {
                                            color: "#2196f3"
                                            size: 16
                                            name: 'angle-right'
                                            anchors.verticalCenter: parent.verticalCenter
                                        }

                                        MTypography {
                                            variant: 'body1'
                                            text: modelData
                                        }
                                    }
                                }
                            }
                        }

                        MComplexSelect {
                            disabled: true
                            value: "Ten"
                            label: "Select Ten"
                            selectColor: 'secondary'
                            placeholder: "Age"
                            minWidth: 120

                            Repeater {
                                model: ['Ten', 'Twenty', 'Thirty']
                                delegate: MMenuItem {
                                    property string value: modelData
                                    property string label: `Select: ${modelData}`
                                    contentItem: Row {
                                        spacing: 10

                                        MIcon {
                                            color: "#2196f3"
                                            size: 16
                                            name: 'angle-right'
                                            anchors.verticalCenter: parent.verticalCenter
                                        }

                                        MTypography {
                                            variant: 'body1'
                                            text: modelData
                                        }
                                    }
                                }
                            }
                        }

                        MComplexSelect {
                            variant: "outlined"
                            placeholder: "Age"
                            minWidth: 120

                            Repeater {
                                model: ['Ten', 'Twenty', 'Thirty']
                                delegate: MMenuItem {
                                    property string value: modelData
                                    property string label: `Select: ${modelData}`
                                    contentItem: Row {
                                        spacing: 10

                                        MIcon {
                                            color: "#2196f3"
                                            size: 16
                                            name: 'angle-right'
                                            anchors.verticalCenter: parent.verticalCenter
                                        }

                                        MTypography {
                                            variant: 'body1'
                                            text: modelData
                                        }
                                    }
                                }
                            }
                        }

                        MComplexSelect {
                            variant: "filled"
                            placeholder: "Age"
                            minWidth: 120

                            Repeater {
                                model: ['Ten', 'Twenty', 'Thirty']
                                delegate: MMenuItem {
                                    property string value: modelData
                                    property string label: `Select: ${modelData}`
                                    contentItem: Row {
                                        spacing: 10

                                        MIcon {
                                            color: "#2196f3"
                                            size: 16
                                            name: 'angle-right'
                                            anchors.verticalCenter: parent.verticalCenter
                                        }

                                        MTypography {
                                            variant: 'body1'
                                            text: modelData
                                        }
                                    }
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
                            text: "MComplexSelect { }"
                            onClicked: {
                                Route.redirectTo("/api/complexselect")
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
                            text: "MSelect { }"
                            onClicked: {
                                Route.redirectTo("/api/select")
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
