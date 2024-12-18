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
                        text: "Button groups 按钮组组件"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "按钮组组件可用于对相关按钮进行分组。"
                    }
                }

                // **********Basic button group 基本的按钮组

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Basic button group 基本的按钮组"
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

                    Column {
                        width: parent.width
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20

                        MButtonGroup {
                            anchors.horizontalCenter: parent.horizontalCenter
                            buttonColor: 'primary'

                            MButton {
                                text: 'ONE'
                            }

                            MButton {
                                text: 'TWO'
                            }

                            MButton {
                                text: 'THREE'
                            }
                        }

                        MButtonGroup {
                            anchors.horizontalCenter: parent.horizontalCenter
                            variant: 'contained'
                            buttonColor: 'primary'

                            MButton {
                                text: 'ONE'
                            }

                            MButton {
                                text: 'TWO'
                            }

                            MButton {
                                text: 'THREE'
                            }
                        }

                        MButtonGroup {
                            anchors.horizontalCenter: parent.horizontalCenter
                            variant: 'text'
                            buttonColor: 'primary'

                            MButton {
                                text: 'ONE'
                            }

                            MButton {
                                text: 'TWO'
                            }

                            MButton {
                                text: 'THREE'
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
                            button_group_code.visible = !button_group_code.visible
                        }
                    }
                }

                Rectangle {
                    id: button_group_code
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
MButtonGroup {
    buttonColor: 'primary'

    MButton { text: 'ONE' }
    MButton { text: 'TWO' }
    MButton { text: 'THREE' }
}

MButtonGroup {
    variant: 'contained'
    buttonColor: 'primary'

    MButton { text: 'ONE' }
    MButton { text: 'TWO' }
    MButton { text: 'THREE' }
}

MButtonGroup {
    variant: 'text'
    buttonColor: 'primary'

    MButton { text: 'ONE' }
    MButton { text: 'TWO' }
    MButton { text: 'THREE' }
}
</pre>
                            `
                        }
                    }
                }

                // **********大小和颜色

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "大小和颜色"
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

                    Column {
                        width: parent.width
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20

                        MButtonGroup {
                            anchors.horizontalCenter: parent.horizontalCenter
                            size: 'small'

                            MButton {
                                text: 'ONE'
                            }

                            MButton {
                                text: 'TWO'
                            }

                            MButton {
                                text: 'THREE'
                            }
                        }

                        MButtonGroup {
                            anchors.horizontalCenter: parent.horizontalCenter
                            buttonColor: 'secondary'

                            MButton {
                                text: 'ONE'
                            }

                            MButton {
                                text: 'TWO'
                            }

                            MButton {
                                text: 'THREE'
                            }
                        }

                        MButtonGroup {
                            anchors.horizontalCenter: parent.horizontalCenter
                            size: 'large'
                            buttonColor: 'primary'

                            MButton {
                                text: 'ONE'
                            }

                            MButton {
                                text: 'TWO'
                            }

                            MButton {
                                text: 'THREE'
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
                            color_size_code.visible = !color_size_code.visible
                        }
                    }
                }

                Rectangle {
                    id: color_size_code
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
MButtonGroup {
    size: 'small'

    MButton { text: 'ONE' }
    MButton { text: 'TWO' }
    MButton { text: 'THREE' }
}

MButtonGroup {
    buttonColor: 'secondary'

    MButton { text: 'ONE' }
    MButton { text: 'TWO' }
    MButton { text: 'THREE' }
}

MButtonGroup {
    size: 'large'
    buttonColor: 'primary'

    MButton { text: 'ONE' }
    MButton { text: 'TWO' }
    MButton { text: 'THREE' }
}
</pre>
                            `
                        }
                    }
                }

                // **********Vertical group 垂直组

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Vertical group 垂直组"
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
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MButtonGroup {
                            orientation: "vertical"
                            buttonColor: 'primary'

                            MButton {
                                text: 'ONE'
                            }

                            MButton {
                                text: 'TWO'
                            }

                            MButton {
                                text: 'THREE'
                            }
                        }

                        MButtonGroup {
                            orientation: "vertical"
                            variant: 'contained'
                            buttonColor: 'primary'

                            MButton {
                                text: 'ONE'
                            }

                            MButton {
                                text: 'TWO'
                            }

                            MButton {
                                text: 'THREE'
                            }
                        }

                        MButtonGroup {
                            orientation: "vertical"
                            variant: 'text'
                            buttonColor: 'primary'

                            MButton {
                                text: 'ONE'
                            }

                            MButton {
                                text: 'TWO'
                            }

                            MButton {
                                text: 'THREE'
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
                            vertical_group_code.visible = !vertical_group_code.visible
                        }
                    }
                }

                Rectangle {
                    id: vertical_group_code
                    visible: false
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
MButtonGroup {
    orientation: "vertical"
    buttonColor: 'primary'

    MButton { text: 'ONE' }
    MButton { text: 'TWO' }
    MButton { text: 'THREE' }
}

MButtonGroup {
    orientation: "vertical"
    variant: 'contained'
    buttonColor: 'primary'

    MButton { text: 'ONE' }
    MButton { text: 'TWO' }
    MButton { text: 'THREE' }
}

MButtonGroup {
    orientation: "vertical"
    variant: 'text'
    buttonColor: 'primary'

    MButton { text: 'ONE' }
    MButton { text: 'TWO' }
    MButton { text: 'THREE' }
}
</pre>
                            `
                        }
                    }
                }

                // **********Split button 分体式按钮

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Split button 分体式按钮"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >按钮组组件</span> 也可用于创建分体式按钮。 下拉列表可以用于更改按钮相关的操作（如本例所示），或者用于立即触发一个相关的操作。</p>`
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

                    Row {
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MButtonGroup {
                            variant: 'contained'
                            buttonColor: 'primary'

                            MButton {
                                id: buttonGroupName
                                text: 'Create a merge commit'
                            }

                            MButton {
                                width: 44
                                implicitWidth: 44

                                MIcon {
                                    name: 'caret-down'
                                    color: parent.textColor
                                    size: parent.fontSize
                                    anchors.centerIn: parent
                                }

                                onClicked: {
                                    buttonGroupMenu.anchorEl = parent
                                    buttonGroupMenu.open()
                                }
                            }
                        }

                        MMenu {
                            id: buttonGroupMenu
                            topPadding: 0
                            bottomPadding: 0
                            anchorOrigin: Item.Bottom
                            transformOrigin: Item.Top

                            Repeater {
                                model: ['Create a merge commit', 'Squash and merge', 'Rebase and merge']

                                delegate: MMenuItem {
                                    text: modelData
                                    disabled: index === 2

                                    onClicked: {
                                        buttonGroupName.text = modelData
                                        buttonGroupMenu.close()
                                    }
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
                            split_button_code.visible = !split_button_code.visible
                        }
                    }
                }

                Rectangle {
                    id: split_button_code
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
    MButtonGroup {
        variant: 'contained'
        buttonColor: 'primary'

        MButton {
            id: buttonGroupName
            text: 'Create a merge commit'
        }

        MButton {
            width: 44
            implicitWidth: 44

            MIcon {
                name: 'caret-down'
                color: parent.textColor
                size: parent.fontSize
                anchors.centerIn: parent
            }

            onClicked: {
                buttonGroupMenu.anchorEl = parent
                buttonGroupMenu.open()
            }
        }
    }

    MMenu {
        id: buttonGroupMenu
        anchorOrigin: Item.Bottom
        transformOrigin: Item.Top

        Repeater {
            model: ['Create a merge commit', 'Squash and merge', 'Rebase and merge']

            delegate: MMenuItem {
                Layout.fillWidth: true
                text: modelData
                disabled: index === 2

                onClicked: {
                    buttonGroupName.text = modelData
                    buttonGroupMenu.close()
                }
            }
        }
    }
}
</pre>
`
                        }
                    }
                }

                // **********Disabled elevation 禁用立体效果（elevation）

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "Disabled elevation 禁用立体效果（elevation）"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"                        
                        textFormat: MTypography.RichText
                        text: `<p>你也可以使用属性 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >disableElevation</span> 属性来消除实心按钮的立体效果。</p>`
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

                    Row {
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MButtonGroup {
                            disableElevation: true
                            variant: 'contained'
                            buttonColor: 'primary'

                            MButton {
                                text: "One"
                            }

                            MButton {
                                text: "Two"
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
                            disabled_elevation_code.visible = !disabled_elevation_code.visible
                        }
                    }
                }

                Rectangle {
                    id: disabled_elevation_code
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
MButtonGroup {
    disableElevation: true
    variant: 'contained'
    buttonColor: 'primary'

    MButton {
        text: "One"
    }

    MButton {
        text: "Two"
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
                            text: "MButtonGroup { }"
                            onClicked: {
                                Route.redirectTo("/api/buttongroup")
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
