import QtQuick 2.13

BaseApi {
    name: "Checkbox"
    props_list: [
        {
            name: "checked",
            type: "bool",
            default_value: "",
            description: "If true, the component is checked.",
        },
        {
            name: "color",
            type: "'default'\n| 'primary'\n| 'secondary'\n|  color",
            default_value: "'secondary'",
            description: "The color of the component. It supports those theme colors that make sense for this component.",
        },
        {
            name: "disabled",
            type: "bool",
            default_value: "false",
            description: "If true, the button will be disabled.",
        },
        {
            name: "disableRipple",
            type: "bool",
            default_value: "false",
            description: "If true, the ripple effect will be disabled.",
        },
    ]
    demos_list: [
        {
            name: "Checkboxes",
            url: "/checkboxpage",
        },
    ]
}
