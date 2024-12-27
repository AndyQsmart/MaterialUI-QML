import QtQuick
import "./styles"

MPopover {
    default property alias children: menu_list.children

    MMenuList {
        id: menu_list
    }
}
