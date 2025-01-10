import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material
import "./styles"
import "./colors"

Control {
    id: control
    property bool clickable: false
    property bool deletable: false
    property string color: 'default' // 'default' 'primary' 'secondary'
    property Component deleteIcon: MIcon {
        anchors.centerIn: parent
        size: control.size == 'small' ? 13 : 18
        name: 'times-circle'
        color: {
            if (control.variant == 'outlined') {
                if (control.color == 'primary') {
                    return Colors.alpha(MPalette.primaryMain, parent.hovered ? 1 : 0.7)
                }
                else if (control.color == 'secondary') {
                    return Colors.alpha(MPalette.secondaryMain, parent.hovered ? 1 : 0.7)
                }
                else {
                    return Colors.alpha(MPalette.lightTextPrimary, parent.hovered ? 0.4 : 0.26)
                }
            }
            else {
                if (control.color == 'primary') {
                    return Colors.alpha(MPalette.darkTextPrimary, parent.hovered ? 1 : 0.7)
                }
                else if (control.color == 'secondary') {
                    return Colors.alpha(MPalette.darkTextSecondary, parent.hovered ? 1 : 0.7)
                }
                else {
                    return Colors.alpha(MPalette.lightTextPrimary, parent.hovered ? 0.4 : 0.26)
                }
            }
        }
    }
    property bool disabled: false
    property alias avatar: avatarItem.sourceComponent
    property alias icon: iconItem.sourceComponent
    property string label: ''
    property string size: 'medium' // 'medium 'small'
    property string variant: 'default' // 'default' 'outlined'

    implicitHeight: size == 'small' ? 24 : 32
    height: implicitHeight

    signal clicked
    signal deleted

    property string _color: {
        if (color == 'primary') {
            return MPalette.primaryMain
        }
        else if (color == 'secondary') {
            return MPalette.secondaryMain
        }
        else {
            return MPalette.lightActionSelected
        }
    }
    property real _opacity: disabled ? 0.5 : 1

    background: Rectangle {
        border.width: variant == 'outlined' ? 1 : 0
        border.color: Colors.alpha(control.color != 'default' ? control._color : Grey._400, control._opacity)
        radius: control.height/2
        color: {
            variant == 'outlined' ? Colors.commonTransparent : Colors.addAlpha(control._color, control._opacity)
        }
    }

    contentItem: RowLayout {
        spacing: 0

        Rectangle {
            visible: control.avatar ? true : false
            width: control.size == 'small' ? 18 : 24
            height: width
            Layout.alignment: Qt.AlignVCenter
            Layout.leftMargin: {
                if (control.variant == 'outlined') {
                    return control.size == 'small' ? 4 : 5
                }
                else {
                    return control.size == 'small' ? 2 : 4
                }
            }
            Layout.rightMargin: control.size == 'small' ? -4 : -6
            // property int _fontSize: 12
            // color: @grey700
            color: Colors.commonTransparent
            Loader {
                id: avatarItem
                anchors.centerIn: parent
            }
        }

        Rectangle {
            visible: control.icon ? true : false
            width: control.size == 'small' ? 18 : 24
            height: width
            Layout.alignment: Qt.AlignVCenter
            Layout.leftMargin: {
                if (control.variant == 'outlined') {
                    return control.size == 'small' ? 4 : 5
                }
                else {
                    return control.size == 'small' ? 2 : 4
                }
            }
            Layout.rightMargin: control.size == 'small' ? -4 : -6
            color: Colors.commonTransparent
            Loader {
                id: iconItem
                anchors.centerIn: parent
            }
        }

        MTypography {
            Layout.alignment: Qt.AlignVCenter
            text: control.label
            fontSize: 13
            lineHeight: 1
            leftPadding: control.size == 'small' ? 8 : 12
            rightPadding: control.size == 'small' ? 8 : 12
            color: {
                let the_color = MPalette.lightTextPrimary
                if (control.variant == 'outlined') {
                    if (control.color != 'default') {
                        the_color = control._color
                    }
                    else {
                        the_color = MPalette.lightTextPrimary
                    }
                }
                else {
                    if (control.color == 'primary') {
                        the_color = MPalette.darkTextPrimary
                    }
                    else if (control.color == 'secondary') {
                        the_color = MPalette.darkTextSecondary
                    }
                    else {
                        the_color = MPalette.lightTextPrimary
                    }
                }
                return Colors.alpha(the_color, control._opacity)
            }
        }

        Rectangle {
            visible: control.deletable
            width: control.size == 'small' ? 16 : 22
            height: width
            Layout.alignment: Qt.AlignVCenter
            Layout.leftMargin: control.size == 'small' ? -4 : -6
            Layout.rightMargin: {
                if (control.variant == 'outlined') {
                    return control.size == 'small' ? 3 : 5
                }
                else {
                    return control.size == 'small' ? 4 : 5
                }
            }
            color: Colors.commonTransparent
            Loader {
                id: deleteLoader
                property bool hovered: false
                anchors.centerIn: parent
                sourceComponent: control.deleteIcon
            }

            MouseArea {
                cursorShape: Qt.PointingHandCursor
                anchors.fill: parent
                enabled: true
                hoverEnabled: true
                onClicked: {
                    control.deleted()
                }
                onEntered: {
                    deleteLoader.hovered = true
                }
                onExited: {
                    deleteLoader.hovered = false
                }
            }
        }
    }


    Rectangle {
        anchors.fill: parent
        radius: control.height/2
        color: "#00ffffff"

        layer.enabled: true
        layer.effect: MOpacityMask {
            maskSource: Rectangle {
                width: control.width
                height: control.height
                radius: control.height/2
            }
        }

        MTouchRipple {
            id: ripple
            visible: clickable && !disabled
            width: parent.width
            height: parent.height
            currentColor: {
                let the_color = MPalette.lightTextPrimary
                if (control.variant == 'outlined') {
                    if (control.color != 'default') {
                        the_color = control._color
                    }
                    else {
                        the_color = MPalette.lightTextPrimary
                    }
                }
                else {
                    if (control.color == 'primary') {
                        the_color = MPalette.darkTextPrimary
                    }
                    else if (control.color == 'secondary') {
                        the_color = MPalette.darkTextSecondary
                    }
                    else {
                        the_color = MPalette.lightTextPrimary
                    }
                }
                return the_color
            }
        }
    }

    MouseArea {
        z: -1
        id: touch_area
        cursorShape: clickable ? Qt.PointingHandCursor : Qt.ArrowCursor
        anchors.fill: parent
        enabled: clickable

        onClicked: {
            control.clicked()
        }

        onPressedChanged: {
            if (touch_area.pressed) {
                ripple.start(mouseX, mouseY)
            }
            else {
                ripple.stop()
            }
        }
    }
}
