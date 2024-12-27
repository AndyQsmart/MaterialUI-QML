import QtQuick

BaseApi {
    name: "ButtonBase"
    props_description: "Any other props supplied will be provided to the root Item (native Button Item)."
    inheritance_description: ""
    props_list: [
        {
            name: "children",
            type: "Item",
            default_value: "",
            description: "The content of the Item.",
        },
        {
            name: "disabled",
            type: "bool",
            default_value: "false",
            description: "If true, the button will be disabled.",
        },
        {
            name: "disableCursor",
            type: "bool",
            default_value: "false",
            description: "[new] If true, the cursor style effect will be disabled.",
        },
        {
            name: "disableRipple",
            type: "bool",
            default_value: "false",
            description: "If true, the ripple effect will be disabled.",
        },
        {
            name: "fontSize",
            type: "int",
            default_value: "",
            description: "[new] The text font size of the component. Usually, you do not need to change this prop.",
        },
        {
            name: "text",
            type: "string",
            default_value: "",
            description: "The text content of the Item.",
        },
        {
            name: "textColor",
            type: "color",
            default_value: "",
            description: "[new] The text color of the component. If use this prop, ripple will be changed too.",
        },
    ]
    demos_list: [
        {
            name: "Buttons",
            url: "/buttonpage",
        },
    ]
}
