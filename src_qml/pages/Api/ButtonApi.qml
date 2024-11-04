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
    name: "Button"
    props_description: "Any other props supplied will be provided to the root Item (MButtonBase)."
    inheritance_description: "The props of the ButtonBase component are also available. You can take advantage of this behavior to target nested components."
    props_list: [
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
            type: "'default'\n| 'primary'\n| 'secondary'\n|  color",
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
    demos_list: [
        {
            name: "Button Group",
             url: "/buttongrouppage",
        },
        {
            name: "Buttons",
            url: "/buttonpage",
        },
    ]
}
