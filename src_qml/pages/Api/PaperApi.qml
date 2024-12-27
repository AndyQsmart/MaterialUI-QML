import QtQuick

BaseApi {
    name: "Paper"
    props_description: "Any other props supplied will be provided to the root Item (native Rectangle Item)."
    inheritance_description: "The props of the Rectangle component are also available. You can take advantage of this behavior to target nested components."
    props_list: [
        {
            name: "children",
            type: "Item",
            default_value: "",
            description: "The content of the Item.",
        },
        {
            name: "elevation",
            type: "int",
            default_value: "1",
            description: "Shadow depth, corresponds to dp in the spec. It accepts values between 0 and 24 inclusive.",
        },
        {
            name: "square",
            type: "bool",
            default_value: "false",
            description: "If true, rounded corners are disabled.",
        },
        {
            name: "variant",
            type: "'elevation'\n| 'outlined'",
            default_value: "'elevation'",
            description: "The variant to use.",
        },
    ]
    demos_list: [
        {
            name: "Cards",
//            url: "/iconpage",
        },
        {
            name: "Paper",
            url: "/paperpage",
        },
    ]
}
