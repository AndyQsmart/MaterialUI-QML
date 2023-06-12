import QtQuick 2.13
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12
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
                    return Colors.alpha(Palette.primaryMain, parent.hovered ? 1 : 0.7)
                }
                else if (control.color == 'secondary') {
                    return Colors.alpha(Palette.secondaryMain, parent.hovered ? 1 : 0.7)
                }
                else {
                    return Colors.alpha(Palette.lightTextPrimary, parent.hovered ? 0.4 : 0.26)
                }
            }
            else {
                if (control.color == 'primary') {
                    return Colors.alpha(Palette.darkTextPrimary, parent.hovered ? 1 : 0.7)
                }
                else if (control.color == 'secondary') {
                    return Colors.alpha(Palette.darkTextSecondary, parent.hovered ? 1 : 0.7)
                }
                else {
                    return Colors.alpha(Palette.lightTextPrimary, parent.hovered ? 0.4 : 0.26)
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
            return Palette.primaryMain
        }
        else if (color == 'secondary') {
            return Palette.secondaryMain
        }
        else {
            return Palette.lightActionSelected
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
            RowLayout.alignment: Qt.AlignVCenter
            RowLayout.leftMargin: {
                if (control.variant == 'outlined') {
                    return control.size == 'small' ? 4 : 5
                }
                else {
                    return control.size == 'small' ? 2 : 4
                }
            }
            RowLayout.rightMargin: control.size == 'small' ? -4 : -6
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
            RowLayout.alignment: Qt.AlignVCenter
            RowLayout.leftMargin: {
                if (control.variant == 'outlined') {
                    return control.size == 'small' ? 4 : 5
                }
                else {
                    return control.size == 'small' ? 2 : 4
                }
            }
            RowLayout.rightMargin: control.size == 'small' ? -4 : -6
            color: Colors.commonTransparent
            Loader {
                id: iconItem
                anchors.centerIn: parent
            }
        }

        MTypography {
            RowLayout.alignment: Qt.AlignVCenter
            text: control.label
            font.pointSize: 13
            lineHeight: 1
            leftPadding: control.size == 'small' ? 8 : 12
            rightPadding: control.size == 'small' ? 8 : 12
            color: {
                let the_color = Palette.lightTextPrimary
                if (control.variant == 'outlined') {
                    if (control.color != 'default') {
                        the_color = control._color
                    }
                    else {
                        the_color = Palette.lightTextPrimary
                    }
                }
                else {
                    if (control.color == 'primary') {
                        the_color = Palette.darkTextPrimary
                    }
                    else if (control.color == 'secondary') {
                        the_color = Palette.darkTextSecondary
                    }
                    else {
                        the_color = Palette.lightTextPrimary
                    }
                }
                return Colors.alpha(the_color, control._opacity)
            }
        }

        Rectangle {
            visible: control.deletable
            width: control.size == 'small' ? 16 : 22
            height: width
            RowLayout.alignment: Qt.AlignVCenter
            RowLayout.leftMargin: control.size == 'small' ? -4 : -6
            RowLayout.rightMargin: {
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

    Ripple {
        visible: clickable && !disabled
        clipRadius: control.height/2
        width: parent.width
        height: parent.height
        pressed: touch_area.pressed
        anchor: control
        color: {
            let the_color = Palette.lightTextPrimary
            if (control.variant == 'outlined') {
                if (control.color != 'default') {
                    the_color = control._color
                }
                else {
                    the_color = Palette.lightTextPrimary
                }
            }
            else {
                if (control.color == 'primary') {
                    the_color = Palette.darkTextPrimary
                }
                else if (control.color == 'secondary') {
                    the_color = Palette.darkTextSecondary
                }
                else {
                    the_color = Palette.lightTextPrimary
                }
            }
            return Colors.alpha(the_color, 0.3)
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
    }
}
