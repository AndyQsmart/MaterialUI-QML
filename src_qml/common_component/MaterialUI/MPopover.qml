import QtQuick 2.15
import QtQuick.Controls 2.15
import "./styles"
import "./colors"

Popup {
    id: popover
    property string anchorReference: "anchorEl" // 'anchorEl' | 'anchorPosition' | 'none'
    property Item anchorPosition: Item {
        x: 0
        y: 0
    }
    property var anchorEl: null
    property int anchorOrigin: Item.TopLeft
    transformOrigin: Item.TopLeft // Item.TopLeft Item.Top Item.TopRight; Item.Left Item.Center Item.Right; Item.BottomLeft Item.Bottom Item.BottomRight
    property Item transitionComponent: MGrow {}
    property double marginThreshold: 16
    property int elevation: 8
    property bool disableBackdropClick: false


    parent: Overlay.overlay
    padding: 0
    visible: false
    modal: true
    Overlay.modal: Rectangle {
        color: Colors.commonTransparent
    }
    focus: true
    closePolicy: disableBackdropClick ? Popup.CloseOnEscape : (Popup.CloseOnEscape | Popup.CloseOnPressOutside)

    background: MPaper {
        elevation: popover.elevation
    }

    function getOffsetTop(rect, origin) {
        let offset = 0

        if (origin === Item.Left || origin ===  Item.Center || origin === Item.Right) {
            // if (vertical === 'center')
            offset = rect.height / 2
        }
        else if (origin === Item.BottomLeft || origin === Item.Bottom || origin === Item.BottomRight) {
            // if (vertical === 'bottom')
            offset = rect.height
        }

        return offset
    }

    function getOffsetLeft(rect, origin) {
        let offset = 0

        if (origin === Item.Top || origin ===  Item.Center || origin === Item.Bottom) {
            // if (horizontal === 'center')
            offset = rect.width / 2
        }
        else if (origin === Item.TopRight || origin === Item.Right || origin === Item.BottomRight) {
            // if (horizontal === 'right')
            offset = rect.width
        }

        return offset
    }

    // Return the base transform origin using the element
    // 获取Popover中Paper相对于自身的transformOrigin
    function getTransformOrigin(elemRect) {
        return {
            vertical: getOffsetTop(elemRect, transformOrigin),
            horizontal: getOffsetLeft(elemRect, transformOrigin),
        }
    }

    // Returns the top/left offset of the position
    // to attach to on the anchor element (or body if none is provided)
    function getAnchorOffset(anchorRect) {
//        console.log('anchorElPos:', anchorRect.x, anchorRect.y)
        if (anchorReference === 'anchorPosition') {
            // warning(
            //     anchorPosition,
            //     'Material-UI: you need to provide a `anchorPosition` property when using ' +
            //     '<Popover anchorReference="anchorPosition" />.',
            // )
            return {
                y: anchorPosition.y,
                x: anchorPosition.x,
            }
        }

        return {
            y: anchorRect.y + getOffsetTop(anchorRect, anchorOrigin),
            x: anchorRect.x + getOffsetLeft(anchorRect,anchorOrigin),
        }
    }


    function getPositioningStyle(anchorRect, elemRect, windowRect) {
        // 如果没有anchor参考对象，则直接返回
        if (anchorReference === 'none') {
            return {
                x: 0,
                y: 0,
            }
        }

        // Get the transform origin point on the element itself
        // 获取paper对于自身的transformOrigin
        const selfTransformOrigin = getTransformOrigin(elemRect)

        // Get the offset of of the anchoring element
        const anchorOffset = getAnchorOffset(anchorRect)
//        console.log('anchorRect:', JSON.stringify(anchor_rect))
//        console.log('anchorOffset:', JSON.stringify(anchorOffset))
//        console.log('selfTransformOrigin:', JSON.stringify(selfTransformOrigin))

        // Calculate element positioning
        let top = anchorOffset.y - selfTransformOrigin.vertical
        let left = anchorOffset.x - selfTransformOrigin.horizontal
        const bottom = top + elemRect.height
        const right = left + elemRect.width
//        console.log("top, left:", top, left)

        // Window thresholds taking required margin into account
        const heightThreshold = windowRect.height - marginThreshold
        const widthThreshold = windowRect.width - marginThreshold

        // Check if the vertical axis needs shifting
        if (top < marginThreshold) {
            const diff = top - marginThreshold
            top -= diff
        }
        else if (bottom > heightThreshold) {
            const diff = bottom - heightThreshold
            top -= diff
        }

        // Check if the horizontal axis needs shifting
        if (left < marginThreshold) {
            const diff = left - marginThreshold
            left -= diff
        }
        else if (right > widthThreshold) {
            const diff = right - widthThreshold
            left -= diff
        }

        return {
            y: top,
            x: left,
        }
    }

    function setPos() {
        let anchorRect = {}
        if (anchorEl) {
            let maxX = parent.width-width
            let maxY = parent.height-height
            let anchorElPos = anchorEl.mapToItem(parent, 0, 0) // 计算anchorEl中的(0,0)在parent中的位置
            let to_x = anchorElPos.x
            let to_y = anchorElPos.y

            anchorRect = {
                x: anchorElPos.x,
                y: anchorElPos.y,
                width: anchorEl.width,
                height: anchorEl.height,
            }
        }

        let elemRect = {
            width: width,
            height: height
        }
        let windowRect = {
            width: parent.width,
            height: parent.height,
        }
        let to_rect = getPositioningStyle(anchorRect, elemRect, windowRect)

        x = to_rect.x
        y = to_rect.y
    }

    onAboutToShow: {
        transitionComponent.transformOrigin = transformOrigin
        setPos()
    }

    onOpened: {
        setPos()
    }

    onAboutToHide: {
        transitionComponent.transformOrigin = transformOrigin
    }

    enter: transitionComponent ? transitionComponent.enter : null
    exit: transitionComponent ? transitionComponent.exit : null
}
