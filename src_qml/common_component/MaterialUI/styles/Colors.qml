pragma Singleton

import QtQuick 2.15

QtObject {
    readonly property string commonBlack: '#000000'
    readonly property string commonWhite: '#ffffff'
    readonly property string commonTransparent: '#00ffffff'

    function alpha(color, value) {
        let simple_color = ''
        if (color.length === 9) {
            simple_color = color.substring(3, 9)
        }
        else {
            simple_color = color.substring(1, 7)
        }

        let alpha_str = parseInt(255*value).toString(16)
        if (alpha_str.length < 2) {
            alpha_str = '0'+alpha_str
        }

        return `#${alpha_str}${simple_color}`
    }

    function addAlpha(color, value) {
        let simple_color = ''
        let old_alpha = 1
        if (color.length === 9) {
            simple_color = color.substring(3, 9)
            old_alpha = parseInt(color.substring(1, 3), 16)/255
        }
        else {
            simple_color = color.substring(1, 7)
        }

        let alpha_str = parseInt(255*value*old_alpha).toString(16)
        if (alpha_str.length < 2) {
            alpha_str = '0'+alpha_str
        }

        return `#${alpha_str}${simple_color}`
    }
}
