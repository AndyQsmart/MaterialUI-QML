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
                        text: "Slider 滑块控件"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "用户可以使用滑块控件在某一范围内取值。"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="color: ${Palette.secondaryMain}" >滑块控件</span> 反映了条形图上的一系列值，用户可以从中选择单个值。 它们通常适用于调节一些设置，譬如调节设备音量、调整屏幕亮度，或者改变图像的滤镜。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }



                // **********连续滑块（Continuous sliders）

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "连续滑块（Continuous sliders）"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "用户可以使用连续的滑块组件在给定的范围内选择一个值。"
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
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Column {
                            MTypography {
                                text: "Volume"
                                gutterBottom: true
                            }

                            RowLayout {
                                width: 200
                                spacing: 20

                                MIcon {
                                    name: "volume-down"
                                    size: 18
                                }

                                MSlider {
                                    Layout.fillWidth: true
                                }

                                MIcon {
                                    name: "volume-up"
                                    size: 18
                                }
                            }
                        }

                        Column {
                            MTypography {
                                text: "Disabled slider"
                                gutterBottom: true
                            }

                            RowLayout {
                                width: 200

                                MSlider {
                                    Layout.fillWidth: true
                                    disabled: true
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
                            continuous_sliders_code.visible = !continuous_sliders_code.visible
                        }
                    }
                }

                Rectangle {
                    id: continuous_sliders_code
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
Column {
    spacing: 20
    padding: 20

    Column {
        MTypography {
            text: "Volume"
            gutterBottom: true
        }

        RowLayout {
            width: 200
            spacing: 20

            MIcon {
                name: "volume-down"
                size: 18
            }

            MSlider {
                Layout.fillWidth: true
            }

            MIcon {
                name: "volume-up"
                size: 18
            }
        }
    }

    Column {
        MTypography {
            text: "Disabled slider"
            gutterBottom: true
        }

        RowLayout {
            width: 200

            MSlider {
                Layout.fillWidth: true
                disabled: true
            }
        }
    }
}
</pre>
`
                        }
                    }
                }


                // **********间续滑块（Discrete sliders）

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "间续滑块（Discrete sliders）"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "用户可以通过参考其值指示器，来将间续滑块调整为某一特定值。 以下是一些案例："
                    }

                    MTypography {
                        width: parent.width-40
                        textFormat: MTypography.RichText
                        text: `<p>通过设置 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >marks={true}</span> ，你可以针对每个步骤产生一个标记（mark）。</p>`
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

                    Column {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Column {
                            MTypography {
                                text: "Temperature"
                                gutterBottom: true
                            }
                            MSlider {
                                valueLabelDisplay: "auto"
                                width: 300
                                value: 30
                                step: 10
                                marks: true
                                min: 10
                                max: 110
                            }
                        }

                        Column {
                            MTypography {
                                text: "Disabled"
                                gutterBottom: true
                            }
                            MSlider {
                                width: 300
                                disabled: true
                                value: 30
                                step: 10
                                marks: true
                                min: 10
                                max: 110
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
                            discrete_sliders_code.visible = !discrete_sliders_code.visible
                        }
                    }
                }


                Rectangle {
                    id: discrete_sliders_code
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
Column {
    spacing: 20
    padding: 20

    Column {
        MTypography {
            text: "Temperature"
            gutterBottom: true
        }
        MSlider {
            valueLabelDisplay: "auto"
            width: 300
            value: 30
            step: 10
            marks: true
            min: 10
            max: 110
        }
    }

    Column {
        MTypography {
            text: "Disabled"
            gutterBottom: true
        }
        MSlider {
            width: 300
            disabled: true
            value: 30
            step: 10
            marks: true
            min: 10
            max: 110
        }
    }
}
</pre>
`
                        }
                    }
                }


                // **********小的步骤

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "小的步骤"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: "您可以更改默认的步进增量。"
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
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Column {
                            MTypography {
                                text: "Small steps"
                                gutterBottom: true
                            }
                            MSlider {
                                valueLabelDisplay: "auto"
                                valueLabelFormat: function(x) {
                                    return x === 0 ? 0 : x.toExponential(0)
                                }
                                width: 300
                                value: 0.00000005
                                step: 0.00000001
                                marks: true
                                min: -0.00000005
                                max: 0.0000001
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
                            small_step_code.visible = !small_step_code.visible
                        }
                    }
                }

                Rectangle {
                    id: small_step_code
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
    MTypography {
        text: "Small steps"
        gutterBottom: true
    }
    MSlider {
        valueLabelDisplay: "auto"
        valueLabelFormat: function(x) {
            return x === 0 ? 0 : x.toExponential(0)
        }
        width: 300
        value: 0.00000005
        step: 0.00000001
        marks: true
        min: -0.00000005
        max: 0.0000001
    }
}
</pre>
                            `
                        }
                    }
                }


                // **********标签总是可见

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "标签总是可见"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>通过设置 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >valueLabelDisplay="on"</span>，您可以强制缩略图的标签始终可见。</p>`
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

                    Column {
                        spacing: 20
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        Column {
                            MTypography {
                                text: "Always visible"
                                gutterBottom: true
                            }
                            MSlider {
                                valueLabelDisplay: "on"
                                valueLabelFormat: function(x) {
                                    return `${x}°C`
                                }
                                width: 300
                                value: 80
                                step: 10
                                marks: true
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
                            valueLabel_on_code.visible = !valueLabel_on_code.visible
                        }
                    }
                }

                Rectangle {
                    id: valueLabel_on_code
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
    MTypography {
        text: "Always visible"
        gutterBottom: true
    }
    MSlider {
        valueLabelDisplay: "on"
        valueLabelFormat: function(x) {
            return \`\${x}°C\`
        }
        width: 300
        value: 80
        step: 10
        marks: true
    }
}
</pre>
                            `
                        }
                    }
                }


                // **********纵向滑块

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "纵向滑块"
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

                        MTypography {
                            text: "Temperature"
                            gutterBottom: true
                        }

                        MSlider {
                            height: 300
                            orientation: Qt.Vertical
                            value: 30
                        }

                        MSlider {
                            height: 300
                            disabled: true
                            orientation: Qt.Vertical
                            value: 30
                        }

                        MSlider {
                            height: 300
                            orientation: Qt.Vertical
                            value: 30
                            step: 10
                            marks: true
                            valueLabelDisplay: 'on'
                            valueLabelFormat: function(x) {
                                return `${x}°C`
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
                            vertical_sliders_code.visible = !vertical_sliders_code.visible
                        }
                    }
                }

                Rectangle {
                    id: vertical_sliders_code
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
Column {
    spacing: 20
    padding: 20

    Column {
        MTypography {
            text: "Volume"
            gutterBottom: true
        }

        RowLayout {
            width: 200
            spacing: 20

            MIcon {
                name: "volume-down"
                size: 18
            }

            MSlider {
                Layout.fillWidth: true
            }

            MIcon {
                name: "volume-up"
                size: 18
            }
        }
    }

    Column {
        MTypography {
            text: "Disabled slider"
            gutterBottom: true
        }

        RowLayout {
            width: 200

            MSlider {
                Layout.fillWidth: true
                disabled: true
            }
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
                            text: "MSlider { }"
                            onClicked: {
                                Route.redirectTo("/api/slider")
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
