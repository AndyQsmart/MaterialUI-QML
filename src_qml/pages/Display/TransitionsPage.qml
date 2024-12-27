import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
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
                        text: "Transitions 过渡动画"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "过渡动画使 UI 更富有表现力并且易于使用。"
                    }
                }

                // **********Transistions

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>Material-QML 提供了一系列的过渡效果，你可以将一些基本的<span style="color: ${MPalette.secondaryMain}" >动作</span>添加到你的应用的组件中。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }

                // Collapse 折叠

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "Collapse 折叠"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>从子元素的顶部垂直扩展开来。 使用 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >collapsedSize</span> 属性可以用于设置未扩展时的最小高度值。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    Layout.topMargin: 10
                    height: childrenRect.height
                    color: "#f5f5f5"

                    Column {
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Row {
                            MSwitch {
                                id: collapse_check
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MTypography {
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Show"
                            }
                        }

                        Row {
                            topPadding: -20

                            Column {
                                width: 148
                                height: 148

                                Row {
                                    padding: 10

                                    MPaper {
                                        width: 128
                                        height: 128
                                    }
                                    MCollapse {
                                        target: parent
                                        open: collapse_check.checked
                                    }
                                }
                            }

                            Column {
                                width: 148
                                height: 148

                                Row {
                                    padding: 10

                                    MPaper {
                                        width: 128
                                        height: 128
                                    }
                                    MCollapse {
                                        target: parent
                                        open: collapse_check.checked
                                        collapsedSize: 40
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
                            collapse_code.visible = !collapse_code.visible
                        }
                    }
                }

                Rectangle {
                    id: collapse_code
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    visible: false
                    color: "#272c34"
                    height: 420
                    radius: 4

                    MOverflowYBox {
                        anchors.fill: parent

                        MCopyText {
                            padding: 20
                            bottomPadding: 20
                            color: Color.white
                            textFormat: TextEdit.RichText
                            text: `
<pre >
Row {
    id: row
    MSwitch {
        id: collapse_check
        anchors.verticalCenter: parent.verticalCenter
    }
    MTypography {
        anchors.verticalCenter: parent.verticalCenter
        text: "Show"
    }
}

Row {
    topPadding: -20

    Column {
        width: 148
        height: 148

        Row {
            padding: 10

            MPaper {
                width: 128
                height: 128
            }
            MCollapse {
                target: parent
                open: collapse_check.checked
            }
        }
    }

    Column {
        width: 148
        height: 148

        Row {
            padding: 10

            MPaper {
                width: 128
                height: 128
            }
            MCollapse {
                target: parent
                open: collapse_check.checked
                collapsedSize: 40
            }
        }
    }
}
</pre>
                            `
                        }
                    }
                }

                // Fade 淡入淡出

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "Fade 淡入淡出"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "从透明淡入至不透明。"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    Layout.topMargin: 10
                    height: fade_display.height
                    color: "#f5f5f5"

                    Column {
                        id: fade_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Row {
                            MSwitch {
                                id: fade_check
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MTypography {
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Show"
                            }
                        }

                        Row {
                            MPaper {
                                width: 128
                                height: 128

                                MFade {
                                    target: parent
                                    open: fade_check.checked
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
                            fade_code.visible = !fade_code.visible
                        }
                    }
                }

                Rectangle {
                    id: fade_code
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    visible: false
                    color: "#272c34"
                    height: childrenRect.height
                    radius: 4

                    MCopyText {
                        padding: 20
                        bottomPadding: 20
                        color: Color.white
                        textFormat: TextEdit.RichText
                        text: `
<pre>
Row {
    MSwitch {
        id: fade_check
        anchors.verticalCenter: parent.verticalCenter
    }
    MTypography {
        anchors.verticalCenter: parent.verticalCenter
        text: "Show"
    }
}

Row {
    MPaper {
        width: 128
        height: 128

        MFade {
            target: parent
            open: fade_check.checked
        }
    }
}
</pre>
                        `
                    }
                }

                // Grow 扩展

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "Grow 扩展"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "从子元素的中心向外扩展，同时从透明淡入至不透明。"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>第二个示例演示如何更改 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >transformOrigin</span> 属性，以及有条件地用 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >timeout</span> 属性来改变元素进入的速度。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    Layout.topMargin: 10
                    height: grow_display.height
                    color: "#f5f5f5"

                    Column {
                        id: grow_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Row {
                            MSwitch {
                                id: grow_check
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MTypography {
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Show"
                            }
                        }

                        Row {
                            Column {
                                width: 148
                                height: 148

                                Row {
                                    padding: 10

                                    MPaper {
                                        width: 128
                                        height: 128
                                    }

                                    MGrow {
                                        target: parent
                                        open: grow_check.checked
                                    }
                                }
                            }

                            Column {
                                width: 148
                                height: 148

                                Row {
                                    padding: 10

                                    MPaper {
                                        width: 128
                                        height: 128
                                    }

                                    MGrow {
                                        target: parent
                                        timeout: 1000
                                        transformOrigin: Item.TopLeft
                                        open: grow_check.checked
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
                            grow_code.visible = !grow_code.visible
                        }
                    }
                }

                Rectangle {
                    id: grow_code
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    visible: false
                    color: "#272c34"
                    height: 420
                    radius: 4

                    MOverflowYBox {
                        anchors.fill: parent

                        MCopyText {
                            padding: 20
                            bottomPadding: 20
                            color: Color.white
                            textFormat: TextEdit.RichText
                            text: `
<pre>
Row {
    MSwitch {
        id: grow_check
        anchors.verticalCenter: parent.verticalCenter
    }
    MTypography {
        anchors.verticalCenter: parent.verticalCenter
        text: "Show"
    }
}

Row {
    padding: 20

    Column {
        width: 148
        height: 148

        Row {
            padding: 10

            MPaper {
                width: 128
                height: 128
            }

            MGrow {
                target: parent
                open: grow_check.checked
            }
        }
    }

    Column {
        width: 148
        height: 148

        Row {
            padding: 10

            MPaper {
                width: 128
                height: 128
            }

            MGrow {
                target: parent
                timeout: 1000
                transformOrigin: Item.TopLeft
                open: grow_check.checked
            }
        }
    }
}
</pre>
                            `

                        }
                    }
                }

                // Slide 滑动

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "Slide 滑动"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"                        
                        textFormat: MTypography.RichText
                        text: `<p>从屏幕边缘滑入。 使用 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >direction</span> 属性能够控制从屏幕的哪一个边缘开始过渡。</p>`
                        wrapMode: MTypography.WordWrap
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"                       
                        textFormat: MTypography.RichText
                        text: `<p>动画会对元素的 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >x</span> 和 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >y</span> 属性进行修改，若要保证原始位置的正确，请传入 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >originX</span> 和 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >originY</span>来保证元素中 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >x</span> 和 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >y</span> 的原始位置。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    Layout.topMargin: 10
                    height: slide_display.height
                    color: "#f5f5f5"

                    Column {
                        id: slide_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Row {
                            MSwitch {
                                id: slide_check
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MTypography {
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Show"
                            }
                        }

                        Row {
                            MPaper {
                                width: 128
                                height: 128

                                MSlide {
                                    target: parent
                                    direction: "up"
                                    open: slide_check.checked
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
                            slide_code.visible = !slide_code.visible
                        }
                    }
                }


                Rectangle {
                    id: slide_code
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    visible: false
                    color: "#272c34"
                    height: childrenRect.height
                    radius: 4

                    MCopyText {
                        padding: 20
                        bottomPadding: 20
                        color: Color.white
                        textFormat: TextEdit.RichText
                        text: `
<pre>
Row {
    MSwitch {
        id: slide_check
        anchors.verticalCenter: parent.verticalCenter
    }
    MTypography {
        anchors.verticalCenter: parent.verticalCenter
        text: "Show"
    }
}

Row {
    MPaper {
        width: 128
        height: 128
        anchors.top: parent.top

        MSlide {
            target: parent
            direction: "up"
            open: slide_check.checked
        }
    }
}
</pre>
                        `
                    }
                }

                // Zoom 放大

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "Zoom 放大"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "从子元素的中心向外扩展。"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "此示例还演示了如何用 timeout 属性来改变元素进入的速度。"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    Layout.topMargin: 10
                    height: zoom_display.height
                    color: "#f5f5f5"

                    Column {
                        id: zoom_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Row {
                            MSwitch {
                                id: zoom_check
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MTypography {
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Show"
                            }
                        }

                        Row {
                            spacing: 20

                            MPaper {
                                width: 128
                                height: 128

                                MZoom {
                                    target: parent
                                    open: zoom_check.checked
                                }
                            }

                            MPaper {
                                width: 128
                                height: 128

                                MZoom {
                                    target: parent
                                    timeout: 1000
                                    open: zoom_check.checked
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
                            zoom_code.visible = !zoom_code.visible
                        }
                    }
                }

                Rectangle {
                    id: zoom_code
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    visible: false
                    color: "#272c34"
                    height: childrenRect.height
                    radius: 4

                    MCopyText {
                        padding: 20
                        bottomPadding: 20
                        color: Color.white
                        textFormat: TextEdit.RichText
                        text: `
<pre>
Row {
    MSwitch {
        id: zoom_check
        anchors.verticalCenter: parent.verticalCenter
    }
    MTypography {
        anchors.verticalCenter: parent.verticalCenter
        text: "Show"
    }
}

Row {
    spacing: 20

    MPaper {
        width: 128
        height: 128

        MZoom {
            target: parent
            open: zoom_check.checked
        }
    }

    MPaper {
        width: 128
        height: 128

        MZoom {
            target: parent
            timeout: 1000
            open: zoom_check.checked
        }
    }
}
</pre>
                        `
                    }
                }

                // ScaleX 放大

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "ScaleX 放大"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "从横向向外扩展。"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "此示例还演示了如何用 transformOrigin 属性来改变元素进入的位置。"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    Layout.topMargin: 10
                    height: scalex_display.height
                    color: "#f5f5f5"

                    Column {
                        id: scalex_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Row {
                            MSwitch {
                                id: scalex_check
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MTypography {
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Show"
                            }
                        }

                        Row {
                            spacing: 20

                            MPaper {
                                width: 128
                                height: 128

                                MScaleX {
                                    target: parent
                                    open: scalex_check.checked
                                }
                            }

                            MPaper {
                                width: 128
                                height: 128

                                MScaleX {
                                    target: parent
                                    transformOrigin: Item.Right
                                    timeout: 1000
                                    open: scalex_check.checked
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
                            scalex_code.visible = !scalex_code.visible
                        }
                    }
                }

                Rectangle {
                    id: scalex_code
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    visible: false
                    color: "#272c34"
                    height: childrenRect.height
                    radius: 4

                    MCopyText {
                        padding: 20
                        bottomPadding: 20
                        color: Color.white
                        textFormat: TextEdit.RichText
                        text: `
<pre>
Row {
    MSwitch {
        id: scalex_check
        anchors.verticalCenter: parent.verticalCenter
    }
    MTypography {
        anchors.verticalCenter: parent.verticalCenter
        text: "Show"
    }
}

Row {
    spacing: 20

    MPaper {
        width: 128
        height: 128

        MScaleX {
            target: parent
            open: scalex_check.checked
        }
    }

    MPaper {
        width: 128
        height: 128

        MScaleX {
            target: parent
            transformOrigin: Item.Right
            timeout: 1000
            open: scalex_check.checked
        }
    }
}
</pre>
                        `
                    }
                }

                // ScaleY 放大

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "ScaleY 放大"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "从纵向向外扩展。"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "此示例还演示了如何用 transformOrigin 属性来改变元素进入的位置。"
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    Layout.topMargin: 10
                    height: scaley_display.height
                    color: "#f5f5f5"

                    Column {
                        id: scaley_display
                        spacing: 20
                        leftPadding: 20
                        rightPadding: 20
                        topPadding: 20
                        bottomPadding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Row {
                            MSwitch {
                                id: scaley_check
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            MTypography {
                                anchors.verticalCenter: parent.verticalCenter
                                text: "Show"
                            }
                        }

                        Row {
                            spacing: 20

                            MPaper {
                                width: 128
                                height: 128

                                MScaleY {
                                    target: parent
                                    open: scaley_check.checked
                                }
                            }

                            MPaper {
                                width: 128
                                height: 128

                                MScaleY {
                                    target: parent
                                    transformOrigin: Item.Bottom
                                    timeout: 1000
                                    open: scaley_check.checked
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
                            scaley_code.visible = !scaley_code.visible
                        }
                    }
                }

                Rectangle {
                    id: scaley_code
                    Layout.fillWidth: true
                    Layout.leftMargin: 20
                    Layout.rightMargin: 20
                    visible: false
                    color: "#272c34"
                    height: childrenRect.height
                    radius: 4

                    MCopyText {
                        padding: 20
                        bottomPadding: 20
                        color: Color.white
                        textFormat: TextEdit.RichText
                        text: `
<pre>
Row {
    MSwitch {
        id: scaley_check
        anchors.verticalCenter: parent.verticalCenter
    }
    MTypography {
        anchors.verticalCenter: parent.verticalCenter
        text: "Show"
    }
}

Row {
    spacing: 20

    MPaper {
        width: 128
        height: 128

        MScaleY {
            target: parent
            open: scaley_check.checked
        }
    }

    MPaper {
        width: 128
        height: 128

        MScaleY {
            target: parent
            transformOrigin: Item.Bottom
            timeout: 1000
            open: scaley_check.checked
        }
    }
}
</pre>
                        `
                    }
                }

                // transitionComponent 属性

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "transitionComponent 属性"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"                        
                        textFormat: MTypography.RichText
                        text: `<p>像 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >Dialog</span> 之类的组件接收 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >transitionComponent</span> 属性来自定义默认的过渡动画。 您可以使用上述的任何组件或者是您自己的组件。 它应遵守以下条件：</p>`
                        wrapMode: MTypography.WordWrap
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"                        
                        textFormat: MTypography.RichText
                        text: `<p>○ 继承 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >MAnimation</span> 组件，这是基本动画的基类。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>○ 定义 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >enter</span> 和 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >enterState</span>，指定进入过渡时的动画和状态。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                    MTypography {
                        width: parent.width-40
                        variant: "body1"                        
                        textFormat: MTypography.RichText
                        text: `<p>○ 定义 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >exit</span> 和 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >exitState</span>，指定退出过渡时的动画和状态。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>○ 如果只是传给 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >Dialog</span> 组件，则只需要定义 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >enter</span> 和 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >exit</span> 属性。</p>`
                        wrapMode: MTypography.WordWrap
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
                            text: "MCollapse { }"
                            onClicked: {
                                Route.redirectTo("/api/collapse")
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
                            text: "MFade { }"
                            onClicked: {
                                Route.redirectTo("/api/fade")
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
                            text: "MGrow { }"
                            onClicked: {
                                Route.redirectTo("/api/grow")
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
                            text: "MSlide { }"
                            onClicked: {
                                Route.redirectTo("/api/slide")
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
                            text: "MZoom { }"
                            onClicked: {
                                Route.redirectTo("/api/zoom")
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
