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
    name: "ColorPicker"
    props_description: "Any other props supplied will be provided to the root Item (MPopover)."
    inheritance_description: "The props of the Popover component are also available. You can take advantage of this behavior to target nested components."
    props_list: [
        {
            name: "initColor",
            type: "color",
            default_value: "#000000",
            description: "The init color of the component.",
        },
        {
            name: "onChange",
            type: "func",
            default_value: "",
            description: "Callback when select done, callback with a color param",
        },
    ]
    demos_list: [
        {
            name: "Color Picker",
             url: "/colorpickerpage",
        },
    ]
}
