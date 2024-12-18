import QtQuick 2.15
import "./styles"

MPopover {
    default property alias children: menu_list.children

    MMenuList {
        id: menu_list
    }
}
