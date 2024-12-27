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
                        text: "Progress 进度条组件"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "Progress indicators（进度指示器）也称为微调器 (spinners) ，它表示了一个不明确的等待时间，或者显示处理过程的时间长短。"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="color: ${MPalette.secondaryMain}" >进度指示器</span>能够将当前处理过程的状态通知用户，例如加载一个应用，提交一个表单或保存一些更新。 它们与应用程序状态进行通信并指示可用的操作，例如用户是否可从当前页面离开。</p>`
                        wrapMode: MTypography.WordWrap
                        gutterBottom: true
                    }

                    MTypography {
                        variant: "body1"
                        text: "○ 定量指示器显示一个操作消耗多长时间。"
                    }
                    MTypography {
                        variant: "body1"
                        text: "○ 不定量指示器可视化了一个不确定的操作等待时间。"
                        gutterBottom: true
                    }
                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "在显示一系列过程的进度时，与其显示每个单独活动的进度，进度条指示器会展示整体的过程。"
                    }
                }



                // **********环状进度条

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h4"
                        text: "环状进度条"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "不定量的环形进度条"
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

                        MCircularProgress {

                        }

                        MCircularProgress {
                            color: "secondary"
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
MCircularProgress {

}

MCircularProgress {
    color: "secondary"
}
</pre>
                            `
                        }
                    }
                }



                // **********环状进度条

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "定量的环形进度条"
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

                        MCircularProgress {
                            variant: "determinate"
                            value: 25
                        }

                        MCircularProgress {
                            variant: "determinate"
                            value: 50
                        }

                        MCircularProgress {
                            variant: "determinate"
                            value: 75
                        }

                        MCircularProgress {
                            variant: "determinate"
                            value: 100
                        }

                        MCircularProgress {
                            id: prevProgress
                            variant: "determinate"
                            value: 0
                        }

                        Timer {
                            interval: 800
                            repeat: true
                            running: true

                            onTriggered: {
                                prevProgress.value = prevProgress.value >= 100 ? 0 : prevProgress.value+10
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
MCircularProgress {
    variant: "determinate"
    value: 25
}

MCircularProgress {
    variant: "determinate"
    value: 50
}

MCircularProgress {
    variant: "determinate"
    value: 75
}

MCircularProgress {
    variant: "determinate"
    value: 100
}

MCircularProgress {
    id: prevProgress
    variant: "determinate"
    value: 0
}

Timer {
    interval: 800
    repeat: true
    running: true

    onTriggered: {
        prevProgress.value = prevProgress.value >= 100 ? 0 : prevProgress.value+10
    }
}
</pre>
                            `
                        }
                    }
                }





                // **********带标签的环状进度条

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "带标签的环状进度条"
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

                        MCircularProgress {
                            id: labelProgress
                            variant: "determinate"
                            value: 0

                            MTypography {
                                anchors.centerIn: parent
                                variant: "caption"
                                textColor: "textSecondary"
                                text: `${Math.round(labelProgress.value)}%`
                            }
                        }

                        Timer {
                            interval: 800
                            repeat: true
                            running: true

                            onTriggered: {
                                labelProgress.value = labelProgress.value >= 100 ? 0 : labelProgress.value+10
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
MCircularProgress {
    id: labelProgress
    variant: "determinate"
    value: 0

    MTypography {
        anchors.centerIn: parent
        variant: "caption"
        textColor: "textSecondary"
        text: \`\${Math.round(labelProgress.value)}%\`
    }
}

Timer {
    interval: 800
    repeat: true
    running: true

    onTriggered: {
        labelProgress.value = labelProgress.value >= 100 ? 0 : labelProgress.value+10
    }
}
</pre>
                            `
                        }
                    }
                }



                // **********线性进度条

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h4"
                        text: "线性进度条"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "不定量的线性进度条"
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
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MLinearProgress {
                            width: parent.width-40
                        }

                        MLinearProgress {
                            width: parent.width-40
                            color: "secondary"
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
MLinearProgress {

}

MLinearProgress {
    color: "secondary"
}
</pre>
                            `
                        }
                    }
                }



                // **********定量的线性进度条

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "定量的线性进度条"
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
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MLinearProgress {
                            id: oldProgress
                            width: parent.width-40
                            variant: "determinate"
                        }

                        Timer {
                            interval: 500
                            repeat: true
                            running: true

                            onTriggered: {
                                if (oldProgress.value === 100) {
                                    oldProgress.value = 0
                                }
                                else {
                                    const diff = Math.random() * 10
                                    oldProgress.value = Math.min(oldProgress.value + diff, 100)
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
MLinearProgress {
    id: oldProgress
    variant: "determinate"
}

Timer {
    interval: 500
    repeat: true
    running: true

    onTriggered: {
        if (oldProgress.value === 100) {
            oldProgress.value = 0
        }
        else {
            const diff = Math.random() * 10
            oldProgress.value = Math.min(oldProgress.value + diff, 100)
        }
    }
}
</pre>
                            `
                        }
                    }
                }


                // **********线性缓冲条

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "线性缓冲条"
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
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MLinearProgress {
                            id: bufferProgress
                            width: parent.width-40
                            variant: "buffer"
                            value: 0
                            valueBuffer: 0
                        }

                        Timer {
                            interval: 500
                            repeat: true
                            running: true

                            onTriggered: {
                                if (bufferProgress.value > 100) {
                                    bufferProgress.value = 0
                                    bufferProgress.valueBuffer = 10
                                }
                                else {
                                    const diff = Math.random() * 10
                                    const diff2 = Math.random() * 10
                                    bufferProgress.value = bufferProgress.value + diff
                                    bufferProgress.valueBuffer = Math.min(100, Math.max(bufferProgress.valueBuffer+diff2, bufferProgress.value + diff + diff2))
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
MLinearProgress {
    id: oldProgress
    variant: "determinate"
}

Timer {
    interval: 500
    repeat: true
    running: true

    onTriggered: {
        if (oldProgress.value === 100) {
            oldProgress.value = 0
        }
        else {
            const diff = Math.random() * 10
            oldProgress.value = Math.min(oldProgress.value + diff, 100)
        }
    }
}
</pre>
                            `
                        }
                    }
                }




                // **********带标签的线性进度条

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "带标签的线性进度条"
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

                    RowLayout {
                        width: parent.width
                        spacing: 10

                        MLinearProgress {
                            Layout.fillWidth: true
                            Layout.topMargin: 20
                            Layout.bottomMargin: 20
                            Layout.leftMargin: 20
                            id: labelLinearProgress
                            width: parent.width-40
                            variant: "buffer"
                            value: 0
                        }

                        MTypography {
                            Layout.rightMargin: 20
                            variant: "body2"
                            textColor: "textSecondary"
                            text: `${Math.round(labelLinearProgress.value)}%`
                        }

                        Timer {
                            interval: 800
                            repeat: true
                            running: true

                            onTriggered: {
                                labelLinearProgress.value = labelLinearProgress.value >= 100 ? 10 : labelLinearProgress.value+10
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
RowLayout {
    spacing: 10

    MLinearProgress {
        Layout.fillWidth: true
        id: labelLinearProgress
        width: parent.width-40
        variant: "buffer"
        value: 0
    }

    MTypography {
        variant: "body2"
        textColor: "textSecondary"
        text: \`\${Math.round(labelLinearProgress.value)}%\`
    }

    Timer {
        interval: 800
        repeat: true
        running: true

        onTriggered: {
            labelLinearProgress.value = labelLinearProgress.value >= 100 ? 10 : labelLinearProgress.value+10
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
                            text: "MCircularProgress { }"
                            onClicked: {
                                Route.redirectTo("/api/circularprogress")
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
                            text: "MLinearProgress { }"
                            onClicked: {
                                Route.redirectTo("/api/linearprogress")
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
