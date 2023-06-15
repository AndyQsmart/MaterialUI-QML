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
                        variant: "h4"
                        text: "Button 按钮"
                    }

                    MTypography {
                        variant: "h5"
                        text: "只需轻点按钮，用户就可以触发动作或做出选择。"
                        gutterBottom: true
                    }

                    Row {
                        MTypography {
                            variant: "body1"
                            textColor: "secondary"
                            text: "按钮"
                        }

                        MTypography {
                            variant: "body1"
                            text: "传达了一系列用户可以执行的操作命令。 他们通常直接放置在您的用户界面中，例如："
                            gutterBottom: true
                        }
                    }

                    MTypography {
                        variant: "body1"
                        text: "○ Dialogs 对话框"
                    }
                    MTypography {
                        variant: "body1"
                        text: "○ Modal windows 模态窗口"
                    }
                    MTypography {
                        variant: "body1"
                        text: "○ Forms 表单"
                    }
                    MTypography {
                        variant: "body1"
                        text: "○ Cards 卡片"
                    }
                    MTypography {
                        variant: "body1"
                        text: "○ Toolbars 工具栏"
                    }
                }

                // **********Contained Buttons 实心按钮

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Contained Buttons 实心按钮"
                    }

                    Row {
                        MTypography {
                            variant: "body1"
                            textColor: "secondary"
                            text: "实心按钮 "
                        }

                        MTypography {
                            variant: "body1"
                            text: "表示高度的强调，你根据它们的立体效果和填充颜色来区分彼此。"
                            gutterBottom: true
                        }
                    }
                    MTypography {
                        variant: "body1"
                        text: "它们用于触发应用程序所具有的主要功能。"
                        gutterBottom: true
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: contained_button_display.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        id: contained_button_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20

                        MButton {
                            variant: "contained"
                            text: "DEFAULT"
                        }

                        MButton {
                            variant: "contained"
                            color: "primary"
                            text: "PRIMARY"
                        }

                        MButton {
                            variant: "contained"
                            color: "secondary"
                            text: "SECONDARY"
                        }

                        MButton {
                            variant: "contained"
                            disabled: true
                            text: "DISABLED"
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: Color.black
                    height: contained_button_code.height
                    radius: 4


                    Column {
                        id: contained_button_code
                        Layout.fillWidth: true
                        leftPadding: 20
                        rightPadding: 20

                        MCopyText {
                            color: Color.white
                            text: `
MButton {
    variant: "contained"
    text: "DEFAULT"
}

MButton {
    variant: "contained"
    color: "primary"
    text: "PRIMARY"
}

MButton {
    variant: "contained"
    color: "secondary"
    text: "SECONDARY"
}

MButton {
    variant: "contained"
    disabled: true
    text: "DISABLED"
}
                            `
                        }
                    }
                }

                MTypography {
                    Layout.topMargin: 20
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    variant: "body1"
                    text: "你也可以使用属性 disableElevation 属性来消除实心按钮的立体效果。"
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: contained_button_disableElevation_display.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        id: contained_button_disableElevation_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20

                        MButton {
                            variant: "contained"
                            color: "primary"
                            disableElevation: true
                            text: "Disable elevation"
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: Color.black
                    height: contained_button_disableElevation_code.height
                    radius: 4


                    Column {
                        id: contained_button_disableElevation_code
                        Layout.fillWidth: true
                        leftPadding: 20
                        rightPadding: 20

                        MCopyText {
                            color: Color.white
                            text: `
MButton {
    variant: "contained"
    color: "primary"
    disableElevation: true
    text: "Disable elevation"
}
                            `
                        }
                    }
                }

                // **********Text Buttons 文本按钮

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Text Buttons 文本按钮"
                    }

                    Row {
                        MTypography {
                            variant: "body1"
                            textColor: "secondary"
                            text: "文本按钮 "
                        }

                        MTypography {
                            variant: "body1"
                            text: "通常用于不太明显的操作，包括那些存在于："
                            gutterBottom: true
                        }
                    }

                    MTypography {
                        variant: "body1"
                        text: "○ 在 dialogs 对话框中的"
                    }
                    MTypography {
                        variant: "body1"
                        text: "○ 在 cards 卡片中的"
                    }
                }

                MTypography {
                    Layout.topMargin: 20
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    variant: "body1"
                    text: "在卡片中，文本按钮有助于强调卡片的内容。"
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: text_button_display.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        id: text_button_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20

                        MButton {
                            text: "DEFAULT"
                        }

                        MButton {
                            color: "primary"
                            text: "PRIMARY"
                        }

                        MButton {
                            color: "secondary"
                            text: "SECONDARY"
                        }

                        MButton {
                            disabled: true
                            text: "DISABLED"
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: Color.black
                    height: text_button_code.height
                    radius: 4

                    Column {
                        id: text_button_code
                        Layout.fillWidth: true
                        leftPadding: 20
                        rightPadding: 20

                        MCopyText {
                            color: Color.white
                            text: `
MButton {
    text: "DEFAULT"
}

MButton {
    color: "primary"
    text: "PRIMARY"
}

MButton {
    color: "secondary"
    text: "SECONDARY"
}

MButton {
    disabled: true
    text: "DISABLED"
}
                            `
                        }
                    }
                }

                // **********Outlined Buttons 描边按钮

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Outlined Buttons 描边按钮"
                    }

                    Row {
                        MTypography {
                            variant: "body1"
                            textColor: "secondary"
                            text: "描边按钮 "
                        }

                        MTypography {
                            variant: "body1"
                            text: "表示中等程度的强调。 它们包含了一些重要的操作，"
                        }
                    }
                    MTypography {
                        variant: "body1"
                        text: "但不是一个 app 中的主要操作。"
                    }

                    MTypography {
                        variant: "body1"
                        text: "你也可以将描边按钮作为比实心按钮次要一点的替代方案，"
                    }
                    MTypography {
                        variant: "body1"
                        text: "或者用来作为比文本按钮重要一点的展示。"
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: outlined_button_display.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        id: outlined_button_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20

                        MButton {
                            variant: "outlined"
                            text: "DEFAULT"
                        }

                        MButton {
                            variant: "outlined"
                            color: "primary"
                            text: "PRIMARY"
                        }

                        MButton {
                            variant: "outlined"
                            color: "secondary"
                            text: "SECONDARY"
                        }

                        MButton {
                            variant: "outlined"
                            disabled: true
                            text: "DISABLED"
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: Color.black
                    height: outlined_button_code.height
                    radius: 4

                    Column {
                        id: outlined_button_code
                        Layout.fillWidth: true
                        leftPadding: 20
                        rightPadding: 20

                        MCopyText {
                            color: Color.white
                            text: `
MButton {
    variant: "outlined"
    text: "DEFAULT"
}

MButton {
    variant: "outlined"
    color: "primary"
    text: "PRIMARY"
}

MButton {
    variant: "outlined"
    color: "secondary"
    text: "SECONDARY"
}

MButton {
    variant: "outlined"
    disabled: true
    text: "DISABLED"
}
                            `
                        }
                    }
                }

                // **********Handling clicks 处理点击

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Handling clicks 处理点击"
                    }

                    MTypography {
                        variant: "body1"
                        text: "所有组件都接受 onClick 处理程序，该处理程序被应用到根 DOM 元素中。"
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: handing_clicks_button_display.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        id: handing_clicks_button_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20

                        MButton {
                            text: "请点击我"
                            onClicked: {
                                toast.success("clicked")
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: Color.black
                    height: handing_clicks_button_code.height
                    radius: 4

                    Column {
                        id: handing_clicks_button_code
                        Layout.fillWidth: true
                        leftPadding: 20
                        rightPadding: 20

                        MCopyText {
                            color: Color.white
                            text: `
MButton {
    text: "请点击我"
    onClicked: {
        toast.success("clicked")
    }
}
                            `
                        }
                    }
                }

                // **********Upload button 上传按钮

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Upload button 上传按钮"
                    }

                    MTypography {
                        variant: "body1"
                        text: "MFileButton和MDirectoryButton提供了文件和文件夹选择的功能。"
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: upload_button_display.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        id: upload_button_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20

                        MFileButton {
                            title: "视频选择器"
                            variant: "contained"
                            color: "primary"
                            text: "视频选择"
                            accept: "video"
                            acceptAll: false
                            onChange: {
                                toast.success(JSON.stringify(fileUrls))
                            }
                        }

                        MFileButton {
                            title: "xlsx选择器"
                            variant: "contained"
                            color: "primary"
                            text: "自定义xlsx选择"
                            multiple: true
                            acceptName: "xlsx选择"
                            acceptExt: "*.xlsx"
                            acceptAll: false
                            onChange: {
                                toast.success(JSON.stringify(fileUrls))
                            }
                        }

                        MDirectoryButton {
                            title: "文件夹选择器"
                            variant: "contained"
                            color: "primary"
                            text: "文件夹选择"
                            onChange: {
                                toast.success(JSON.stringify(url))
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: Color.black
                    height: upload_button_code.height
                    radius: 4

                    Column {
                        id: upload_button_code
                        Layout.fillWidth: true
                        leftPadding: 20
                        rightPadding: 20

                        MCopyText {
                            color: Color.white
                            text: `
MFileButton {
    title: "视频选择器"
    variant: "contained"
    color: "primary"
    text: "视频选择"
    accept: "video"
    acceptAll: false
    onChange: {
        toast.success(JSON.stringify(fileUrls))
    }
}

MFileButton {
    title: "xlsx选择器"
    variant: "contained"
    color: "primary"
    text: "自定义xlsx选择"
    multiple: true
    acceptName: "xlsx选择"
    acceptExt: "*.xlsx"
    acceptAll: false
    onChange: {
        toast.success(JSON.stringify(fileUrls))
    }
}

MDirectoryButton {
    title: "文件夹选择器"
    variant: "contained"
    color: "primary"
    text: "文件夹选择"
    onChange: {
        toast.success(JSON.stringify(url))
    }
}
                            `
                        }
                    }
                }

                // **********尺寸

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "尺寸"
                    }

                    MTypography {
                        variant: "body1"
                        text: "您想要一个大一点或者小一点的按钮吗？ 我们提供了 size 这个属性供您调整。"
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: size_button_display.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Column {
                        id: size_button_display
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        spacing: 20

                        Row {
                            spacing: 20

                            MButton {
                                size: "small"
                                text: "Small"
                            }

                            MButton {
                                size: "medium"
                                text: "Medium"
                            }

                            MButton {
                                size: "large"
                                text: "Large"
                            }
                        }

                        Row {
                            spacing: 20

                            MButton {
                                variant: "outlined"
                                color: "primary"
                                size: "small"
                                text: "Small"
                            }

                            MButton {
                                variant: "outlined"
                                color: "primary"
                                size: "medium"
                                text: "Medium"
                            }

                            MButton {
                                variant: "outlined"
                                color: "primary"
                                size: "large"
                                text: "Large"
                            }
                        }

                        Row {
                            spacing: 20

                            MButton {
                                variant: "contained"
                                color: "primary"
                                size: "small"
                                text: "Small"
                            }

                            MButton {
                                variant: "contained"
                                color: "primary"
                                size: "medium"
                                text: "Medium"
                            }

                            MButton {
                                variant: "contained"
                                color: "primary"
                                size: "large"
                                text: "Large"
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: Color.black
                    height: size_button_code.height
                    radius: 4

                    Column {
                        id: size_button_code
                        Layout.fillWidth: true
                        leftPadding: 20
                        rightPadding: 20

                        MCopyText {
                            color: Color.white
                            text: `
MFileButton {
    title: "视频选择器"
    variant: "contained"
    color: "primary"
    text: "视频选择"
    accept: "video"
    acceptAll: false
    onChange: {
        toast.success(JSON.stringify(fileUrls))
    }
}

MFileButton {
    title: "xlsx选择器"
    variant: "contained"
    color: "primary"
    text: "自定义xlsx选择"
    multiple: true
    acceptName: "xlsx选择"
    acceptExt: "*.xlsx"
    acceptAll: false
    onChange: {
        toast.success(JSON.stringify(fileUrls))
    }
}

MDirectoryButton {
    title: "文件夹选择器"
    variant: "contained"
    color: "primary"
    text: "文件夹选择"
    onChange: {
        toast.success(JSON.stringify(url))
    }
}
                            `
                        }
                    }
                }

                // **********带有icons（图标）和 label（标签）的按钮

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "带有icons（图标）和 label（标签）的按钮"
                    }

                    MTypography {
                        variant: "body1"
                        text: "有时您可能希望为某个按钮添加图标以增强应用程序的用户体验，"
                    }
                    MTypography {
                        variant: "body1"
                        text: "因为我们识别徽标比纯文本更容易。"
                    }
                    MTypography {
                        variant: "body1"
                        text: "例如，如果您有删除按钮，则可以使用垃圾箱图标对其进行标记。"
                    }
                    MTypography {
                        textColor: "textSecondary"
                        text: "对于MIcon，使用的是FontAwesomeFont，您需要在MaterialUI/Font/IconsName.js中添加图标定义。"
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: icon_button_display.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Column {
                        id: icon_button_display
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        spacing: 20

                        Row {
                            spacing: 20

                            MButton {
                                variant: "contained"
                                color: "secondary"
                                contentItem: RowLayout {
                                    MIcon {
                                        name: "trash"
                                        color: "#ffffff"
                                        size: 14
                                    }
                                    MTypography {
                                        variant: "button"
                                        color: "#ffffff"
                                        text: " Delete"
                                    }
                                }
                            }

                            MButton {
                                variant: "contained"
                                color: "primary"
                                contentItem: RowLayout {
                                    MTypography {
                                        variant: "button"
                                        color: "#ffffff"
                                        text: "Send "
                                    }
                                    MIcon {
                                        name: "send"
                                        color: "#ffffff"
                                        size: 14
                                    }
                                }
                            }

                            MButton {
                                variant: "contained"
                                contentItem: RowLayout {
                                    MIcon {
                                        name: "cloud-upload"
                                        size: 14
                                    }
                                    MTypography {
                                        variant: "button"
                                        text: " Upload"
                                    }
                                }
                            }

                            MButton {
                                variant: "contained"
                                disabled: true
                                contentItem: RowLayout {
                                    MIcon {
                                        name: "microphone"
                                        color: Palette.lightActionDisabled
                                        size: 14
                                    }
                                    MTypography {
                                        variant: "button"
                                        color: Palette.lightActionDisabled
                                        text: " Talk"
                                    }
                                }
                            }

                            MButton {
                                variant: "contained"
                                color: "primary"
                                contentItem: RowLayout {
                                    MIcon {
                                        name: "save"
                                        color: "#ffffff"
                                        size: 14
                                    }
                                    MTypography {
                                        variant: "button"
                                        color: "#ffffff"
                                        text: " Save"
                                    }
                                }
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: Color.black
                    height: icon_button_code.height
                    radius: 4

                    Column {
                        id: icon_button_code
                        Layout.fillWidth: true
                        leftPadding: 20
                        rightPadding: 20

                        MCopyText {
                            color: Color.white
                            text: `
MButton {
    variant: "contained"
    color: "secondary"
    contentItem: RowLayout {
        MIcon {
            name: "trash"
            color: "#ffffff"
            size: 14
        }
        MTypography {
            variant: "button"
            color: "#ffffff"
            text: " Delete"
        }
    }
}

MButton {
    variant: "contained"
    color: "primary"
    contentItem: RowLayout {
        MTypography {
            variant: "button"
            color: "#ffffff"
            text: "Send "
        }
        MIcon {
            name: "send"
            color: "#ffffff"
            size: 14
        }
    }
}

MButton {
    variant: "contained"
    contentItem: RowLayout {
        MIcon {
            name: "cloud-upload"
            size: 14
        }
        MTypography {
            variant: "button"
            text: " Upload"
        }
    }
}

MButton {
    variant: "contained"
    disabled: true
    contentItem: RowLayout {
        MIcon {
            name: "microphone"
            color: Palette.lightActionDisabled
            size: 14
        }
        MTypography {
            variant: "button"
            color: Palette.lightActionDisabled
            text: " Talk"
        }
    }
}

MButton {
    variant: "contained"
    color: "primary"
    contentItem: RowLayout {
        MIcon {
            name: "save"
            color: "#ffffff"
            size: 14
        }
        MTypography {
            variant: "button"
            color: "#ffffff"
            text: " Save"
        }
    }
}
                            `
                        }
                    }
                }

                // Cursor 鼠标悬浮的禁用

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Cursor 鼠标悬浮的禁用"
                    }

                    MTypography {
                        variant: "body1"
                        text: "在设置了disabled的按钮上，鼠标悬浮的指针样式会被禁用。"
                    }
                    MTypography {
                        variant: "body1"
                        text: "除此之外，您可以使用disableCursor来禁用鼠标悬浮的指针样式。"
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: cursor_button_display.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        id: cursor_button_display
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        spacing: 20

                        MButton {
                            variant: "contained"
                            color: "primary"
                            text: "禁用鼠标悬浮"
                            disableCursor: true
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    color: Color.black
                    height: cursor_button_code.height
                    radius: 4

                    Column {
                        id: cursor_button_code
                        Layout.fillWidth: true
                        leftPadding: 20
                        rightPadding: 20

                        MCopyText {
                            color: Color.white
                            text: `
MButton {
    variant: "contained"
    color: "primary"
    text: "禁用鼠标悬浮"
    disableCursor: true
}
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
                            text: "MButton { }"
                            onClicked: {
                                Route.redirectTo("/api/button")
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
                            text: "MButtonBase { }"
                            onClicked: {
                                Route.redirectTo("/api/buttonbase")
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

    MToast {
        id: toast
    }
}
