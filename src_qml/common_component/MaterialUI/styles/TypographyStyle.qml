pragma Singleton

import QtQuick 2.15

// 原版
QtObject {
    // readonly property int fontSize: 14 // The default font size of the Material Specification.
    readonly property int fontWeightLight: Font.Thin
    readonly property int fontWeightRegular: Font.Normal
    readonly property int fontWeightMedium: Font.DemiBold // or Medium
    readonly property real scale: Qt.platform.os === "windows" ? 0.8 : 1 // Mac 1; Win 0.8; need to test

    readonly property var fontStyleList: ({
        "h1": {
            size: convertFontSize(96),
            weight: fontWeightLight,
            line_height: 1.05/scale, // 1.167
            letter_spacing: -1.5,
        },
        "h2": {
            size: convertFontSize(60),
            weight: fontWeightLight,
            line_height: 1.05/scale, // 1.2
            letter_spacing: -0.5,
        },
        "h3": {
            size: convertFontSize(48),
            weight: Font.Normal,
            line_height: 1.05/scale, // 1.167
            letter_spacing: 0,
        },
        "h4": {
            size: convertFontSize(34),
            weight: fontWeightRegular,
            line_height: 1.12/scale, // 1.235
            letter_spacing: 0.25,
        },
        "h5": {
            size: convertFontSize(24),
            weight: fontWeightRegular,
            line_height: 1.22/scale, // 1.334
            letter_spacing: 0,
        },
        "h6": {
            size: convertFontSize(20),
            weight: fontWeightMedium,
            line_height: 1.4/scale, // 1.6
            letter_spacing: 0.15,
        },
        "subtitle1": {
            size: convertFontSize(16),
            weight: fontWeightRegular,
            line_height: 1.6/scale, // 1.75
            letter_spacing: 0.15,
        },
        "subtitle2": {
            size: convertFontSize(14),
            weight: fontWeightMedium,
            line_height: 1.4/scale, // 1.57
            letter_spacing: 0.1,
        },
        "body1": {
            size: convertFontSize(16),
            weight: fontWeightRegular,
            line_height: 1.35/scale, // 1.5
            letter_spacing: 0.15,
        },
        "body2": {
            size: convertFontSize(14),
            weight: fontWeightRegular,
            line_height: 1.3/scale, // 1.43
            letter_spacing: 0.15,
        },
        "button": {
            size: convertFontSize(14),
            weight: fontWeightMedium,
            line_height: 1.6/scale, // line_height: 1.75,
            letter_spacing: 0.4,
            // text-transform: uppercase;
        },
        "caption": {
            size: convertFontSize(12),
            weight: fontWeightRegular,
            line_height: 1.5/scale, // 1.66
            letter_spacing: 0.4,
        },
        "overline": {
            size: convertFontSize(12),
            weight: fontWeightRegular,
            line_height: 2.5/scale, // 2.66
            letter_spacing: 1,
            // text-transform: uppercase;
        }
        // "little": 10
    })

    function convertFontSize(size) {
        return parseInt(size*scale)
    }

    function convertLineHeight(line_height) {
        return line_height/scale
    }
}
