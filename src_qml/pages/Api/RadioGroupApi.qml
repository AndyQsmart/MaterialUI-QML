import QtQuick

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
