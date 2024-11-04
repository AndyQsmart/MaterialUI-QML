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
    name: "ButtonGroup"
//    props_description: "Any other props supplied will be provided to the root Item (MButtonBase)."
//    inheritance_description: "The props of the ButtonBase component are also available. You can take advantage of this behavior to target nested components."
    props_list: [
        {
            name: "children",
            type: "MButton",
            default_value: "",
            description: "The content of the button group.",
        },
        {
            name: "buttonColor",
            type: "'default'\n| 'inherit'\n| 'primary'\n| 'secondary'",
            default_value: "'default'",
            description: "The color of the component. It supports those theme colors that make sense for this component.",
        },
        {
            name: "disabled",
            type: "bool",
            default_value: "false",
            description: "If true, the buttons will be disabled.",
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
            name: "orientation",
            type: "'horizontal'\n| 'vertical'",
            default_value: "'horizontal'",
            description: "The group orientation (layout flow direction).",
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
    ]
}
