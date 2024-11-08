import QtQuick 2.13
import "./styles"

TextInput {
    id: textInput
    property string variant: 'standard' // 'filled' | 'outlined' | 'standard'
    property string color: 'primary'
    property string placeholder: ''
    property string size: 'medium' // 'medium' | 'small'
    property bool disabled: false



    property string _main_color: Palette.string2Color(textInput.color, Palette.primaryMain)
    property var _padding: {
        if (size == 'small') {
            if (variant === 'outlined') {
                return [10.5, 14, 10.5, 14]
            }
            else if (variant === 'filled') {
                return [14, 12, 15, 12]
            }
            else {
                return [5, 0, 5, 0]
            }
        }
        else {
            if (variant === 'outlined') {
                return [18.5, 14, 18.5, 14]
            }
            else if (variant === 'filled') {
                return [18, 12, 19, 12]
            }
            else {
                return [6, 0, 7, 0]
            }
        }
    }
    enabled: !disabled
    verticalAlignment: Text.AlignVCenter
    clip: true
    selectByMouse: true
    selectionColor: textInput._main_color
    topPadding: _padding[0]
    rightPadding: _padding[1]
    bottomPadding: _padding[2]
    leftPadding: _padding[3]

    font.pointSize: TypographyStyle.fontStyleList.body1.size

    // outlined外边框 || 下划线
    Rectangle {
        id: border_or_underline
        enabled: false
        color: variant === 'outlined' ? Colors.commonTransparent : textInput.activeFocus ? textInput._main_color : '#3B000000'
        border.width: variant === 'outlined' ? (textInput.activeFocus ? 2 : 1) : 0
        border.color: variant === 'outlined' ? (textInput.activeFocus ? textInput._main_color : '#3B000000') : "#00ffffff"
        radius: variant === 'outlined' ? Palette.borderRadius : 0
    }

    Binding {
        target: border_or_underline
        when: variant === 'outlined'
        property: "anchors.fill"
        value: textInput
    }

    Binding {
        target: border_or_underline
        when: variant !== 'outlined'
        property: "width"
        value: textInput.width
    }

    Binding {
        target: border_or_underline
        when: variant !== 'outlined'
        property: "height"
        value: textInput.activeFocus ? 2 : 1
    }

    Binding {
        target: border_or_underline
        when: variant !== 'outlined'
        property: "anchors.bottom"
        value: textInput.bottom
    }

    // 上述代码，等价于下面的代码
//    // outlined外边框
//    Rectangle {
//        visible: variant === 'outlined'
//        z: -1
//        enabled: false
//        color: Colors.commonTransparent
//        border.width: textInput.activeFocus ? 2 : 1
//        border.color: textInput.activeFocus ? textInput._main_color : '#3B000000'
//        anchors.fill: parent
//        radius: Palette.borderRadius
//    }

//    // 下划线
//    Rectangle {
//        visible: variant !== 'outlined' ? 1 : 0
//        z: -1
//        enabled: false
//        color: textInput.activeFocus ? textInput._main_color : '#3B000000'
//        width: textInput.width
//        height: textInput.activeFocus ? 2 : 1
//        anchors.bottom: parent.bottom
//    }

    property var filledComponent: null // filled类型背景

    function initVariant() {
        if (variant === 'filled') {
            if (!filledComponent) {
                filledComponent = Qt.createQmlObject(
                    `import QtQuick 2.15;
                        import QtQuick.Shapes 1.15;
                        Shape {
                            id: container
                            anchors.fill: parent
                            property real shapeWidth: parent.width
                            property real shapeHeight: parent.height
                            property real shapeRadius: ${Palette.borderRadius}
                            z: -1

                            ShapePath {
                                strokeWidth: 0.1
                                strokeColor: "#e8e8e8"
                                fillColor: "#e8e8e8"

                                startX: 0
                                startY: container.shapeRadius

                                PathLine {
                                    x: 0
                                    y: container.shapeHeight
                                }

                                PathLine {
                                    x: container.shapeWidth
                                    y: container.shapeHeight
                                }

                                PathLine {
                                    x: container.shapeWidth
                                    y: container.shapeRadius
                                }

                                PathArc {
                                    x: container.shapeWidth-container.shapeRadius
                                    y: 0
                                    radiusX: container.shapeRadius
                                    radiusY: container.shapeRadius
                                    direction: PathArc.Counterclockwise
                                }

                                PathLine {
                                    x: container.shapeRadius
                                    y: 0
                                }

                                PathArc {
                                    x: 0
                                    y: container.shapeRadius
                                    radiusX: container.shapeRadius
                                    radiusY: container.shapeRadius
                                    direction: PathArc.Counterclockwise
                                }
                            }
                        }
                    `,
                    textInput, "filledComponent"
                )
            }
            else {
                filledComponent.visible = true
            }
        }
        else {
            if (filledComponent) {
                filledComponent.visible = false
            }
        }
    }


    Component.onCompleted: {
        initVariant()
    }

    onVariantChanged: {
        initVariant()
    }



    // placeholder
    MTypography {
        visible: textInput.text ? false : true
        anchors.fill: parent
        noWrap: true
        verticalAlignment: Text.AlignVCenter
        leftPadding: textInput.leftPadding
        rightPadding: textInput.rightPadding
        text: placeholder
        color: textInput.disabled ? Palette.lightTextDisabled : Palette.lightTextSecondary
        font.pointSize: TypographyStyle.fontStyleList.body1.size
    }

    MouseArea {
        cursorShape: Qt.IBeamCursor
        anchors.fill: parent
        enabled: false
    }
}
