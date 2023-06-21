pragma Singleton

import QtQuick 2.0

// 原版
QtObject {
    // readonly property int fontSize: 14 // The default font size of the Material Specification.
    readonly property int fontWeightLight: Font.Thin
    readonly property int fontWeightRegular: Font.Normal
    readonly property int fontWeightMedium: Font.DemiBold // or Medium
    readonly property real scale: Qt.platform.os === "windows" ? 0.8 : 1 // Mac 1; Win 0.8; need to test

    readonly property var fontStyleList: ({
        "h1": {
            size: 96*scale,
            weight: fontWeightLight,
            line_height: 1.05, // 1.167
            letter_spacing: -1.5,
        },
        "h2": {
            size: 60*scale,
            weight: fontWeightLight,
            line_height: 1.05, // 1.2
            letter_spacing: -0.5,
        },
        "h3": {
            size: 48*scale,
            weight: Font.Normal,
            line_height: 1.05, // 1.167
            letter_spacing: 0,
        },
        "h4": {
            size: 34*scale,
            weight: fontWeightRegular,
            line_height: 1.12, // 1.235
            letter_spacing: 0.25,
        },
        "h5": {
            size: 24*scale,
            weight: fontWeightRegular,
            line_height: 1.22, // 1.334
            letter_spacing: 0,
        },
        "h6": {
            size: 20*scale,
            weight: fontWeightMedium,
            line_height: 1.4, // 1.6
            letter_spacing: 0.15,
        },
        "subtitle1": {
            size: 16*scale,
            weight: fontWeightRegular,
            line_height: 1.6, // 1.75
            letter_spacing: 0.15,
        },
        "subtitle2": {
            size: 14*scale,
            weight: fontWeightMedium,
            line_height: 1.4, // 1.57
            letter_spacing: 0.1,
        },
        "body1": {
            size: 16*scale,
            weight: fontWeightRegular,
            line_height: 1.35, // 1.5
            letter_spacing: 0.15,
        },
        "body2": {
            size: 14*scale,
            weight: fontWeightRegular,
            line_height: 1.3, // 1.43
            letter_spacing: 0.15,
        },
        "button": {
            size: 14*scale,
            weight: fontWeightMedium,
            line_height: 1.6, // line_height: 1.75,
            letter_spacing: 0.4,
            // text-transform: uppercase;
        },
        "caption": {
            size: 12*scale,
            weight: fontWeightRegular,
            line_height: 1.5, // 1.66
            letter_spacing: 0.4,
        },
        "overline": {
            size: 12*scale,
            weight: fontWeightRegular,
            line_height: 2.5, // 2.66
            letter_spacing: 1,
            // text-transform: uppercase;
        }
        // "little": 10
    })

    function convertFontSize(size) {
        return size*scale
    }
}
