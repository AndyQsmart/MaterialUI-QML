import QtQuick 2.15

Item {
    id: root
    property bool open: false
    property real rippleX: 0
    property real rippleY: 0
    property real rippleSize: 0
    property bool pulsate: false
    property int timeout: 0
    property string currentColor: "#000000"

    signal exited()

    width: rippleSize
    height: rippleSize
    x: rippleX-width/2
    y: rippleY-height/2
    scale: 0
    opacity: 0.1

    property int fatherTimeout: pulsate ? 200 : 550
    property int childTimeout: 550

    Component.onCompleted: {
        father_enter.start()
    }

    Rectangle {
        id: child_root
        width: parent.width
        height: parent.height
        radius: width/2
        color: root.currentColor
        scale: 1
        opacity: 1
        property bool open: root.open

        onOpenChanged: {
            if (!child_root.open) {
                child_exit.start()
            }
        }

        NumberAnimation {
            id: child_exit

            target: child_root
            duration: childTimeout
            property: "opacity"
            easing.type: Easing.Bezier
            easing.bezierCurve: [0.4, 0, 0.2, 1]
            from: 1
            to: 0

            onFinished: {
                root.exited()
            }
        }

        SequentialAnimation {
            id: child_pulsate_exit
            loops: Animation.Infinite
            running: root.pulsate

            NumberAnimation {
                target: child_root
                duration: childTimeout/2
                property: "scale"
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.4, 0, 0.2, 1]
                from: 1
                to: 0.92
            }
            NumberAnimation {
                target: child_root
                duration: childTimeout/2
                property: "scale"
                easing.type: Easing.Bezier
                easing.bezierCurve: [0.4, 0, 0.2, 1]
                from: 0.92
                to: 1
            }
        }
    }

    ParallelAnimation {
        id: father_enter

        NumberAnimation {
            target: root
            duration: fatherTimeout
            property: "scale"
            easing.type: Easing.Bezier
            easing.bezierCurve: [0.4, 0, 0.2, 1]
            from: 0
            to: 1
        }
        NumberAnimation {
            target: root
            duration: fatherTimeout
            property: "opacity"
            easing.type: Easing.Bezier
            easing.bezierCurve: [0.4, 0, 0.2, 1]
            from: 0.1
            to: 0.3
        }
    }
}
