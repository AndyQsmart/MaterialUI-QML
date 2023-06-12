pragma Singleton

import QtQuick 2.0
import "../colors"

QtObject {
    readonly property string lightActionActive: Colors.alpha('#000000', 0.54)
    // The color of an hovered action.
    readonly property string lightActionHover: Colors.alpha('#000000', 0.08)
    readonly property double lightActionHoverOpacity: 0.08
    // The color of a selected action.
    readonly property string lightActionSelected: Colors.alpha('#000000', 0.14)
    // The color of a disabled action.
    readonly property string lightActionDisabled: Colors.alpha('#000000', 0.26)
    // The background color of a disabled action.
    readonly property string lightActionDisabledBackground: Colors.alpha('#000000', 0.12)
    // The most important text.
    readonly property string lightTextPrimary: Colors.alpha('#000000', 0.87)
    // Secondary text.
    readonly property string lightTextSecondary: Colors.alpha('#000000', 0.54)
    // Disabled text have even lower visual prominence.
    readonly property string lightTextDisabled: Colors.alpha('#000000', 0.38)
    // Text hints.
    readonly property string lightTextHint: Colors.alpha('#000000', 0.38)
    // The color used to divide different elements.
    readonly property string lightTextDivider: Colors.alpha('#000000', 0.12)
    // The background colors used to style the surfaces.
    // Consistency between these values is important.
    readonly property string lightBackgroundPaper: Colors.commonWhite
    readonly property string lightBackgroundDefault: Grey._50

    readonly property string darkTextPrimary: Colors.commonWhite
    readonly property string darkTextSecondary: Colors.alpha('#ffffff', 0.7)
    readonly property string darkTextDisabled: Colors.alpha('#ffffff', 0.5)
    readonly property string darkTextHint: Colors.alpha('#ffffff', 0.5)
    readonly property string darkTextIcon: Colors.alpha('#ffffff', 0.5)
    readonly property string darkDivider: Colors.alpha('#ffffff', 0.12)
    readonly property string darkBackgroundPaper: Grey._800;
    readonly property string darkBackgroundDefault: '#303030'
    readonly property string darkActionActive: Colors.commonWhite;
    readonly property string darkActionHover: Colors.alpha('#ffffff', 0.1)
    readonly property double darkActionHoverOpacity: 0.1
    readonly property string darkActionSelected: Colors.alpha('#ffffff', 0.2)
    readonly property string darkActionDisabled: Colors.alpha('#ffffff', 0.3)
    readonly property string darkActionDisabledBackground: Colors.alpha('#ffffff', 0.12)

//    readonly property string primaryLight: Indigo._300
//    readonly property string primaryMain: Indigo._500
//    readonly property string primaryDark: Indigo._700
    readonly property string primaryLight: "#6ec6ff"
    readonly property string primaryMain: "#2196f3"
    readonly property string primaryDark: "#0069c0"
//    readonly property string secondaryLight: Pink.a200
//    readonly property string secondaryMain: Pink.a400
//    readonly property string secondaryDark: Pink.a700
    readonly property string secondaryLight: "#ff5983"
    readonly property string secondaryMain: "#f50057"
    readonly property string secondaryDark: "#bb002f"
    readonly property string errorLight: Red._300
    readonly property string errorMain: Red._500
    readonly property string errorDark: Red._700

    readonly property int unit: 8

    function string2Color(color_name, default_color) {
        switch (color_name) {
            case 'primary':
                return primaryMain
            case 'secondary':
                return secondaryMain
            case 'textPrimary':
                return lightTextPrimary
            case 'textSecondary':
                return lightTextSecondary
            default:
                return default_color
        }
    }

    function string2ColorDark(color_name, default_color) {
        switch (color_name) {
            case 'primary':
                return primaryDark
            case 'secondary':
                return secondaryDark
            default:
                return default_color
        }
    }
}
