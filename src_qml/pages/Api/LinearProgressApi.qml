import QtQuick

BaseApi {
    name: "LinearProgress"
    props_list: [
        {
            name: "color",
            type: "'primary'\n| 'secondary'\n|  color",
            default_value: "'primary'",
            description: "The color of the component. It supports those theme colors that make sense for this component.",
        },
        {
            name: "value",
            type: "number",
            default_value: "0",
            description: "The value of the progress indicator for the determinate and buffer variants. Value between 0 and 100.",
        },
        {
            name: "valueBuffer",
            type: "number",
            default_value: "100",
            description: "The value for the buffer variant. Value between 0 and 100.",
        },
        {
            name: "variant",
            type: "'buffer'\n| 'determinate'\n| 'indeterminate'\n| 'query'",
            default_value: "'indeterminate'",
            description: "The variant to use. Use indeterminate or query when there is no progress value.",
        },
    ]
    demos_list: [
        {
            name: "Progress",
            url: "/progresspage",
        },
    ]
}
