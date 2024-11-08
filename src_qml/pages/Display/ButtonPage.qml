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
                        text: "Button 按钮"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "只需轻点按钮，用户就可以触发动作或做出选择。"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="color: ${Palette.secondaryMain}" >按钮</span>传达了一系列用户可以执行的操作命令。他们通常直接放置在您的用户界面中，例如：</p>`
                        wrapMode: MTypography.WordWrap
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

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="color: ${Palette.secondaryMain}" >实心按钮</span>表示高度的强调，你根据它们的立体效果和填充颜色来区分彼此。它们用于触发应用程序所具有的主要功能。</p>`
                        wrapMode: MTypography.WordWrap
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
</pre>
                            `
                        }
                    }
                }

                MTypography {
                    Layout.fillWidth: true
                    Layout.topMargin: 20
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    variant: "body1"
                    textFormat: MTypography.RichText
                    text: `<p>你也可以使用属性 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >disableElevation</span> 属性来消除实心按钮的立体效果。</p>`
                    wrapMode: MTypography.WordWrap
                }

                Rectangle {
                    Layout.topMargin: 20
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
MButton {
    variant: "contained"
    color: "primary"
    disableElevation: true
    text: "Disable elevation"
}
</pre>
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
</pre>
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

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="color: ${Palette.secondaryMain}" >描边按钮</span>表示中等程度的强调。 它们包含了一些重要的操作，但不是一个 app 中的主要操作。</p>`
                        wrapMode: MTypography.WordWrap
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: `你也可以将描边按钮作为比实心按钮次要一点的替代方案或者用来作为比文本按钮重要一点的展示。`
                        wrapMode: MTypography.WordWrap
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
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
</pre>
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
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>所有组件都接受 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >onClicked</span> 处理程序。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
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
MButton {
    text: "请点击我"
    onClicked: {
        toast.success("clicked")
    }
}
</pre>
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
                        width: parent.width-40
                        variant: "body1"
                        text: "MFileButton和MDirectoryButton提供了文件和文件夹选择的功能。"
                        wrapMode: MTypography.WordWrap
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
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
</pre>
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
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>您想要一个大一点或者小一点的按钮吗？ 我们提供了 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >size</span> 这个属性供您调整。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Column {
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        spacing: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Row {
                            spacing: 20

                            MButton {
                                size: "small"
                                text: "Small"
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MButton {
                                size: "medium"
                                text: "Medium"
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MButton {
                                size: "large"
                                text: "Large"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        Row {
                            spacing: 20

                            MButton {
                                variant: "outlined"
                                color: "primary"
                                size: "small"
                                text: "Small"
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MButton {
                                variant: "outlined"
                                color: "primary"
                                size: "medium"
                                text: "Medium"
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MButton {
                                variant: "outlined"
                                color: "primary"
                                size: "large"
                                text: "Large"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }

                        Row {
                            spacing: 20

                            MButton {
                                variant: "contained"
                                color: "primary"
                                size: "small"
                                text: "Small"
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MButton {
                                variant: "contained"
                                color: "primary"
                                size: "medium"
                                text: "Medium"
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            MButton {
                                variant: "contained"
                                color: "primary"
                                size: "large"
                                text: "Large"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
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
    Row {
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
</pre>
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
                        width: parent.width-40
                        variant: "body1"
                        text: `有时您可能希望为某个按钮添加图标以增强应用程序的用户体验，因为我们识别徽标比纯文本更容易。例如，如果您有删除按钮，则可以使用垃圾箱图标对其进行标记。`
                        wrapMode: MTypography.WordWrap
                    }

                    MTypography {
                        width: parent.width-40
                        textColor: "textSecondary"
                        text: "对于MIcon，使用的是FontAwesomeFont，您需要在MaterialUI/Font/IconsName.js中添加图标定义。"
                        wrapMode: MTypography.WordWrap
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Column {
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        spacing: 20
                        anchors.horizontalCenter: parent.horizontalCenter

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
</pre>
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
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>在设置了 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >disabled</span> 的按钮上，鼠标悬浮的指针样式会被禁用。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>除此之外，您可以使用 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >disableCursor</span> 来禁用鼠标悬浮的指针样式。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }

                Rectangle {
                    Layout.topMargin: 20
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    height: childrenRect.height
                    border.width: 1
                    border.color: Color.ddd
                    radius: 4

                    Row {
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        spacing: 20
                        anchors.horizontalCenter: parent.horizontalCenter

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
MButton {
    variant: "contained"
    color: "primary"
    text: "禁用鼠标悬浮"
    disableCursor: true
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
