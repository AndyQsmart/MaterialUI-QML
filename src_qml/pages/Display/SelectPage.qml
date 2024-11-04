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
                        width: parent.width+40
                        variant: "body1"
                        text: "我们通常将菜单（Menus）放置在其所点击的元素上，这样的话能够确保当前选定的菜单项显示在点击的元素之上。"
                        wrapMode: Text.WordWrap
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
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MSimpleSelectInput {
                            model: ['test1', 'test2', 'test3']

                            onChange: {
                                console.log(value, index)
                            }
                        }


                    }
                }
            }
        }
    }
}
