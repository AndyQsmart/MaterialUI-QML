import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.11
import "../../common_component/MaterialUI"
import "../../common_component/MaterialUI/styles"
import "../../common_component/Route"
import "../../common_qml"
import "../../instance_component/Navbar"
import "../../common_js/Color.js" as Color
import "../../common_js/Tools.js" as Tools

Pane {
    id: container
    x: 0
    y: 0
    padding: 0
    property string name: ""
    property string description: ""
    property string props_description: ""
    property string inheritance_description: ""
    property var props_list: []
    property var demos_list: []

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
                        text: `${name} API`
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "h5"
                        text: `The API documentation of the ${name} QML component. Learn more about the props.`
                    }
                }

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        variant: "h5"
                        text: "Import"
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
                            text: `<pre>import "./common_component/MaterialUI"</pre>`
                        }
                    }
                }

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: description && description != "" ? 20 : 0

                    MTypography {
                        variant: "body1"
                        text: description
                    }
                }

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        variant: "h5"
                        text: "Props"
                    }
                }

                PropsTable {
                    propsList: props_list
                }

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: props_description
                    }
                }

                Column {
                    visible: inheritance_description && inheritance_description != ""
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20

                    MTypography {
                        variant: "h5"
                        text: "Inheritance"
                        gutterBottom: true
                    }

                    MTypography {
                        width: parent.width-40
                        variant: "body1"
                        text: inheritance_description
                    }
                }

                Column {
                    Layout.fillWidth: true
                    leftPadding: 20
                    rightPadding: 20
                    topPadding: 20
                    bottomPadding: 20

                    MTypography {
                        variant: "h5"
                        text: "Demos"
                        gutterBottom: true
                    }

                    Repeater {
                        model: demos_list

                        RowLayout {
                            MTypography {
                                variant: "body1"
                                text: "○"
                            }
                            MButton {
                                color: "secondary"
                                text: modelData.name
                                onClicked: {
                                    if (modelData.url) {
                                        Route.redirectTo(modelData.url)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
