import QtQuick 2.13

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
