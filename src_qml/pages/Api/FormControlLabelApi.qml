import QtQuick

BaseApi {
    name: "FormControlLabel"
    props_list: [
        {
            name: "checked",
            type: "bool",
            default_value: "",
            description: "If true, the component appears selected.",
        },
        {
            name: "control",
            type: "'Item",
            default_value: "",
            description: "A control element. For instance, it can be be a Radio, a Switch or a Checkbox.",
        },
        {
            name: "disabled",
            type: "bool",
            default_value: "false",
            description: "If true, the button will be disabled.",
        },
        {
            name: "label",
            type: "string",
            default_value: "",
            description: "The text to be used in an enclosing label element.",
        },
        {
            name: "labelPlacement",
            type: "'bottom'\n| 'end'\n| 'start'\n| 'top'",
            default_value: "false",
            description: "The position of the label.",
        },
        {
            name: "value",
            type: "string",
            default_value: "",
            description: "The value of the component.",
        },
    ]
    demos_list: [
        {
            name: "Checkboxes",
            url: "/checkboxpage",
        },
        {
            name: "Radio Buttons",
            url: "/radiopage",
        },
        {
            name: "Switches",
            url: "/switchpage",
        },
    ]
}
