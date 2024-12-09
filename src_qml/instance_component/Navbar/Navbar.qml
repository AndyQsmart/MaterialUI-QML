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
    width: 260

    property var buttonList: [
        {
            name: "Components 组件",
            subList: [
                {
                    name: "Window 窗口",
                    subList: [
                        {
                            name: "Frameless 无边框窗口",
                            url: "/framelesswindowpage"
                        },
                    ]
                },
                {
                    name: "Inputs 输入框",
                    subList: [
                        {
                            name: "Button 按钮",
                            url: "/buttonpage"
                        },
                        {
                            name: "Button groups 按钮组",
                            url: "/buttongrouppage"
                        },
                        {
                            name: "Checkbox 多选框",
                            url: "/checkboxpage"
                        },
                        {
                            name: "Date/Time 日期/时间选择器",
                            url: "/datetimepickerpage"
                        },
                        {
                            name: "Color 颜色选择器",
                            url: "/colorpickerpage"
                        },
                        {
                            name: "Radio 单选框",
                            url: "/radiopage"
                        },
                        {
                            name: "Select 选择器",
                            url: '/selectpage'
                        },
                        {
                            name: "Slider 滑块",
                            url: '/sliderpage'
                        },
                        {
                            name: "Switch 开关",
                            url: '/switchpage'
                        },
                        {
                            name: "Text Field 文本框",
                            url: '/textfieldpage'
                        },
                    ]
                },
                {
                    name: "Surfaces 表面展示",
                    subList: [
                        {
                            name: "Paper 纸张",
                            url: "/paperpage"
                        }
                    ]
                },
                {
                    name: "Feedback 用户反馈",
                    subList: [
                        {
                            name: "Progress 进度条",
                            url: "/progresspage"
                        }
                    ]
                },
                {
                    name: "Data Display 数据展示",
                    subList: [
                        {
                            name: "Icons 图标",
                            url: "/iconpage"
                        },
                        {
                            name: "FontAwesome Icons 图标",
                            url: "/fontawesomeiconpage"
                        },
                        {
                            name: "Svg Icons 图标",
                            url: "/svgiconpage"
                        }
                    ]
                },
                {
                    name: "Utils 工具包",
                    subList: [
                        {
                            name: "Transitions 过度动画",
                            url: "/transitionspage"
                        }
                    ]
                },
            ],
            open: true
        },
        {
            name: "Component API",
            subList: [
                {
                    name: "Button",
                    url: "/api/button"
                },
                {
                    name: "Button Base",
                    url: "/api/buttonbase"
                },
                {
                    name: "Button Group",
                    url: "/api/buttongroup"
                },
                {
                    name: "Checkbox",
                    url: "/api/checkbox"
                },
                {
                    name: "Circular Progress",
                    url: "/api/circularprogress"
                },
                {
                    name: "Color Picker",
                    url: "/api/colorpicker"
                },
                {
                    name: "Complex Select",
                    url: "/api/complexselect"
                },
                {
                    name: "Date Picker",
                    url: "/api/datepicker"
                },
                {
                    name: "Form Control Label",
                    url: "/api/formcontrollabel"
                },
                {
                    name: "Frameless Window",
                    url: "/api/framelesswindow"
                },
                {
                    name: "Icon",
                    url: "/api/icon"
                },
                {
                    name: "Linear Progress",
                    url: "/api/linearprogress"
                },
                {
                    name: "Paper",
                    url: "/api/paper"
                },
                {
                    name: "Radio",
                    url: "/api/radio"
                },
                {
                    name: "Radio Group",
                    url: "/api/radiogroup"
                },
                {
                    name: "Select",
                    url: "/api/select"
                },
                {
                    name: "Slider",
                    url: "/api/slider"
                },
                {
                    name: "Switch",
                    url: "/api/switch"
                },
                {
                    name: "Text Field",
                    url: "/api/textfield"
                },
                {
                    name: "Time Picker",
                    url: "/api/timepicker"
                },
            ]
        }
    ]

    background: Rectangle {
        color: Color.primary
    }

    MOverflowYBox {
        anchors.fill: parent

        Column {
            width: parent.width
            topPadding: 10
            bottomPadding: 10

            MListItem {
                width: parent.width
                button: true
                color: Color.white

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: parent.leftPadding
                    anchors.rightMargin: parent.rightPadding

                    MTypography {
                        RowLayout.fillWidth: true
                        leftPadding: 0
                        text: qsTr("首页")
                        color: Color.white
                    }
                }

                onClicked: {
                    Route.redirectTo("/")
                }
            }

            Repeater {
                model: buttonList

                Column {
                    width: parent.width
                    property var listData1: modelData

                    MListItem {
                        width: parent.width
                        button: true
                        color: Color.white

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: parent.rightPadding
                            anchors.rightMargin: parent.rightPadding

                            MTypography {
                                RowLayout.fillWidth: true
                                leftPadding: 0
                                text: listData1.name
                                variant: "body2"
                                color: Color.white
                                font.weight: Font.DemiBold
                            }
                        }

                        onClicked: {
                            sub_list_animation.open = !sub_list_animation.open
                        }
                    }

                    ColumnLayout {
                        id: sub_list
                        spacing: 0
                        width: parent.width

                        Component.onCompleted: {
                            if (listData1.open) {
                                sub_list_animation.open = true
                            }
                            else {
                                sub_list_animation.open = false
                            }
                        }

                        MCollapse {
                            id: sub_list_animation
                            open: false
                            target: parent
                        }

                        Repeater {
                            model: listData1.subList

                            ColumnLayout {
                                Layout.fillWidth: true
                                property var listData2: modelData

                                MListItem {
                                    Layout.fillWidth: true
                                    button: true
                                    color: Color.white

                                    RowLayout {
                                        anchors.fill: parent
                                        anchors.leftMargin: parent.rightPadding
                                        anchors.rightMargin: parent.rightPadding

                                        MTypography {
                                            RowLayout.fillWidth: true
                                            leftPadding: 20
                                            text: listData2.name
                                            variant: "body2"
                                            color: Color.white
                                            font.weight: listData2.url ? Font.Normal : Font.DemiBold
                                        }
                                    }

                                    onClicked: {
                                        if (listData2.url) {
                                            Route.redirectTo(listData2.url)
                                        }
                                    }
                                }

                                Repeater {
                                    model: listData2.subList

                                    MListItem {
                                        Layout.fillWidth: true
                                        button: true
                                        color: Color.white

                                        RowLayout {
                                            anchors.fill: parent
                                            anchors.leftMargin: parent.rightPadding
                                            anchors.rightMargin: parent.rightPadding

                                            MTypography {
                                                RowLayout.fillWidth: true
                                                leftPadding: 40
                                                text: modelData.name
                                                variant: "body2"
                                                color: Color.white
                                            }
                                        }

                                        onClicked: {
                                            Route.redirectTo(modelData.url)
                                        }
                                    }
                                }
                            }
                        }
                    }

                }
            }

            MListItem {
                width: parent.width
                button: true
                color: Color.white

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: parent.leftPadding
                    anchors.rightMargin: parent.rightPadding

                    MTypography {
                        RowLayout.fillWidth: true
                        leftPadding: 0
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
    }
}
