import QtQuick 2.15
import QtQuick.Controls 2.15
import "./styles"
import "./colors"

MPopover {
    id: control
    width: 220
    property var initColor: null

    signal change(string color)



    // 输入颜色相关
    property var defaultColor: ({
        r: 0, g: 0, b: 0, a: 100,
    })
    property var color_input: defaultColor

    onAboutToShow: {
        resetColor()
    }

    function resetColor() {
        let init_color = initColor
        if (!init_color) {
            init_color = '#000000'
        }
        let init_rgb = strToRgb(init_color)
        if (!init_rgb.a && init_rgb.a !== 0) {
            init_rgb.a = 100
        }
        handleChangeColor(init_rgb, '')
    }

    function handleChangeColor(current_color, skip_handle) {
        if (!current_color.a && current_color.a !== 0) {
            current_color.a = 100
        }
//        console.log(JSON.stringify(current_color), skip_handle)

        color_input = current_color
        let current_hsv = rgb2hsv(current_color)

        if (skip_handle !== 'pos' && skip_handle !== 'hue' && skip_handle !== 'alpha') {
            hsv_bg.color = rgbToStr(hsv2rgb(current_hsv.h, 100, 100))
        }
        if (skip_handle !== 'pos' && skip_handle !== 'hue' && skip_handle !== 'alpha') {
            cursor.x = current_hsv.s/100*cursor_container.width-cursor.width/2
            cursor.y = (1-current_hsv.v/100)*cursor_container.height-cursor.height/2
        }
        if (skip_handle !== 'hue' && skip_handle !== 'pos' && skip_handle !== 'alpha') {
            color_slider.value = current_hsv.h
        }
        if (skip_handle !== 'alpha') {
            opacity_slider.value = current_color.a
        }
        if (skip_handle !== 'hex') {
            hex_input.text = rgbToStr(current_color)
        }
        if (skip_handle !== 'rgba') {
            let key_map = ['r', 'g', 'b', 'a']
            for (let i = 0; i < rgba_input.count; i++) {
                let item = rgba_input.itemAt(i)
                let input_item = item.children[0]
                input_item.text = current_color[key_map[i]]
            }
        }
    }

    function to16Str(num) {
        let str = num.toString(16)
        if (str.length === 1) {
            str = '0'+str
        }
        if (str.length === 0) {
            str = '00'
        }
        return str
    }


    function strToRgb(color_str) {
        if (!color_str) {
            return null
        }
        color_str = color_str.toLowerCase()
        if (color_str[0] === '#' && color_str.length === 9 && /^[a-zA-Z0-9]+$/.test(color_str.substring(1, 9))) {
            let a_str = color_str.substring(1, 3)
            let r_str = color_str.substring(3, 5)
            let g_str = color_str.substring(5, 7)
            let b_str = color_str.substring(7, 9)
            return {
                r: parseInt(r_str, 16),
                g: parseInt(g_str, 16),
                b: parseInt(b_str, 16),
                a: parseInt(parseInt(a_str, 16)/255*100),
            }
        }
        if (color_str[0] === '#' && color_str.length === 7 && /^[a-zA-Z0-9]+$/.test(color_str.substring(1, 7))) {
            let r_str = color_str.substring(1, 3)
            let g_str = color_str.substring(3, 5)
            let b_str = color_str.substring(5, 7)
            return {
                r: parseInt(r_str, 16),
                g: parseInt(g_str, 16),
                b: parseInt(b_str, 16),
            }
        }
        if (color_str[0] === '#' && color_str.length === 4 && /^[a-zA-Z0-9]+$/.test(color_str.substring(1, 4))) {
            let r_str = color_str.substring(1, 2)
            let g_str = color_str.substring(2, 3)
            let b_str = color_str.substring(3, 4)
            return {
                r: parseInt(r_str+r_str, 16),
                g: parseInt(g_str+g_str, 16),
                b: parseInt(b_str+b_str, 16),
            }
        }
        var ans = null
        if (/rgb\(.*\)/g.test(color_str)) {
            ans = /rgb\((.*)\)/g.exec(color_str)
            if (ans[1]) {
                let rgb_list = ans[1].split(',')
                return ({
                    r: parseInt(rgb_list[0].replace(' ', '')),
                    g: parseInt(rgb_list[1].replace(' ', '')),
                    b: parseInt(rgb_list[2].replace(' ', '')),
                })
            }
        }
        if (/rgba\(.*\)/g.test(color_str)) {
            ans = /rgba\((.*)\)/g.exec(color_str)
            if (ans[1]) {
                let rgb_list = ans[1].split(',')
                return ({
                    r: parseInt(rgb_list[0].replace(' ', '')),
                    g: parseInt(rgb_list[1].replace(' ', '')),
                    b: parseInt(rgb_list[2].replace(' ', '')),
                })
            }
        }
        return null
    }

    function rgbaToStr(color) {
        return `#${control.to16Str(parseInt(color.a/100*255))}${control.to16Str(color.r)}${control.to16Str(color.g)}${control.to16Str(color.b)}`

    }

    function rgbToStr(color) {
        return `#${control.to16Str(color.r)}${control.to16Str(color.g)}${control.to16Str(color.b)}`
    }

    function hsv2rgb(h, s, v) {
        let hsv_h = (h / 360).toFixed(2);
        let hsv_s = (s / 100).toFixed(2);
        let hsv_v = (v / 100).toFixed(2);

        var i = Math.floor(hsv_h * 6);
        var f = hsv_h * 6 - i;
        var p = hsv_v * (1 - hsv_s);
        var q = hsv_v * (1 - f * hsv_s);
        var t = hsv_v * (1 - (1 - f) * hsv_s);

        var rgb_r = 0,
            rgb_g = 0,
            rgb_b = 0;
        switch (i % 6) {
            case 0:
                rgb_r = hsv_v;
                rgb_g = t;
                rgb_b = p;
                break;
            case 1:
                rgb_r = q;
                rgb_g = hsv_v;
                rgb_b = p;
                break;
            case 2:
                rgb_r = p;
                rgb_g = hsv_v;
                rgb_b = t;
                break;
            case 3:
                rgb_r = p;
                rgb_g = q;
                rgb_b = hsv_v;
                break;
            case 4:
                rgb_r = t;
                rgb_g = p;
                rgb_b = hsv_v;
                break;
            case 5:
                rgb_r = hsv_v;
                rgb_g = p;
                rgb_b = q;
                break;
        }

        // return 'rgb(' + (Math.floor(rgb_r * 255) + "," + Math.floor(rgb_g * 255) + "," + Math.floor(rgb_b * 255)) + ')';
        return {
            r: Math.floor(rgb_r * 255),
            g: Math.floor(rgb_g * 255),
            b: Math.floor(rgb_b * 255),
        }
    }

    function rgb2hsv(color) {
        // let rgb = color.split(',');
        // let R = parseInt(rgb[0].split('(')[1]);
        // let G = parseInt(rgb[1]);
        // let B = parseInt(rgb[2].split(')')[0]);
        let R = color.r
        let G = color.g
        let B = color.b

        let hsv_red = R / 255, hsv_green = G / 255, hsv_blue = B / 255;
        let hsv_max = Math.max(hsv_red, hsv_green, hsv_blue),
            hsv_min = Math.min(hsv_red, hsv_green, hsv_blue);
        let hsv_h, hsv_s, hsv_v = hsv_max;

        let hsv_d = hsv_max - hsv_min;
        hsv_s = hsv_max == 0 ? 0 : hsv_d / hsv_max;

        if (hsv_max == hsv_min) hsv_h = 0;
        else {
            switch (hsv_max) {
                case hsv_red:
                    hsv_h = (hsv_green - hsv_blue) / hsv_d + (hsv_green < hsv_blue ? 6 : 0);
                    break;
                case hsv_green:
                    hsv_h = (hsv_blue - hsv_red) / hsv_d + 2;
                    break;
                case hsv_blue:
                    hsv_h = (hsv_red - hsv_green) / hsv_d + 4;
                    break;
            }
            hsv_h /= 6;
        }
        return {
            h: (hsv_h * 360).toFixed(),
            s: (hsv_s * 100).toFixed(),
            v: (hsv_v * 100).toFixed()
        }
    }

    Column {
        padding: 10

        Rectangle {
            id: hsv_bg
            width: 200
            height: 150
            color: "#ff0000"

            Rectangle {
                anchors.fill: parent

                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0; color: "#ffffffff" }
                    GradientStop { position: 1.0; color: "#00ffffff" }
                }
            }

            Rectangle {
                anchors.fill: parent

                gradient: Gradient {
                    orientation: Gradient.Vertical
                    GradientStop { position: 0.0; color: "#00000000" }
                    GradientStop { position: 1.0; color: "#ff000000" }
                }
            }

            MouseArea {
                id: cursor_container
                anchors.fill: parent

                function moveCursor(mouse_x, mouse_y) {
                    let to_x = Math.min(Math.max(0, mouse_x), cursor_container.width)
                    let to_y = Math.min(Math.max(0, mouse_y), cursor_container.height)

                    cursor.x = to_x-cursor.width/2
                    cursor.y = to_y-cursor.height/2

                    let hsv_s = to_x/width*100
                    let hsv_v = (1-to_y/height)*100
                    let current_hsv = rgb2hsv(color_input)
                    let current_color = hsv2rgb(color_slider.value, hsv_s, hsv_v)
                    current_color.a = color_input.a
                    handleChangeColor(current_color, 'pos')
                }

                onPressed: {
                    moveCursor(mouse.x, mouse.y)
                }

                onPositionChanged: {
                    moveCursor(mouse.x, mouse.y)

                }

                onReleased: {
                    moveCursor(mouse.x, mouse.y)
                }
            }

            Rectangle {
                id: cursor
                width: 14
                height: 14
                color: "#ffffff"
                radius: 7

                layer.enabled: true
                layer.effect: MShadow {
                    elevation: 1
                }

                MouseArea {
                    anchors.fill: parent
//                    enabled: false
                    cursorShape: Qt.PointingHandCursor

                    onPressed: {
                        cursor_container.moveCursor(cursor.x+mouse.x, cursor.y+mouse.y)
                    }

                    onPositionChanged: {
                        cursor_container.moveCursor(cursor.x+mouse.x, cursor.y+mouse.y)
                    }

                    onReleased: {
                        cursor_container.moveCursor(cursor.x+mouse.x, cursor.y+mouse.y)
                    }
                }
            }
        }

        Rectangle {
            width: 200
            height: 5
        }

        Row {
            spacing: 5

            Column {
                Slider {
                    id: color_slider
                    width: 165
                    height: 20
                    from: 0
                    to: 360
                    stepSize: 1
                    value: 0

                    onMoved: {
                        let current_hsv = rgb2hsv(color_input)
                        let new_color = hsv2rgb(value, current_hsv.s, current_hsv.v)
                        new_color.a = color_input.a
                        handleChangeColor(new_color, 'hue')
                        hsv_bg.color = rgbToStr(hsv2rgb(value, 100, 100))
                    }

                    background: Rectangle {
                        x: color_slider.leftPadding
                        y: color_slider.topPadding + color_slider.availableHeight / 2 - height / 2
                        implicitWidth: 120
                        implicitHeight: 10
                        width: color_slider.availableWidth
                        height: implicitHeight

                        gradient: Gradient {
                            orientation: Gradient.Horizontal
                            GradientStop { position: 0.0; color: "#ff0000" }
                            GradientStop { position: 0.17; color: "#ffff00" }
                            GradientStop { position: 0.33; color: "#00ff00" }
                            GradientStop { position: 0.5; color: "#00ffff" }
                            GradientStop { position: 0.67; color: "#0000ff" }
                            GradientStop { position: 0.83; color: "#ff00ff" }
                            GradientStop { position: 1.0; color: "#ff0000" }
                        }

                        MouseArea {
                            anchors.fill: parent
                            enabled: false
                            cursorShape: Qt.PointingHandCursor
                        }
                    }

                    handle: Rectangle {
                        x: color_slider.leftPadding + color_slider.visualPosition * color_slider.availableWidth - width/2
                        y: color_slider.topPadding + color_slider.availableHeight / 2 - height / 2
                        implicitWidth: 14
                        implicitHeight: 14
                        color: "#ffffff"
                        radius: 7

                        layer.enabled: true
                        layer.effect: MShadow {
                            elevation: 1
                        }
                    }
                }

                Slider {
                    id: opacity_slider
                    width: 165
                    height: 20
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 100

                    onMoved: {
                        let new_color = Object.assign({}, color_input)
                        new_color.a = value
                        handleChangeColor(new_color, 'alpha')
                    }

                    background: Rectangle {
                        x: opacity_slider.leftPadding
                        y: opacity_slider.topPadding + opacity_slider.availableHeight / 2 - height / 2
                        implicitWidth: 120
                        implicitHeight: 10
                        width: opacity_slider.availableWidth
                        height: implicitHeight

                        gradient: Gradient {
                            orientation: Gradient.Horizontal
                            GradientStop { position: 0.0; color: "#00000000" }
                            GradientStop { position: 1.0; color: rgbaToStr(Object.assign({}, color_input, {a: 100}))}
                        }

                        MouseArea {
                            anchors.fill: parent
                            enabled: false
                            cursorShape: Qt.PointingHandCursor
                        }
                    }

                    handle: Rectangle {
                        x: opacity_slider.leftPadding + opacity_slider.visualPosition * opacity_slider.availableWidth - width/2
                        y: opacity_slider.topPadding + opacity_slider.availableHeight / 2 - height / 2
                        implicitWidth: 14
                        implicitHeight: 14
                        color: "#ffffff"
                        radius: 7

                        layer.enabled: true
                        layer.effect: MShadow {
                            elevation: 1
                        }
                    }
                }
            }

            Rectangle {
                y: 5
                width: 30
                height: 30
                color: rgbaToStr(color_input)
                radius: 3
                border.width: 1
                border.color: '#dddddd'
            }
        }

        Row {
            topPadding: 5
            bottomPadding: 5
            spacing: 5

            Column {
                id: column
                MOutlinedInput {
                    id: hex_input
                    width: 60
                    height: 20
                    topPadding: 0
                    rightPadding: 5
                    bottomPadding: 0
                    leftPadding: 5
                    font.pointSize: TypographyStyle.convertFontSize(12)

                    onTextEdited: {
                        let hex_text = hex_input.text
                        let ans_color = strToRgb(hex_text[0] === '#' ? hex_text : '#'+hex_text)
                        if (ans_color) {
                            ans_color.a = control.color_input.a
                            handleChangeColor(ans_color, 'hex')
                        }
                    }
                }

                MTypography {
                    font.pointSize: TypographyStyle.convertFontSize(12)
                    text: 'Hex'
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Repeater {
                id: rgba_input
                model: ['R', 'G', 'B', 'A']
                delegate:  Column {
                    MOutlinedInput {
                        width: 30
                        height: 20
                        topPadding: 0
                        rightPadding: 5
                        bottomPadding: 0
                        leftPadding: 5
                        font.pointSize: TypographyStyle.convertFontSize(12)

                        onTextEdited: {
                            let key_text = text
                            if (/^[0-9]+$/.test(key_text)) {
                                let key_value = parseInt(key_text)
                                if (key_value <= 255 || (modelData === 'A' && key_value <= 100)) {
                                    let new_color = Object.assign({}, color_input)
                                    new_color[modelData.toLowerCase()] = key_value
                                    handleChangeColor(new_color, 'rgba')
                                }
                            }
                        }
                    }

                    MTypography {
                        font.pointSize: TypographyStyle.convertFontSize(12)
                        text: modelData
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }

        MDivider {
            width: 200
        }

        Flow {
            width: 200
            topPadding: 10
            bottomPadding: 10
            spacing: 10

            Repeater {
                model: [
                    '#D0021B', '#F5A623', '#F8E71C', '#8B572A', '#7ED321', '#417505', '#BD10E0', '#9013FE',
                    '#4A90E2', '#50E3C2', '#B8E986', '#000000', '#4A4A4A', '#9B9B9B', '#FFFFFF'
                ]
                delegate: Rectangle {
                    width: 16
                    height: 16
                    radius: 3
                    color: modelData
                    border.width: 1
                    border.color: '#dddddd'

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            handleChangeColor(strToRgb(modelData), '')
                        }
                    }
                }
            }
        }

        MDivider {
            width: 200
        }

        Row {
            topPadding: 5

            MButton {
                width: 100
                text: '重置'
                focusPolicy: Qt.NoFocus

                onClicked: {
                    resetColor()
                }
            }

            MButton {
                width: 100
                color: 'primary'
                text: '确定'
                focusPolicy: Qt.NoFocus

                onClicked: {
                    let ans_color = ''
                    if (color_input.a === 100) {
                        ans_color = rgbToStr(color_input)
                    }
                    else if (!color_input.a && color_input.a !== 0) {
                        ans_color = rgbToStr(color_input)
                    }
                    else {
                        ans_color = rgbaToStr(color_input)
                    }
                    change(ans_color)
                    control.close()
                }
            }
        }
    }
}
