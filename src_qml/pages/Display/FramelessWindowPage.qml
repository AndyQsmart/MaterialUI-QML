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
                        text: "FramelessWindow 无边框窗口"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: "提供无边框的窗口，方便美化界面。"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>使用无边框窗口，需要在C++或者Python代码中加入 <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >QQuickWindow::setDefaultAlphaBuffer(true);</span> | <span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >QQuickWindow.setDefaultAlphaBuffer(True)</span>。</p>`
                        wrapMode: MTypography.WordWrap
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>可参考 <span style="color: ${Palette.secondaryMain}" >main.cpp</span> 和 <span style="color: ${Palette.secondaryMain}" >main.py</span>。</p>`
                        wrapMode: MTypography.WordWrap
                    }
                }

                // **********FramelessWindow

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "FramelessWindow 无边框窗口"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="color: ${Palette.secondaryMain}" >无边框窗口</span> 默认提供一个没有边框的系统窗口，包含模拟系统风格的最小化、最大化和关闭按钮。</p>`
                        wrapMode: MTypography.WordWrap
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p><span style="font-size: 14px; background-color: rgba(255, 229, 100, 0.2)" >win风格</span> 的窗口，默认按照win11的系统按钮风格。</p>`
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
                            color: "primary"
                            text: "打开win风格窗口"

                            onClicked: {
                                win_frameless_window.visible = true
                            }
                        }

                        MButton {
                            variant: "contained"
                            color: "secondary"
                            text: "打开mac风格窗口"

                            onClicked: {
                                mac_frameless_window.visible = true
                            }
                        }

                        MFramelessWindow {
                            id: win_frameless_window
                            systemType: "win"
                            visible: false
                            width: 600
                            height: 300
                            minimumWidth: 600
                            minimumHeight: 300
                        }

                        MFramelessWindow {
                            id: mac_frameless_window
                            systemType: "mac"
                            visible: false
                            width: 600
                            height: 300
                            minimumWidth: 600
                            minimumHeight: 300
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
    text: "打开win风格窗口"

    onClicked: {
        win_frameless_window.visible = true
    }
}

MButton {
    variant: "contained"
    color: "secondary"
    text: "打开mac风格窗口"

    onClicked: {
        mac_frameless_window.visible = true
    }
}

MFramelessWindow {
    id: win_frameless_window
    systemType: "win"
    visible: false
    width: 600
    height: 300
    minimumWidth: 600
    minimumHeight: 300
}

MFramelessWindow {
    id: mac_frameless_window
    systemType: "mac"
    visible: false
    width: 600
    height: 300
    minimumWidth: 600
    minimumHeight: 300
}
</pre>
                            `
                        }
                    }
                }




                // **********暗黑模式

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 40

                    MTypography {
                        variant: "h5"
                        text: "darkMode 暗黑模式"
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        textFormat: MTypography.RichText
                        text: `<p>通过<span style="color: ${Palette.secondaryMain}" >darkMode</span> 参数来实现暗黑主题风格的窗口。</p>`
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
                        spacing: 10
                        padding: 20
                        anchors.horizontalCenter: parent.horizontalCenter

                        MRadioGroup {
                            anchors.horizontalCenter: parent.horizontalCenter
                            row: true
                            value: Qt.platform.os === 'osx' ? "mac" : "win"

                            MFormControlLabel {
                                value: "win"
                                label: "win"
                                control: MRadio {
                                }
                            }
                            MFormControlLabel {
                                value: "mac"
                                label: "mac"
                                control: MRadio {
                                }
                            }

                            onValueChanged: {
                                light_frameless_window.systemType = value
                                dark_frameless_window.systemType = value
                            }
                        }

                        Row {
                            spacing: 20
                            padding: 0

                            MButton {
                                variant: "contained"
                                color: "primary"
                                text: "打开light主题窗口"

                                onClicked: {
                                    light_frameless_window.visible = true
                                }
                            }

                            MButton {
                                variant: "contained"
                                color: "secondary"
                                text: "打开dark主题窗口"

                                onClicked: {
                                    dark_frameless_window.visible = true
                                }
                            }
                        }

                        MFramelessWindow {
                            id: light_frameless_window
                            visible: false
                            width: 600
                            height: 300
                            minimumWidth: 600
                            minimumHeight: 300
                        }

                        MFramelessWindow {
                            id: dark_frameless_window
                            visible: false
                            width: 600
                            height: 300
                            minimumWidth: 600
                            minimumHeight: 300
                            darkMode: true
                            backgroundColor: "#353434"
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
    text: "打开light主题窗口"

    onClicked: {
        light_frameless_window.visible = true
    }
}

MButton {
    variant: "contained"
    color: "secondary"
    text: "打开dark主题窗口"

    onClicked: {
        dark_frameless_window.visible = true
    }
}

MFramelessWindow {
    id: light_frameless_window
    visible: false
    width: 600
    height: 300
    minimumWidth: 600
    minimumHeight: 300
}

MFramelessWindow {
    id: dark_frameless_window
    visible: false
    width: 600
    height: 300
    minimumWidth: 600
    minimumHeight: 300
    darkMode: true
    backgroundColor: "#353434"
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
}
