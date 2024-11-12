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
    name: "SvgIcon"
    props_list: [
        {
            name: "color",
            type: "'default'\n| 'primary'\n| 'secondary'\n| 'textSecondary'\n| 'error'\n| color",
            default_value: "",
            description: "The color of the icon.",
        },
        {
            name: "fontSize",
            type: "'small'\n| 'medium'\n| 'large'",
            default_value: "'medium'",
            description: "The fontSize applied to the icon.",
        },
        {
            name: "name",
            type: "string",
            default_value: "",
            description: "The name of the icon.",
        },
        {
            name: "size",
            type: "real",
            default_value: "",
            description: "The size applied to the icon.This will override fontSize.",
        },
        {
            name: "variant",
            type: "'filled'\n| 'outliend'\n| 'rounded'\n| 'two tone'\n| 'sharp'",
            default_value: "'filled'",
            description: "The variant of the Icon.",
        },
    ]
    demos_list: [
        {
            name: "Icons",
            url: "/iconpage",
        },
    ]
}