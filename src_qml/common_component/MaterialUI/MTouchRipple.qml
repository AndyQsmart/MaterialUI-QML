import QtQuick 2.15

Item {
    id: root
    property bool center: false
    property int duration: 550
    property string currentColor: "#000000"

    clip: true

    ListModel {
        id: ripples
    }

    Repeater {
        model: ripples
        delegate: MRipple {
            open: isOpen
            timeout: root.duration
            pulsate: isPulsate
            rippleX: vRippleX
            rippleY: vRippleY
            rippleSize: vRippleSize
            currentColor: root.currentColor

            onExited: {
                onExitedRipple()
            }
        }
    }

    function onExitedRipple() {
        ripples.remove(0, 1)
    }

    function startCommit(params) {
        ripples.append({
            isOpen: true,
            isPulsate: params.isPulsate,
            vRippleX: params.rippleX,
            vRippleY: params.rippleY,
            vRippleSize: params.rippleSize
        })
    }

    function start(x=0, y=0, options={}) {
        let isPulsate = options.pulsate ? true : false
        let center = root.center || isPulsate
        let rippleX = 0
        let rippleY = 0
        let rippleSize = 0

        if (center) {
            rippleX = Math.round(root.width / 2)
            rippleY = Math.round(root.height / 2)
        }
        else {
            rippleX = Math.round(x - root.x)
            rippleY = Math.round(y - root.y)
        }

        if (center) {
            rippleSize = Math.sqrt((2 * root.width*root.width + root.height*root.height) / 3)

            // // For some reason the animation is broken on Mobile Chrome if the size if even.
            // if (rippleSize % 2 === 0) {
            //     rippleSize += 1;
            // }
        }
        else {
            let sizeX = Math.max(Math.abs(root.width - rippleX), rippleX) * 2 + 2
            let sizeY = Math.max(Math.abs(root.height - rippleY), rippleY) * 2 + 2
            rippleSize = Math.sqrt(sizeX*sizeX + sizeY*sizeY)
        }

        startCommit({
            isPulsate: isPulsate,
            rippleX: rippleX,
            rippleY: rippleY,
            rippleSize: rippleSize,
        })
    }

    function pulsate(x, y, options={}) {
        start(x, y, Object.assign({ pulsate: true }, options))
    }

    function stop() {
        for (let i = 0; i < ripples.count; i++) {
            let item = ripples.get(i)
            if (item.isOpen) {
                item.isOpen = false
                break
            }
        }
    }
}
