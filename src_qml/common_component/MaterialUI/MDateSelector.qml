import QtQuick 2.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import "./styles"
import "./colors"

Calendar {
    id: root
    frameVisible: false

    style: CalendarStyle {
        gridVisible: false

        background: Rectangle {
            implicitWidth: 310
            implicitHeight: 305
            color: '#00ffffff'

            Rectangle {
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width+20
                height: parent.height+10
                radius: Palette.borderRadius
                color: Colors.commonWhite

                layer.enabled: true
                layer.effect: MShadow {
                    elevation: 1
                }
            }
        }

        navigationBar: RowLayout {
            width: parent.width
            spacing: 10

            MIconButton {
                id: left_year_button
                Layout.topMargin: 5

                Item {
                    width: 20
                    height: 20

                    MIcon {
                        anchors.centerIn: parent
                        name: "angle-left"
                        size: 20
                        color: left_year_button.iconColor
                    }
                }

                onClicked: {
                    root.showPreviousMonth()
                }
            }

            MTypography{
                Layout.fillWidth: true
                align: "center"
                text: styleData.title
            }

            MIconButton {
                id: right_year_button

                Item {
                    width: 20
                    height: 20

                    MIcon {
                        anchors.centerIn: parent
                        name: "angle-right"
                        size: 20
                        color: right_year_button.iconColor
                    }
                }

                onClicked: {
                    root.showNextMonth()
                }
            }
        }

        dayOfWeekDelegate: MTypography {
            align: 'center'
            variant: "caption"
            textColor: "textSecondary"
            gutterBottom: true
            text: {
                switch (styleData.dayOfWeek) {
                    case Locale.Sunday: return "周日"
                    case Locale.Monday: return "周一"
                    case Locale.Tuesday: return "周二"
                    case Locale.Wednesday: return "周三"
                    case Locale.Thursday: return "周四"
                    case Locale.Friday: return "周五"
                    case Locale.Saturday: return "周六"
                }
            }
        }

        dayDelegate: Item {
            Rectangle {
                id: day_item

                anchors.centerIn: parent
                width: 36
                height: 36
                radius: width/2
                color: styleData.selected ? Palette.primaryMain : (styleData.hovered ? Colors.alpha("#000000", 0.04) : "#00ffffff")

                MTypography {
                    anchors.centerIn: parent
                    textColor: styleData.selected ? "#ffffff" : (!styleData.valid || !styleData.visibleMonth ? "textSecondary" : "textPrimary")

                    text: styleData.date.getDate()
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: !styleData.valid ? Qt.ArrowCursor : Qt.PointingHandCursor
                    enabled: false
                }

                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Rectangle {
                        width: day_item.width
                        height: day_item.height
                        radius: day_item.radius
                    }
                }
            }
        }
    }
}
