import QtQuick
import QtQuick.Layouts
import "./styles"

Item {
    id: root
    property bool disablePadding: false
    property bool dense: false
    // property var subheader: null
    default property alias children: column_layout.children
    property int topPadding: {
        if (disablePadding) {
            return 0
        }
        let ans = MPalette.unit
        if (dense) {
            ans = MPalette.unit
        }
        return ans
    }
    property int bottomPadding: root.topPadding

    width: column_layout.width
    implicitWidth: width
    height: column_layout.height+topPadding+bottomPadding
    implicitHeight: height

    ColumnLayout {
        id: column_layout
        y: topPadding
        spacing: 0

        onChildrenChanged: {
            for (let i = 0; i < children.length; i++) {
                let the_child = children[i]
                the_child.Layout.fillWidth = true
            }
        }
    }
}
