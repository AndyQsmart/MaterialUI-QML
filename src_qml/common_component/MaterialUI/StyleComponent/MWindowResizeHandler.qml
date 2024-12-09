import QtQuick 2.15
import QtQuick.Window 2.13

Item {
    property Window target: null
    // startSystemResize 参数：
    // startSystemResize 需要一个参数，指示在哪个位置启动调整大小操作。常见的枚举值有：
    // Qt.LeftEdge：窗口左边缘
    // Qt.RightEdge：窗口右边缘
    // Qt.TopEdge：窗口上边缘
    // Qt.BottomEdge：窗口下边缘
    // Qt.TopEdge | Qt.LeftEdge：窗口左上角
    // Qt.TopRightCorner：窗口右上角
    // Qt.BottomLeftCorner：窗口左下角
    // Qt.BottomRightCorner：窗口右下角

    // 顶部调整
    MouseArea {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 5

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeVerCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                target.startSystemResize(Qt.TopEdge)
            }
            else {
                target.startSystemResize(Qt.TopEdge)
            }
        }
    }

    // 底部调整
    MouseArea {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: 5

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeVerCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                target.startSystemResize(Qt.BottomEdge)
            }
            else {
                target.startSystemResize(Qt.BottomEdge)
            }
        }
    }

    // 左侧调整
    MouseArea {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 5

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeHorCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                target.startSystemResize(Qt.LeftEdge)
            }
            else {
                target.startSystemResize(Qt.LeftEdge)
            }
        }
    }

    // 右侧调整
    MouseArea {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 5

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeHorCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                target.startSystemResize(Qt.RightEdge)
            }
            else {
                target.startSystemResize(Qt.RightEdge)
            }
        }
    }

    // 左上调整
    MouseArea {
        anchors.top: parent.top
        anchors.left: parent.left
        width: 5
        height: 5

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeFDiagCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                target.startSystemResize(Qt.TopEdge | Qt.LeftEdge)
            }
            else {
                target.startSystemResize(Qt.TopEdge | Qt.LeftEdge)
            }
        }
    }

    // 右上调整
    MouseArea {
        anchors.top: parent.top
        anchors.right: parent.right
        width: 5
        height: 5

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeBDiagCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                target.startSystemResize(Qt.TopEdge | Qt.RightEdge)
            }
            else {
                target.startSystemResize(Qt.TopEdge | Qt.RightEdge)
            }
        }
    }

    // 左下调整
    MouseArea {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: 5
        height: 5

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeBDiagCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                target.startSystemResize(Qt.BottomEdge | Qt.LeftEdge)
            }
            else {
                target.startSystemResize(Qt.BottomEdge | Qt.LeftEdge)
            }
        }
    }

    // 右下调整
    MouseArea {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: 5
        height: 5

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeFDiagCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                target.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
            }
            else {
                target.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
            }
        }
    }


    // MouseArea {
    //     id: mouseArea
    //     anchors.fill: parent
    //     hoverEnabled: true
    //     acceptedButtons: Qt.LeftButton

    //     property int edges: 0;
    //     property int edgeOffest: 5;

    //     function setEdges(x, y) {
    //         edges = 0;
    //         if(x < edgeOffest) edges |= Qt.LeftEdge;
    //         if(x > (width - edgeOffest))  edges |= Qt.RightEdge;
    //         if(y < edgeOffest) edges |= Qt.TopEdge;
    //         if(y > (height - edgeOffest)) edges |= Qt.BottomEdge;
    //     }

    //     cursorShape: {
    //         return !containsMouse ? Qt.ArrowCursor:
    //                 edges == 3 || edges == 12 ? Qt.SizeFDiagCursor :
    //                 edges == 5 || edges == 10 ? Qt.SizeBDiagCursor :
    //                 edges & 9 ? Qt.SizeVerCursor :
    //                 edges & 6 ? Qt.SizeHorCursor : Qt.ArrowCursor;
    //     }

    //     onPositionChanged: {
    //         setEdges(mouseX, mouseY);
    //     }
    //     onPressed: {
    //         setEdges(mouseX, mouseY);
    //         if(edges && containsMouse) {
    //             target.startSystemResize(edges);
    //         }
    //     }
    // }
}
