import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import "./styles"
import "./colors"

Slider {
    id: control
    value: 0
    property string color: 'primary' // 'primary' 'secondary' | color
    property bool disabled: false
    property bool marks: false
    property real step: 1
    property real min: 0
    property real max: 100
    property string valueLabelDisplay: "off" // 'on' | 'auto' | 'off'
    property var valueLabelFormat: function(x) { return x }


    property bool isVertical: orientation == Qt.Vertical
    from: min
    to: max
    stepSize: step
    enabled: !disabled
    snapMode: control.marks ? Slider.SnapAlways : Slider.NoSnap
    property int _handleSize: disabled ? 8 : 12
    property string currentColor: Palette.string2Color(control.color, Palette.primaryMain)

    background: Rectangle {
        x: control.isVertical ? control.topPadding + control.availableWidth / 2 - width / 2 : control.leftPadding
        y: control.isVertical ? control.leftPadding : control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: control.isVertical ? 2 : 120
        implicitHeight: control.isVertical ? 120 : 2
        width: control.isVertical ? implicitWidth : control.availableWidth
        height: control.isVertical ? control.availableHeight : implicitHeight
        radius: 2
        color: Colors.alpha(control.disabled ? Grey._400 : control.currentColor, 0.38)

        Rectangle {
            y: control.isVertical ? parent.height-height : 0
            width: control.isVertical ? parent.width : control.visualPosition * parent.width
            height: control.isVertical ? (1-control.visualPosition) * parent.height : parent.height
            color: control.disabled ? Grey._400 : control.currentColor
            radius: 2
        }

        Repeater {
            id: marks_list
            visible: control.marks && control.step > 0 && stepCount <= 100
            property int stepCount: control.step > 0 ? Math.ceil((control.max-control.min)/control.step) : 0
            property real overWidth: control.isVertical ? stepCount*control.step/(control.max-control.min)*control.availableHeight : stepCount*control.step/(control.max-control.min)*control.availableWidth
            property real stepWidth: stepCount > 0 ? overWidth/stepCount : 0
            property int currentStep: {
                return stepWidth > 0 ? (control.isVertical ? (1-control.visualPosition)*control.availableHeight/stepWidth : control.visualPosition*control.availableWidth/stepWidth) : 0
            }
            model: marks_list.visible ? stepCount+1 : 0

            delegate: Rectangle {
                width: 2
                height: 2
                radius: 1
                color: index <= marks_list.currentStep ? Palette.lightBackgroundPaper : control.disabled ? Grey._400 : control.currentColor
                x: control.isVertical ? 0 : index*marks_list.stepWidth <= control.availableWidth ? index*marks_list.stepWidth : control.availableWidth
                y: !control.isVertical ? 0 : control.availableHeight-(index*marks_list.stepWidth <= control.availableHeight ? index*marks_list.stepWidth : control.availableHeight)
            }
        }
    }

    handle: Rectangle {
        x: control.isVertical ? control.topPadding + control.availableWidth / 2 - width / 2 : control.leftPadding + control.visualPosition * control.availableWidth - width/2
        y: control.isVertical ? control.leftPadding + control.visualPosition * control.availableHeight - height/2 : control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: _handleSize
        implicitHeight: _handleSize
        radius: _handleSize / 2
        color: control.disabled ? Grey._400 : control.currentColor

        Rectangle {
            id: outer

            x: parent.width/2-width/2
            y: parent.height/2-height/2
            width: {
                if (hovered || pressed) {
                    return pressed ? 40 : 28
                }
                else {
                    return 0
                }
            }
            height: width
            color: Colors.alpha(control.currentColor, 0.12)
            radius: width/2

            Behavior on width {
                NumberAnimation {
                    duration: 150
                    easing.type: Easing.InOutQuad
                }
            }

            MouseArea {
                cursorShape: Qt.PointingHandCursor
                anchors.fill: parent
                enabled: false
            }
        }

        Shape {
            id: valueLabel
            visible: control.valueLabelDisplay == "on" || (control.valueLabelDisplay == 'auto' && hovered)
            x: control.isVertical ? height+shapeRadius+4 : -shapeRadius+parent.width/2
            y: control.isVertical ? -shapeRadius+parent.width/2 : -height-8
            width: 32
            height: 39
            property real shapeRadius: valueLabel.width/2
            rotation: control.isVertical ? 90 : 0
            transformOrigin: Item.TopLeft
            smooth: true
            antialiasing: true

            ShapePath {
                strokeWidth: 0
                strokeColor: control.disabled ? Grey._400 : control.currentColor
                fillColor: control.disabled ? Grey._400 : control.currentColor

                startX: valueLabel.width/2
                startY: 0

                PathArc {
                    x: valueLabel.shapeRadius-valueLabel.shapeRadius/1.414
                    y: valueLabel.shapeRadius+valueLabel.shapeRadius/1.414
                    radiusX: valueLabel.shapeRadius
                    radiusY: valueLabel.shapeRadius
                    direction: PathArc.Counterclockwise
                }

                PathLine {
                    x: valueLabel.shapeRadius
                    y: valueLabel.shapeRadius+valueLabel.shapeRadius/1.414*2
                }

                PathLine {
                    x: valueLabel.shapeRadius+valueLabel.shapeRadius/1.414
                    y: valueLabel.shapeRadius+valueLabel.shapeRadius/1.414
                }

                PathArc {
                    x: valueLabel.width/2
                    y: 0
                    radiusX: valueLabel.shapeRadius
                    radiusY: valueLabel.shapeRadius
                    direction: PathArc.Counterclockwise
                }
            }
        }

        MTypography {
            visible: valueLabel.visible
            x: control.isVertical ? valueLabel.x-valueLabel.width/2-width/2 : valueLabel.x+valueLabel.width/2-width/2
            y: control.isVertical ? valueLabel.y+valueLabel.width/2-height/2 : valueLabel.y+valueLabel.width/2-height/2
            variant: "caption"
            text: valueLabelFormat(control.value)
            color: "#ffffff"
        }
    }
}
