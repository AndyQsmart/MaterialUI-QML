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
    property var props_list: [
        {
            name: "children",
            type: "Item",
            default_value: "",
            description: "The content of the button.",
        },
        {
            name: "text",
            type: "string",
            default_value: "",
            description: "The text content of the button.",
        },
        {
            name: "color",
            type: "'default'\n| 'inherit'\n| 'primary'\n| 'secondary'",
            default_value: "'default'",
            description: "The color of the component. It supports those theme colors that make sense for this component.",
        },
        {
            name: "textColor",
            type: "color",
            default_value: "",
            description: "[new] The text color of the component. If use this prop, ripple will be changed too.",
        },
        {
            name: "fontSize",
            type: "int",
            default_value: "",
            description: "[new] The text font size of the component. Usually, you do not need to change this prop.",
        },
        {
            name: "disabled",
            type: "bool",
            default_value: "false",
            description: "If true, the button will be disabled.",
        },
        {
            name: "disableElevation",
            type: "bool",
            default_value: "false",
            description: "If true, no elevation is used.",
        },
        {
            name: "disableRipple",
            type: "bool",
            default_value: "false",
            description: "If true, the ripple effect will be disabled.",
        },
        {
            name: "disableCursor",
            type: "bool",
            default_value: "false",
            description: "[new] If true, the cursor style effect will be disabled.",
        },
        {
            name: "size",
            type: "'large'\n| 'medium'\n| 'small'",
            default_value: "'medium'",
            description: "The size of the button. small is equivalent to the dense button styling.",
        },
        {
            name: "variant",
            type: "'contained'\n| 'outlined'\n| 'text'",
            default_value: "'text'",
            description: "The variant to use.",
        },
    ]

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
                        text: "Button API"
                        gutterBottom: true
                    }

                    MTypography {
                        variant: "h5"
                        text: "The API documentation of the Button QML component. "
                    }
                    MTypography {
                        variant: "h5"
                        text: "Learn more about the props."
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
                    color: Color.black
                    height: import_code.height
                    radius: 4


                    Column {
                        id: import_code
                        Layout.fillWidth: true
                        topPadding: 20
                        bottomPadding: 20
                        leftPadding: 20
                        rightPadding: 20

                        MCopyText {
                            color: Color.white
                            text: `import "./common_component/MaterialUI"`
                        }
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
                        text: "Any other props supplied will be provided to the root Item (MButtonBase)."
                    }
                }

                Column {
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
                        text: "The props of the ButtonBase component are also available. You can take advantage of this behavior to target nested components."
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

                    RowLayout {
                        MTypography {
                            variant: "body1"
                            text: "○"
                        }
                        MButton {
                            color: "secondary"
                            text: "Button Group"
                        }
                    }

                    RowLayout {
                        MTypography {
                            variant: "body1"
                            text: "○"
                        }
                        MButton {
                            color: "secondary"
                            text: "Buttons"

                            onClicked: {
                                Route.redirectTo("/buttonpage")
                            }
                        }
                    }
                }
            }
        }
    }
}
