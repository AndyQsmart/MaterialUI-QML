import QtQuick 2.13
import "./styles"

MPopover {
    default property alias children: menu_list.children

    MMenuList {
        id: menu_list
    }
}
