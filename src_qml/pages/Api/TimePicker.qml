import QtQuick 2.13

BaseApi {
    name: "TimePicker"
    props_list: [
        {
            name: "color",
            type: "'primary'\n| 'secondary'\n|  color",
            default_value: "'primary'",
            description: "The color of the component. It supports those theme colors that make sense for this component.",
        },
        {
            name: "disabled",
            type: "bool",
            default_value: "false",
            description: "If true, the picker will be disabled.",
        },
        {
            name: "size",
            type: "'medium'\n| 'small'",
            default_value: "'medium'",
            description: "The size of the picker. small is equivalent to the dense picker styling.",
        },
        {
            name: "value",
            type: "Date",
            default_value: "new Date()",
            description: "The date value.",
        },
        {
            name: "variant",
            type: "'standard'\n| 'outlined'\n| 'filled'",
            default_value: "'standard'",
            description: "The variant to use.",
        },
    ]
    demos_list: [
        {
            name: "Date/Time Pickers",
             url: "/datetimepickerpage",
        },
    ]
}
