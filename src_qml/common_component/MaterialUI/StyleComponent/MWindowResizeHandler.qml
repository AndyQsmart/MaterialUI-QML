import QtQuick 2.15
import QtQuick.Window 2.15

Item {
    property Window target: null
    property real edgeOffset: 5


    // startSystemResize 参数：
    // startSystemResize 需要一个参数，指示在哪个位置启动调整大小操作。常见的枚举值有：
    // Qt.LeftEdge：窗口左边缘
    // Qt.RightEdge：窗口右边缘
    // Qt.TopEdge：窗口上边缘
    // Qt.BottomEdge：窗口下边缘
    // Qt.TopEdge | Qt.LeftEdge：窗口左上角
    // Qt.TopEdge | Qt.RightEdge：窗口右上角
    // Qt.BottomEdge | Qt.LeftEdge：窗口左下角
    // Qt.BottomEdge | Qt.RightEdge：窗口右下角
    property bool isMacResizing: false
    property real macStartX: 0
    property real macStartY: 0
    property real macStartWindowX: 0
    property real macStartWindowY: 0
    property real macStartWidth: 0
    property real macStartHeight: 0

    function macWindowResizeStart(mouseX, mouseY) {
        macStartX = target.x+mouseX // 需要加上window的坐标进行修正
        macStartY = target.y+mouseY
        macStartWindowX = target.x
        macStartWindowY = target.y
        macStartWidth = target.width
        macStartHeight = target.height
        isMacResizing = true
    }

    function macWindowResize(flag, mouseX, mouseY) {
        if (!isMacResizing) {
            return
        }

        mouseX = target.x+mouseX
        mouseY = target.y+mouseY

        let toWidth = target.width
        let toHeight = target.height

        // 调整高度
        if (flag & Qt.RightEdge) {
            toWidth = macStartWidth+(mouseX-macStartX)
            toWidth = Math.max(target.minimumWidth, toWidth)
            toWidth = Math.min(target.maximumWidth, toWidth)
            target.width = toWidth
        }

        // 调整宽度
        if (flag & Qt.BottomEdge) {
            toHeight = macStartHeight+(mouseY-macStartY)
            toHeight = Math.max(target.minimumHeight, toHeight)
            toHeight = Math.min(target.maximumHeight, toHeight)
            target.height = toHeight
        }

        if (flag & Qt.LeftEdge) {
            toWidth = macStartWidth+(macStartX-mouseX)
            toWidth = Math.max(target.minimumWidth, toWidth)
            toWidth = Math.min(target.maximumWidth, toWidth)
            target.width = toWidth
            target.x = macStartWindowX+macStartWidth-toWidth
            target.width = toWidth
        }

        if (flag & Qt.TopEdge) {
            toHeight = macStartHeight+(macStartY-mouseY)
            toHeight = Math.max(target.minimumHeight, toHeight)
            toHeight = Math.min(target.maximumHeight, toHeight)
            target.y = macStartWindowY+macStartHeight-toHeight
            target.height = toHeight
        }
    }

    function macWindowResizeEnd(mouseX, mouseY) {
        isMacResizing = false
    }

    // 顶部调整
    MouseArea {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: edgeOffset

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeVerCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeStart(mouse.x+x, mouse.y+y)
            }
            else {
                target.startSystemResize(Qt.TopEdge)
            }
        }

        onPositionChanged: {
            if (Qt.platform.os === 'osx') {
                macWindowResize(Qt.TopEdge, mouse.x+x, mouse.y+y)
            }
        }

        onReleased: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeEnd()
            }
        }
    }

    // 底部调整
    MouseArea {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: edgeOffset

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeVerCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeStart(mouse.x+x, mouse.y+y)
            }
            else {
                target.startSystemResize(Qt.BottomEdge)
            }
        }


        onPositionChanged: {
            if (Qt.platform.os === 'osx') {
                macWindowResize(Qt.BottomEdge, mouse.x+x, mouse.y+y)
            }
        }

        onReleased: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeEnd()
            }
        }
    }

    // 左侧调整
    MouseArea {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: edgeOffset

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeHorCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeStart(mouse.x+x, mouse.y+y)
            }
            else {
                target.startSystemResize(Qt.LeftEdge)
            }
        }


        onPositionChanged: {
            if (Qt.platform.os === 'osx') {
                macWindowResize(Qt.LeftEdge, mouse.x+x, mouse.y+y)
            }
        }

        onReleased: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeEnd()
            }
        }
    }

    // 右侧调整
    MouseArea {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: edgeOffset

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeHorCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeStart(mouse.x+x, mouse.y+y)
            }
            else {
                target.startSystemResize(Qt.RightEdge)
            }
        }


        onPositionChanged: {
            if (Qt.platform.os === 'osx') {
                macWindowResize(Qt.RightEdge, mouse.x+x, mouse.y+y)
            }
        }

        onReleased: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeEnd()
            }
        }
    }

    // 左上调整
    MouseArea {
        anchors.top: parent.top
        anchors.left: parent.left
        width: edgeOffset
        height: edgeOffset

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeFDiagCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeStart(mouse.x+x, mouse.y+y)
            }
            else {
                target.startSystemResize(Qt.TopEdge | Qt.LeftEdge)
            }
        }


        onPositionChanged: {
            if (Qt.platform.os === 'osx') {
                macWindowResize(Qt.TopEdge | Qt.LeftEdge, mouse.x+x, mouse.y+y)
            }
        }

        onReleased: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeEnd()
            }
        }
    }

    // 右上调整
    MouseArea {
        anchors.top: parent.top
        anchors.right: parent.right
        width: edgeOffset
        height: edgeOffset

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeBDiagCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeStart(mouse.x+x, mouse.y+y)
            }
            else {
                target.startSystemResize(Qt.TopEdge | Qt.RightEdge)
            }
        }


        onPositionChanged: {
            if (Qt.platform.os === 'osx') {
                macWindowResize(Qt.TopEdge | Qt.RightEdge, mouse.x+x, mouse.y+y)
            }
        }

        onReleased: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeEnd()
            }
        }
    }

    // 左下调整
    MouseArea {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: edgeOffset
        height: edgeOffset

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeBDiagCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeStart(mouse.x+x, mouse.y+y)
            }
            else {
                target.startSystemResize(Qt.BottomEdge | Qt.LeftEdge)
            }
        }


        onPositionChanged: {
            if (Qt.platform.os === 'osx') {
                macWindowResize(Qt.BottomEdge | Qt.LeftEdge, mouse.x+x, mouse.y+y)
            }
        }

        onReleased: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeEnd()
            }
        }
    }

    // 右下调整
    MouseArea {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        width: edgeOffset
        height: edgeOffset

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.SizeFDiagCursor

        onPressed: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeStart(mouse.x+x, mouse.y+y)
            }
            else {
                target.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
            }
        }


        onPositionChanged: {
            if (Qt.platform.os === 'osx') {
                macWindowResize(Qt.BottomEdge | Qt.RightEdge, mouse.x+x, mouse.y+y)
            }
        }

        onReleased: {
            if (Qt.platform.os === 'osx') {
                macWindowResizeEnd()
            }
        }
    }
}
