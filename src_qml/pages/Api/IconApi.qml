import QtQuick

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
            name: "size",
            type: "int",
            default_value: "",
            description: "The fontSize applied to the icon.",
        },
        {
            name: "text",
            type: "string",
            default_value: "",
            description: "The text content of the Item.This will override name.",
        },
    ]
    demos_list: [
        {
            name: "Icons",
            url: "/iconpage",
        },
    ]
}
