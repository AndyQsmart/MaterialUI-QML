import QtQuick 2.15
import "./styles"

// 原版
Text {
    property string variant: 'body2'
    property string textColor: 'default' // 'default' | 'primary' | 'secondary' | 'textPrimary' | 'textSecondary' | 'error'
    property bool gutterBottom: false
    property bool noWrap: false
    property string align: 'inherit' // 'inherit' 'left' 'center' 'right' 'justify'
    property bool paragraph: false
    property real fontSize: -1 // new

    elide: {
        if (noWrap) {
            return Text.ElideRight
        }
        else {
            return Text.ElideNone
        }
    }

    wrapMode: {
        if (noWrap) {
            return Text.NoWrap
        }
        else {
            return Text.Wrap
        }
    }

//    Rectangle {
//        border.width: 1
//        border.color: '#000000'
//        anchors.fill: parent
//        color: Colors.alpha('#000000', 0.5)
//    }

//    font.family: "Helvetica"

    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: {
        switch(align) {
            case 'left':
                return Text.AlignLeft
            case 'center':
                return Text.AlignHCenter
            case 'right':
                return Text.AlignRight
            case 'justify':
                return Text.AlignJustify
        }
        return Text.AlignLeft
    }

    // gutterBottom和paragraph下面的边距效果
    bottomPadding: {
        if (gutterBottom) {
            return Palette.unit
        }
        else if (paragraph) {
            return 2*Palette.unit
        }
        else {
            return 0
        }
    }

    color: Palette.string2Color(textColor, Colors.commonBlack)

    font.pointSize: {
        if (fontSize > 0) {
            return TypographyStyle.convertFontSize(fontSize)
        }

        let fontStyleList = TypographyStyle.fontStyleList
        if (!variant) {
            return fontStyleList.body2.size
        }

        return fontStyleList[variant].size ? fontStyleList[variant].size : fontStyleList.body2.size
    }

    font.weight: {
        let fontStyleList = TypographyStyle.fontStyleList
        if (!variant) {
            return fontStyleList.body2.weight
        }

        return fontStyleList[variant].weight ? fontStyleList[variant].weight : fontStyleList.body2.weight
    }

    lineHeight: {
        let fontStyleList = TypographyStyle.fontStyleList
        if (!variant) {
            return fontStyleList.body2.line_height
        }

        return fontStyleList[variant].line_height ? fontStyleList[variant].line_height : fontStyleList.body2.line_height
    }

    font.letterSpacing: {
        let fontStyleList = TypographyStyle.fontStyleList
        if (!variant) {
            return fontStyleList.body2.letter_spacing
        }

        return fontStyleList[variant].letter_spacing ? fontStyleList[variant].letter_spacing : fontStyleList.body2.letter_spacing
    }
}
