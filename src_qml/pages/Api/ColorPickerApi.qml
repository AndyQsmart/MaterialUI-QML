import QtQuick 2.13

BaseApi {
    name: "ColorPicker"
    props_description: "Any other props supplied will be provided to the root Item (MPopover)."
    inheritance_description: "The props of the Popover component are also available. You can take advantage of this behavior to target nested components."
    props_list: [
        {
            name: "initColor",
            type: "color",
            default_value: "#000000",
            description: "The init color of the component.",
        },
        {
            name: "onChange",
            type: "func",
            default_value: "",
            description: "Callback when select done, callback with a color param",
        },
    ]
    demos_list: [
        {
            name: "Color Picker",
            url: "/colorpickerpage",
        },
    ]
}
