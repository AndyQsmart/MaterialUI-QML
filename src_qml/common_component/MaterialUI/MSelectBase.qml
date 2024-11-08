import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12
import QtGraphicalEffects 1.15
import QtQuick.Shapes 1.15;
import "./styles"
import "./colors"

Rectangle {
    id: control
    property string variant: 'standard' // 'filled' 'outlined' 'standard'
    property alias displayItem: display_container.children // list<string>
    property int index: -1
    property string value: ""
    property string selectColor: "primary"
    property string size: 'medium' // 'medium' | 'small'
    property bool disabled: false
    property string placeholder: ""
    property real minWidth: 0
    property real maxWidth: -1
    property var padding: {
        if (size === 'small') {
            variant === 'outlined' ? [10.5, 32, 10.5, 14] : (variant === 'filled' ? [14, 32, 15, 12] : [5, 24, 5, 0])
        }
        else {
            variant === 'outlined' ? [18.5, 32, 18.5, 14] : (variant === 'filled' ? [18, 32, 19, 12] : [6, 24, 7, 0])
        }
    }
    property var topPadding: padding && padding[0] ? padding[0] : 0
    property var rightPadding: padding && padding[1] ? padding[1] : 0
    property var bottomPadding: padding && padding[2] ? padding[2] : 0
    property var leftPadding: padding && padding[3] ? padding[3] : 0




    signal change(string value, int index)
    signal selectOpen()

    width: text_container.width
    height: text_container.height
    color: menuOpened ? Colors.alpha('#000000', 0.05) : "#00ffffff"
    radius: variant === 'outlined' ? Palette.borderRadius : 0
    border.width: variant === 'outlined' ? (menuOpened ? 2 : 1) : 0
    border.color: menuOpened ? Palette.string2Color(selectColor, Palette.primaryMain) : Colors.alpha('#000000', 0.23)
    property bool menuOpened: false
    property var underlineComponent: null // 下划线组件
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
                    control, "filledComponent"
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

        if (variant !== 'outlined') {
            if (!underlineComponent) {
                underlineComponent = Qt.createQmlObject(
                    `import QtQuick 2.15;
                        import QtQuick.Shapes 1.15;
                        Shape {
                            id: container
                            property int strokeStyle: ShapePath.DashLine
                            property int strokeWidth: 1
                            property string strokeColor: "${Colors.alpha('#000000', 0.42)}"
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom

                           ShapePath {
                               strokeWidth: container.strokeWidth
                               strokeColor: container.strokeColor
                               strokeStyle: container.strokeStyle
                               dashPattern: [2, 2]

                               startX: container.strokeWidth/2
                               startY: 0

                               PathLine {
                                   x: container.width-container.strokeWidth/2;
                                   y: 0
                               }
                           }
                        }
                    `,
                    control, "outlineComponent"
                )
            }
            else {
                underlineComponent.visible = true
            }
        }
        else {
            if (underlineComponent) {
                underlineComponent.visible = false
            }
        }
    }

    Binding {
        target: underlineComponent
        property: "strokeStyle"
        value: disabled ? ShapePath.DashLine : ShapePath.SolidLine
    }

    Binding {
        target: underlineComponent
        property: "strokeWidth"
        value: menuOpened ? 2 : 1
    }

    Binding {
        target: underlineComponent
        property: "strokeColor"
        value: menuOpened ? Palette.string2Color(selectColor, Palette.primaryMain) : Colors.alpha('#000000', 0.42)
    }

    Component.onCompleted: {
        initVariant()
    }

    onVariantChanged: {
        initVariant()
    }

    Row {
        id: text_container
        topPadding: control.topPadding
        bottomPadding: control.bottomPadding
        leftPadding: control.leftPadding
        spacing: control.rightPadding-24
        rightPadding: variant === 'standard' ? 0 : 7

        Item {
            id: display_container
            width: {
                let text_width = Math.max(childrenRect.width, control.minWidth-control.leftPadding-control.rightPadding, 16)
                if (control.maxWidth >= 0) {
                    text_width = Math.min(text_width, control.maxWidth)
                }
                return text_width
            }
            height: childrenRect.height
            anchors.verticalCenter: parent.verticalCenter
        }

        Item {
            width: 24
            height: 10
            anchors.verticalCenter: parent.verticalCenter

            Image {
                anchors.centerIn: parent

                width: 24
                height: 24
                sourceSize.width: width*2
                sourceSize.height: height*2
                source: `data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" fill="${control.disabled ? "#bdbdbd" : "#757575"}" viewBox="0 0 24 24" ><path d="M7 10l5 5 5-5z"></path></svg>`
            }
        }
    }

    MTypography {
        visible: !control.value
        variant: "body1"
        textColor: 'textSecondary'
        text: placeholder
        noWrap: true
        lineHeight: TypographyStyle.convertLineHeight(1.2)
        anchors.verticalCenter: parent.verticalCenter
        leftPadding: control.leftPadding
    }

    MouseArea {
        visible: !control.disabled
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            selectOpen()
        }
    }
}
