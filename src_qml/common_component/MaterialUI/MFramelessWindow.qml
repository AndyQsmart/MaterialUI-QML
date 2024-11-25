import QtQuick 2.13
import QtQuick.Window 2.13
import QtGraphicalEffects 1.15

Window {
    id: mainWindow
//    default property alias children: bg_container.children
    flags: Qt.FramelessWindowHint | Qt.Window
    color: "transparent"

    MPaper {
        id: bg_container
        anchors.fill: parent
        z: -1
        radius: 10

        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: bg_container.width
                height: bg_container.height
                radius: bg_container.radius
            }
        }
    }

    DragHandler {
        onActiveChanged: if(active) startSystemMove();
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        z: 100

        property int edges: 0;
        property int edgeOffest: 5;

        function setEdges(x, y) {
            edges = 0;
            if(x < edgeOffest) edges |= Qt.LeftEdge;
            if(x > (width - edgeOffest))  edges |= Qt.RightEdge;
            if(y < edgeOffest) edges |= Qt.TopEdge;
            if(y > (height - edgeOffest)) edges |= Qt.BottomEdge;
        }

        cursorShape: {
            return !containsMouse ? Qt.ArrowCursor:
                    edges == 3 || edges == 12 ? Qt.SizeFDiagCursor :
                    edges == 5 || edges == 10 ? Qt.SizeBDiagCursor :
                    edges & 9 ? Qt.SizeVerCursor :
                    edges & 6 ? Qt.SizeHorCursor : Qt.ArrowCursor;
        }

        onPositionChanged: setEdges(mouseX, mouseY);
        onPressed: {
            setEdges(mouseX, mouseY);
            if(edges && containsMouse) {
                startSystemResize(edges);
            }
        }
    }
}

