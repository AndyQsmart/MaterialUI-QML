import QtQuick

BaseApi {
    name: "Select"
    props_list: [
        {
            name: "disabled",
            type: "bool",
            default_value: "false",
            description: "If true, the select will be disabled.",
        },
        {
            name: "index",
            type: "int",
            default_value: "",
            description: "The select index.",
        },
        {
            name: "maxWidth",
            type: "double",
            default_value: "",
            description: "[new] Max width of the select",
        },
        {
            name: "minWidth",
            type: "double",
            default_value: "0",
            description: "[new] Min width of the select",
        },
        {
            name: "model",
            type: "list<string>",
            default_value: "",
            description: "The elements of the select.",
        },
        {
            name: "padding",
            type: "list<int>",
            default_value: "",
            description: "[new] Padding ofr the select",
        },
        {
            name: "placeholder",
            type: "string",
            default_value: "",
            description: "The short hint displayed in the select before the user selects a value.",
        },
        {
            name: "selectColor",
            type: "'primary'\n| 'secondary'\n|  color",
            default_value: "'primary'",
            description: "[new] The select color of the component.",
        },
        {
            name: "value",
            type: "string",
            default_value: "",
            description: "The select value. Providing an empty string will select no options. Set to an empty string '' if you don't want any of the available options to be selected. The string representation must match with the string representation of the model in order to be selected.",
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
            name: "Selects",
            url: "/selectpage",
        },
    ]
}
