import QtQuick 2.15
import "./styles"
import "./colors"

MSelectBase {
    id: control
    default property alias children: menu_dialog.children
    property string label: ""

    property var registerClickList: []

    function beforeOpenSelect() {
        let newRegisterClickList = []
        for (let i = 0; i < children.length; i++) {
            let the_child = children[i]
            if (the_child.clicked && registerClickList.indexOf(the_child) === -1) {
                the_child.clicked.connect(function(){
                    if (the_child.value) {
                        control.value = the_child.value
                        control.label = the_child.label ? the_child.label : ""
                        control.index = i
                        change(the_child.value, i)
                        menu_dialog.close()
                    }
                })
            }
            newRegisterClickList.push(the_child)
        }
        registerClickList = newRegisterClickList
    }

    displayItem: MTypography {
        id: text_item
        variant: "body1"
        text: label ? label : value
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

        onAboutToShow: {
            control.menuOpened = true
            beforeOpenSelect()
        }

        onClosed: {
            control.menuOpened = false
        }
    }
}
