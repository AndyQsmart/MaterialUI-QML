import QtQuick 2.15
import "./styles"
import "./SvgIcon/FilledMap.js" as FilledMap
import "./SvgIcon/OutlinedMap.js" as OutlinedMap
import "./SvgIcon/RoundedMap.js" as RoundedMap
import "./SvgIcon/TwoToneMap.js" as TwoToneMap
import "./SvgIcon/SharpMap.js" as SharpMap

Item {
    id: root
    property string variant: "filled" // 'filled' | 'outliend' | 'rounded' | 'two tone' | 'sharp'
    property string color: "default" //'default' | 'primary' | 'secondary' | 'textSecondary' | 'error' | color
    property string fontSize: "medium" // 'small' | 'medium' | 'large'
    property string name: ""
    property real size: {
        switch (fontSize) {
            case "small":
                return 20
            case "medium":
                return 24
            case "large":
                return 35
        }
        return 24
    }





    property var nameMap: {
        switch (variant) {
            case "filled":
                return FilledMap.name
            case "outlined":
                return OutlinedMap.name
            case "rounded":
                return RoundedMap.name
            case "two tone":
                return TwoToneMap.name
            case "sharp":
                return SharpMap.name
        }
        return FilledMap.name
    }
    property string svgName: {
        switch (variant) {
            case "filled":
                return name
            case "outlined":
                return `${name}Outlined`
            case "rounded":
                return `${name}Rounded`
            case "two tone":
                return `${name}TwoTone`
            case "sharp":
                return `${name}Sharp`
        }
        return name
    }
    property var rgbaColor: Palette.colorStrToRgb(Palette.string2Color(root.color, "#000000"))

    width: size
    height: size

    Image {
        width: root.size
        height: root.size
        sourceSize.width: width*2
        sourceSize.height: height*2
        opacity: rgbaColor && (rgbaColor.a || rgbaColor.a === 0) ? rgbaColor.a/100 : 1
        source: {
            let color_str = ''
            if (rgbaColor) {
                color_str = `rgb(${rgbaColor.r},${rgbaColor.g},${rgbaColor.b})`
            }

            if (!nameMap[svgName]) {
                return ''
            }

            let svg_str = nameMap[svgName].replace("<svg", `<svg fill="${color_str}"`)
            return `data:image/svg+xml;utf8,${svg_str}`;
        }
    }
}

