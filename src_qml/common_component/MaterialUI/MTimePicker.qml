import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.11
import "./"
import "./styles"

Item {
    id: time_picker
    property date value: new Date()
    signal change(date date)

    height: children[0].height

    function setValue(date) {
        time_picker.value = date
        date_picker.setValue(date)
        box_list.currentIndex = date.getHours()
        min_text.text = date.getMinutes()
    }

    RowLayout {
        height: children[0].height

        DatePicker {
            id: date_picker
            onChange: {
//                console.log(`datepicker: change ${date_picker.value}`)
                let new_date = new Date(time_picker.value)
                new_date.setFullYear(date.getFullYear())
                new_date.setMonth(date.getMonth())
                new_date.setDate(date.getDate())
                time_picker.value = new_date
                time_picker.change(new_date)
            }

            Component.onCompleted: {
                date_picker.value = time_picker.value
//                console.log(time_picker.value)
            }
        }

        ComboBox {
            property bool is_init: false
            id: box_list
            Layout.leftMargin: 10
            font.pointSize: TypographyStyle.fontStyleList.body2.size
            popup.height: 400
            model: {
                let hour_list = []
                for (let i = 0; i < 24; i++) {
                    hour_list.push((i < 10 ? '0'+i : ''+i) + ' 时')
                }
                return hour_list
            }

            onCurrentIndexChanged: {
                if (!is_init) {
                    return
                }

                let new_date = new Date(time_picker.value)
                new_date.setHours(box_list.currentIndex)
                time_picker.value = new_date
                change(new_date)
            }

            Component.onCompleted: {
                box_list.currentIndex = time_picker.value.getHours()
                is_init = true
            }

            contentItem: MTypography {
                leftPadding: 10
                topPadding: 12
                bottomPadding: 12
                text: box_list.displayText
                font: box_list.font
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
//                implicitWidth: 120
//                implicitHeight: 40
            }

            Rectangle {
                anchors.fill: parent
                enabled: false
                radius: 5
                border.width: 1
                border.color: '#3B000000'
            }
        }

        Rectangle {
            RowLayout.fillHeight: true
            Layout.leftMargin: 10
            width: 110

            TextField {
                property bool is_init: false
                id: min_text
                anchors.fill: parent
                variant: 'outlined'
                onTextChanged: {
                    if (!is_init) {
                        return
                    }

                    let the_min = parseInt(min_text.text)
                    if (!the_min) {
                        the_min = ''
                    }
                    else if (the_min >= 60) {
                        the_min = 59
                    }
                    min_text.text = the_min
                    let new_date = new Date(time_picker.value)
                    new_date.setMinutes(the_min ? the_min : 0)
                    time_picker.value = new_date
                    change(new_date)
                }

                Component.onCompleted: {
                    min_text.text = time_picker.value.getMinutes()
                    is_init = true
//                    console.log(time_picker.value.getMinutes())
//                    console.log(min_text.text)
                }

                MTypography {
                    id: min_unit
                    x: parent.width-min_unit.width-10
                    height: parent.height
                    text: qsTr("分")
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
