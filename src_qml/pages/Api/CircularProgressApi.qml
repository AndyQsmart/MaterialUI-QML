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
    name: "CircularProgress"
    props_list: [
        {
            name: "color",
            type: "'primary'\n| 'secondary'\n|  color",
            default_value: "'primary'",
            description: "The color of the component. It supports those theme colors that make sense for this component.",
        },
        {
            name: "disableShrink",
            type: "bool",
            default_value: "false",
            description: "If true, the shrink animation is disabled. This only works if variant is indeterminate.",
        },
        {
            name: "size",
            type: "number",
            default_value: "40",
            description: "The size of the circle.",
        },
        {
            name: "thickness",
            type: "number",
            default_value: "3.6",
            description: "The thickness of the circle.",
        },
        {
            name: "value",
            type: "number",
            default_value: "0",
            description: "The value of the progress indicator for the determinate variant. Value between 0 and 100.",
        },
        {
            name: "variant",
            type: "'determinate'\n| 'indeterminate'\n| 'static'",
            default_value: "'indeterminate'",
            description: "The variant to use. Use indeterminate when there is no progress value.",
        },
    ]
    demos_list: [
        {
            name: "Progress",
            url: "/progresspage",
        },
    ]
}
