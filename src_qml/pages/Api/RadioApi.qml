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
    name: "Radio"
    props_list: [
        {
            name: "checked",
            type: "bool",
            default_value: "",
            description: "If true, the component is checked.",
        },
        {
            name: "color",
            type: "'default'\n| 'primary'\n| 'secondary'\n|  color",
            default_value: "'secondary'",
            description: "The color of the component. It supports those theme colors that make sense for this component.",
        },
        {
            name: "disabled",
            type: "bool",
            default_value: "false",
            description: "If true, the button will be disabled.",
        },
        {
            name: "disableRipple",
            type: "bool",
            default_value: "false",
            description: "If true, the ripple effect will be disabled.",
        },
        {
            name: "value",
            type: "string",
            default_value: "",
            description: "The value of the component. The DOM API casts this to a string.",
        },
    ]
    demos_list: [
        {
            name: "Radio Buttons",
            url: "/radiopage",
        },
    ]
}
