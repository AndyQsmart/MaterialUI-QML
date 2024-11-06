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

BaseApi {
    name: "ButtonBase"
    props_description: "Any other props supplied will be provided to the root Item (native Button Item)."
    inheritance_description: ""
    props_list: [
        {
            name: "children",
            type: "Item",
            default_value: "",
            description: "The content of the Item.",
        },
        {
            name: "disabled",
            type: "bool",
            default_value: "false",
            description: "If true, the button will be disabled.",
        },
        {
            name: "disableCursor",
            type: "bool",
            default_value: "false",
            description: "[new] If true, the cursor style effect will be disabled.",
        },
        {
            name: "disableRipple",
            type: "bool",
            default_value: "false",
            description: "If true, the ripple effect will be disabled.",
        },
        {
            name: "fontSize",
            type: "int",
            default_value: "",
            description: "[new] The text font size of the component. Usually, you do not need to change this prop.",
        },
        {
            name: "text",
            type: "string",
            default_value: "",
            description: "The text content of the Item.",
        },
        {
            name: "textColor",
            type: "color",
            default_value: "",
            description: "[new] The text color of the component. If use this prop, ripple will be changed too.",
        },
    ]
    demos_list: [
        {
            name: "Buttons",
            url: "/buttonpage",
        },
    ]
}
