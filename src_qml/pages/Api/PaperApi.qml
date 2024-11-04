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
    name: "Paper"
    props_description: "Any other props supplied will be provided to the root Item (native Rectangle Item)."
    inheritance_description: "The props of the Rectangle component are also available. You can take advantage of this behavior to target nested components."
    props_list: [
        {
            name: "children",
            type: "Item",
            default_value: "",
            description: "The content of the Item.",
        },
        {
            name: "elevation",
            type: "int",
            default_value: "1",
            description: "Shadow depth, corresponds to dp in the spec. It accepts values between 0 and 24 inclusive.",
        },
        {
            name: "square",
            type: "bool",
            default_value: "false",
            description: "If true, rounded corners are disabled.",
        },
        {
            name: "variant",
            type: "'elevation'\n| 'outlined'",
            default_value: "'elevation'",
            description: "The variant to use.",
        },
    ]
    demos_list: [
        {
            name: "Cards",
//            url: "/iconpage",
        },
        {
            name: "Paper",
            url: "/paperpage",
        },
    ]
}
