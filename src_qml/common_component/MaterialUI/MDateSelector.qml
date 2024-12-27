import QtQuick
import QtQuick.Controls
// import QtQuick.Controls.Styles 1.4
// import QtQuick.Controls.Material 2.15
// import QtQuick.Controls.Material.impl 2.15
import QtQuick.Layouts
import "./styles"
import "./colors"

MPaper {
    id: root
    property date selectedDate: new Date()
    property int currentYear: (new Date()).getFullYear()
    property int currentMonth: (new Date()).getMonth()
    property var monthName: [
        "一月", "二月", "三月", "四月", "五月", "六月",
        "七月", "八月", "九月", "十月", "十一月", "十二月"
    ]

    signal clicked(date vDate)

    function clickDate(vDate) {
        root.selectedDate = vDate
        root.currentYear = root.selectedDate.getFullYear()
        root.currentMonth = root.selectedDate.getMonth()

        root.clicked(vDate)
    }

    function showPreviousMonth() {
        if (root.currentMonth > 0) {
            root.currentMonth -= 1
        }
        else {
            root.currentMonth = 11
            root.currentYear -= 1
        }
    }

    function showNextMonth() {
        if (root.currentMonth < 11) {
            root.currentMonth += 1
        }
        else {
            root.currentMonth = 0
            root.currentYear += 1
        }
    }

    width: childrenRect.width
    height: childrenRect.height

    ColumnLayout {
        spacing: 0

        RowLayout {
            Layout.topMargin: 4
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            Layout.fillWidth: true
            spacing: 10

            MIconButton {
                id: left_year_button

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
                text: `${monthName[root.currentMonth]} ${root.currentYear}`
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

        DayOfWeekRow {
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            spacing: 0

            delegate: MTypography {
                width: 44
                align: 'center'
                variant: "caption"
                textColor: "textSecondary"
                gutterBottom: true
                text: shortName
                horizontalAlignment: Text.AlignHCenter
            }
        }

        MonthGrid {
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            Layout.bottomMargin: 10

            year: root.currentYear
            month: root.currentMonth
            spacing: 0

            delegate: Item {
                width: 44
                height: 36

                Rectangle {
                    id: day_item
                    property bool selected: model.year === root.selectedDate.getFullYear() && model.month === root.selectedDate.getMonth() && model.day === root.selectedDate.getDate()
                    property bool visibleMonth: model.year === root.currentYear && model.month === root.currentMonth

                    anchors.centerIn: parent
                    width: 36
                    height: 36
                    radius: width/2
                    color: day_item.selected ? MPalette.primaryMain : (mouse_area.containsMouse ? Colors.alpha("#000000", 0.04) : "#00ffffff")

                    MTypography {
                        anchors.centerIn: parent
                        textColor: day_item.selected ? "#ffffff" : (!day_item.visibleMonth ? "textSecondary" : "textPrimary")

                        text: model.day
                    }

                    MouseArea {
                        id: mouse_area
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true

                        onClicked: {
                            root.clickDate(model.date)
                        }

                        onPressed: {
                            touch_ripple.start(mouse_area.mouseX, mouse_area.mouseY)
                        }

                        onReleased: {
                            touch_ripple.stop()
                        }
                    }

                    MTouchRipple {
                        id: touch_ripple
                        anchors.fill: parent
                        currentColor: day_item.selected ? MPalette.primaryMain : Colors.commonBlack
                    }

                    layer.enabled: true
                    layer.effect: MOpacityMask {
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
}
