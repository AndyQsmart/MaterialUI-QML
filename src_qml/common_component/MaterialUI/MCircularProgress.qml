import QtQuick 2.15
import "./styles"
import "./colors"

Canvas {
    id: canvas
    property string color: 'primary' // 'inherit' 'primary' 'secondary'
    property string variant: 'indeterminate' // 'determinate' 'indeterminate' 'static'
    property bool disableShrink: false // 暂时未实现
    property int size: 40
    property real thickness: 3.6
    property real value: 0 // 0~100





    onValueChanged: {
        if (variant !== 'indeterminate') {
            canvas.requestPaint()
        }
    }

    width: canvas.size
    height: canvas.size

    property real animationangle: 0
    property int animation_duration: 1400 // 1400

    onAnimationangleChanged: {
        canvas.requestPaint()
    }

    onPaint: {
        var ctx = getContext("2d")
        ctx.reset()
        ctx.clearRect(0, 0, canvas.width, canvas.height)
        ctx.strokeStyle = canvas.color == 'secondary' ? Palette.secondaryMain : Palette.primaryMain
        ctx.lineWidth = canvas.thickness
        var start_angle = 0
        var end_angle = value*Math.PI*2/100
        if (variant == 'indeterminate') {
            if (canvas.animationangle < Math.PI) {
                start_angle = canvas.animationangle
                end_angle = start_angle + Math.PI*2 * (canvas.animationangle/Math.PI)
            }
            else {
                end_angle = canvas.animationangle
                start_angle = end_angle-Math.PI*2 * ((Math.PI*2-canvas.animationangle)/Math.PI)
            }
        }
        ctx.arc(canvas.size/2, canvas.size/2, (canvas.size-canvas.thickness)/2, start_angle-Math.PI/2, end_angle-Math.PI/2)
        ctx.stroke()
    }

    ParallelAnimation {
        running: canvas.variant == 'indeterminate'
        loops: Animation.Infinite

        NumberAnimation {
            target: canvas
            properties: 'animationangle'
            from: 0
            to: Math.PI*2
            duration: canvas.animation_duration
        }
    }

}
