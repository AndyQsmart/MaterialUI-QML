import QtQuick 2.15
import "./styles"
import "./colors"

MSelectBase {
    id: control
    property alias model: menu_repeater.model // list<string>
    displayItem: MTypography {
        id: text_item
        variant: "body1"
        text: control.value
        noWrap: true
        lineHeight: TypographyStyle.convertLineHeight(1.1876)
    }

    Binding {
        target: text_item
        property: 'color'
        when: disabled
        value: Palette.lightTextDisabled
    }

    onSelectOpen: {
        menu_dialog.open()
    }

    MMenu {
        id: menu_dialog
        anchorEl: control
        anchorOrigin: Item.Bottom
        transformOrigin: Item.Top

        Repeater {
            id: menu_repeater

            delegate: MMenuItem {
                text: modelData

                onClicked: {
                    control.value = modelData
                    control.index = index
                    change(control.value, control.index)
                    menu_dialog.close()
                }
            }
        }

        onAboutToShow: {
            control.menuOpened = true
        }

        onClosed: {
            control.menuOpened = false
        }
    }
}
