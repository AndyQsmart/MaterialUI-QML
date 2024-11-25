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
    name: "TextField"
    props_list: [
        {
            name: "color",
            type: "'primary'\n| 'secondary'",
            default_value: "'primary'",
            description: "The color of the component. It supports those theme colors that make sense for this component.",
        },
        {
            name: "disabled",
            type: "bool",
            default_value: "false",
            description: "If true, the input will be disabled.",
        },
        {
            name: "placeholder",
            type: "string",
            default_value: "",
            description: "The short hint displayed in the input before the user enters a value.",
        },
        {
            name: "size",
            type: "'medium'\n| 'small'",
            default_value: "'medium'",
            description: "The size of the text field.",
        },
        {
            name: "variant",
            type: "'filled'\n| 'outlined'\n| 'standard'",
            default_value: "'standard'",
            description: "The variant to use.",
        },
    ]
    demos_list: [
        {
            name: "Text Fields",
             url: "/textfieldpage",
        },
    ]
}
