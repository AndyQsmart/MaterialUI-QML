import QtQuick 2.13

BaseApi {
    name: "Button"
    props_description: "Any other props supplied will be provided to the root Item (Window)."
    inheritance_description: "The props of the Window component are also available. You can take advantage of this behavior to target nested components."
    props_list: [
        {
            name: "backgroundColor",
            type: "color",
            default_value: "'#ffffff'",
            description: "The background color of the component.",
        },
        {
            name: "darkMode",
            type: "bool",
            default_value: "false",
            description: "If true, the window will render in dark mode.",
        },
        {
            name: "disableCloseButton",
            type: "bool",
            default_value: "false",
            description: "If true, the close button will be disabled.",
        },
        {
            name: "disableMaximizeButton",
            type: "bool",
            default_value: "false",
            description: "If true, the close maximize will be disabled.",
        },
        {
            name: "disableMinimizeButton",
            type: "bool",
            default_value: "false",
            description: "If true, the close minimize will be disabled.",
        },
        {
            name: "dragBar",
            type: "Item",
            default_value: "",
            description: "[realonly] You can access to the dragBar, and change dragBar's property.",
        },
        {
            name: "enableBorderShadow",
            type: "bool",
            default_value: "true",
            description: "If false, the system border shadow will be disabled.",
        },
        {
            name: "macSystemButtonBar",
            type: "Item",
            default_value: "",
            description: "[realonly] You can access to the macSystemButtonBar, and change macSystemButtonBar's property.",
        },
        {
            name: "macSystemButtonBar",
            type: "string",
            default_value: "Qt.platform.os === 'osx' ? 'mac' : 'win'",
            description: "The system type of the window.",
        },
        {
            name: "winSystemButtonBar",
            type: "Item",
            default_value: "",
            description: "[realonly] You can access to the winSystemButtonBar, and change winSystemButtonBar's property.",
        },
    ]
    demos_list: [
        {
            name: "Frameless Window",
            url: "/framelesswindowpage",
        },
    ]
}
