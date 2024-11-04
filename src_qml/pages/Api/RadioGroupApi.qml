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
    name: "RadioGroup"
    props_list: [
        {
            name: "children",
            type: "MRadio\n| MFormControlLabel",
            default_value: "",
            description: "The content of the component.",
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
