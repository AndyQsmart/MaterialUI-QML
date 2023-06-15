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

// Icon demo 未实现

BaseApi {
    name: "Icon"
    props_description: "Any other props supplied will be provided to the root Item (native Text Item)."
    inheritance_description: "The props of the Text component are also available. You can take advantage of this behavior to target nested components."
    props_list: [
        {
            name: "children",
            type: "Item",
            default_value: "",
            description: "The content of the Item.",
        },
        {
            name: "name",
            type: "string",
            default_value: "",
            description: "The name of the icon.",
        },
        {
            name: "text",
            type: "string",
            default_value: "",
            description: "The text content of the Item.This will override name.",
        },
        {
            name: "size",
            type: "int",
            default_value: "",
            description: "The fontSize applied to the icon.The alias of font.pointSize",
        },
    ]
    demos_list: [
        {
            name: "Icons",
            url: "/iconpage",
        },
    ]
}
