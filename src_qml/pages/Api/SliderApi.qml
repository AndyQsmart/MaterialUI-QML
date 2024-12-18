import QtQuick 2.15

BaseApi {
    name: "Slider"
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
            description: "If true, the slider will be disabled.",
        },
        {
            name: "marks",
            type: "bool",
            default_value: "false",
            description: "Marks indicate predetermined values to which the user can move the slider. If true the marks will be spaced according the value of the step prop. ",
        },

        {
            name: "max",
            type: "number",
            default_value: "100",
            description: "The maximum allowed value of the slider. Should not be equal to min.",
        },
        {
            name: "min",
            type: "number",
            default_value: "0",
            description: "The minimum allowed value of the slider. Should not be equal to max.",
        },
        {
            name: "orientation",
            type: "'horizontal'\n| 'vertical'",
            default_value: "'horizontal'",
            description: "The slider orientation.",
        },
        {
            name: "step",
            type: "number",
            default_value: "1",
            description: "The granularity with which the slider can step through values. (A \"discrete\" slider.) The min prop serves as the origin for the valid values. We recommend (max - min) to be evenly divisible by the step.When step is null, the thumb can only be slid onto marks provided with the marks prop.",
        },
        {
            name: "value",
            type: "number",
            default_value: "0",
            description: "The element value.",
        },
        {
            name: "valueLabelDisplay",
            type: "'on'\n| 'auto'\m| 'off'",
            default_value: "'off'",
            description: "Controls when the value label is displayed: - auto the value label will display when the thumb is hovered or focused. - on will display persistently. - off will never display.",
        },
        {
            name: "valueLabelFormat",
            type: "func",
            default_value: "(x) => x",
            description: "The format function the value label's value.When a function is provided, it should have the following signature: - {number} value The value label's value to format",
        },
    ]
    demos_list: [
        {
            name: "Slider",
            url: "/sliderpage",
        },
    ]
}
