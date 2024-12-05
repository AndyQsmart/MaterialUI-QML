import QtQuick 2.13
import QtQuick.Layouts 1.11
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
    border.width: {
        if (variant == 'outlined') {
            return 1
        }
        return 0
    }
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

        Item {
            visible: false
            id: childrenContainer
        }

        Loader {
            id: loader
            sourceComponent: orientation === 'vertical' ? column_container : row_container

            Component.onCompleted: {
                if (loader.item) {
                    // 将外部传入的子元素添加到加载的组件的子元素列表中
                    let the_child_list = []
                    let i = 0
                    for (i = 0; i < childrenContainer.children.length; i++) {
                        the_child_list.push(childrenContainer.children[i])
                    }
                    for (i = 0; i < the_child_list.length; i++) {
                        let the_child = the_child_list[i]
                        if (the_child instanceof MButton) {
                            the_child.variant = variant
                            the_child.size = size
                            the_child.background.radius = 0
                            the_child.disableElevation = true
                            if (disabled !== null) {
                                the_child.disabled = disabled
                            }
                            if (disableRipple != null) {
                                the_child.disableRipple = disableRipple
                            }
                            the_child.color = buttonColor
                            if (i%2) {
                                the_child.background.border.width = 0
                            }
                            else {
                                the_child.background.border.width = 1
                            }
                            if (variant === 'contained') {
                                if (the_child.disabled) {
                                    the_child.background.border.color = Palette.lightActionDisabled
                                }
                                else {
                                    if (buttonColor === 'primary') {
                                        the_child.background.border.color = Palette.primaryDark
                                    }
                                    else if (buttonColor === 'secondary') {
                                        the_child.background.border.color = Palette.secondaryDark
                                    }
                                    else {
                                        the_child.background.border.color = Grey._400
                                    }
                                }
                            }

                            if (orientation === 'vertical') {
                                the_child.Layout.fillWidth = true
                            }
                            else {
                                the_child.Layout.fillHeight = true
                            }
                        }
                        loader.item.children.push(the_child)
                    }
                }
            }
        }

        Component {
            id: row_container
            RowLayout {
                x: -1
                y: -1
                spacing: 0
            }
        }

        Component {
            id: column_container
            ColumnLayout {
                x: -1
                y: -1
                spacing: 0
            }
        }
    }
}
