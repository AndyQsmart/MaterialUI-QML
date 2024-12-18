import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "./styles"
import "./colors"

Rectangle {
    id: container
    default property alias children: childrenContainer.children
    property string orientation: 'horizontal' // 'horizontal' | 'vertical'
    property string size: 'medium' // 'large' | 'medium' | 'small'
    property string variant: 'outlined' // 'contained' | 'outlined' | 'text'
    property var disabled: null
    property var disableElevation: null
    property var disableRipple: null
    property string buttonColor: 'default' // 'default' | 'inherit' | 'primary' | 'secondary'

    width: childrenRect.width
    height: childrenRect.height
    radius: Palette.borderRadius
    border.width: variant == 'outlined' ? 1 : 0
    border.color: {
        let ans_color = Palette.string2Color(buttonColor, null)
        if (ans_color) {
            return Colors.alpha(ans_color, 0.5)
        }
        else {
            return Colors.alpha('#000000', 0.23)
        }
    }

    layer.enabled: variant === 'contained' && !disabled && !disableElevation
    layer.effect: MShadow {
        elevation: 2
    }

    Rectangle {
        width: childrenRect.width-2
        height: childrenRect.height-2
        color: "#00ffffff"
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: container.width
                height: container.height
                radius: container.radius
            }
        }

        GridLayout {
            id: childrenContainer
            x: -1
            y: -1
            rowSpacing: 0
            columnSpacing: 0
            flow: orientation === 'vertical' ? GridLayout.TopToBottom : GridLayout.LeftToRight
        }

        Repeater {
            model: childrenContainer.children.length
            delegate: Item {
                Binding {
                    target: childrenContainer.children[index]
                    property: "variant"
                    value: container.variant
                }
                Binding {
                    target: childrenContainer.children[index]
                    property: "size"
                    value: container.size
                }
                Binding {
                    target: childrenContainer.children[index]
                    property: "background.radius"
                    value: 0
                }
                Binding {
                    target: childrenContainer.children[index]
                    property: "disableElevation"
                    value: true
                }
                Binding {
                    when: disabled !== null
                    target: childrenContainer.children[index]
                    property: "disabled"
                    value: disabled
                }
                Binding {
                    when: disableRipple !== null
                    target: childrenContainer.children[index]
                    property: "disableRipple"
                    value: disableRipple
                }
                Binding {
                    target: childrenContainer.children[index]
                    property: "color"
                    value: buttonColor
                }
                Binding {
                    target: childrenContainer.children[index]
                    property: "background.border.width"
                    value: index%2 ? 0 : 1
                }
                Binding {
                    when: variant === 'contained'
                    target: childrenContainer.children[index]
                    property: "background.border.color"
                    value: {
                        if (childrenContainer.children[index].disabled) {
                            return Palette.lightActionDisabled
                        }
                        else {
                            if (buttonColor === 'primary') {
                                return Palette.primaryDark
                            }
                            else if (buttonColor === 'secondary') {
                                return Palette.secondaryDark
                            }
                            else {
                                return Grey._400
                            }
                        }
                    }
                }
                Binding {
                    when: orientation === 'vertical'
                    target: childrenContainer.children[index]
                    property: "Layout.fillWidth"
                    value: true
                }
                Binding {
                    when: orientation !== 'vertical'
                    target: childrenContainer.children[index]
                    property: "Layout.fillHeight"
                    value: true
                }
            }
        }
    }
}
