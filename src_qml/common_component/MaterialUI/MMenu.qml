import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "./styles"

MPopover {
    default property alias children: menu_list.children

    MMenuList {
        id: menu_list
    }
}
