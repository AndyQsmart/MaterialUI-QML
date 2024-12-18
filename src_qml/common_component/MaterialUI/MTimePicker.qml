import QtQuick 2.15
import "./styles"

Row {
    id: time_picker
    property string variant: 'standard' // 'filled' 'outlined' 'standard'
    property string size: 'medium' // 'medium' | 'small'
    property string color: 'primary'
    property date value: new Date()
    signal change(date date)

    spacing: 10
//    width: childrenRect.width
//    height: childrenRect.height

    function setValue(date) {
        time_picker.value = date
        date_picker.setValue(date)
        box_list.currentIndex = date.getHours()
        min_text.text = date.getMinutes()
    }

    MDatePicker {
        id: date_picker
        variant: time_picker.variant
        size: time_picker.size
        color: time_picker.color
        anchors.bottom: parent.bottom

        onChange: {
            let new_date = new Date(time_picker.value)
            new_date.setFullYear(date.getFullYear())
            new_date.setMonth(date.getMonth())
            new_date.setDate(date.getDate())
            time_picker.value = new_date
            time_picker.change(new_date)
        }

        Component.onCompleted: {
            date_picker.value = time_picker.value
        }
    }

    MSelectBase {
        id: hour_select
        property bool is_init: false
        variant: time_picker.variant
        size: time_picker.size
        selectColor: time_picker.color
        anchors.bottom: parent.bottom

        displayItem: MTypography {
            id: text_item
            variant: "body1"
            text: hour_select.value < 10 ? `0${hour_select.value} 时` : `${hour_select.value} 时`
            height: 18 //16*1.1876 - 1 防止文字导致高度变化，此外和TextField相差1
            noWrap: true
            lineHeight: TypographyStyle.convertLineHeight(1.1876)
        }

//            Binding {
//                target: text_item
//                property: 'color'
//                when: disabled
//                value: Palette.lightTextDisabled
//            }

        onSelectOpen: {
            menu_dialog.open()
        }

        onChange: {
            if (!is_init) {
                return
            }

            let new_date = new Date(time_picker.value)
            new_date.setHours(hour_select.value)
            time_picker.value = new_date
            time_picker.change(new_date)
            // console.log(new_date)
        }

        Component.onCompleted: {
            hour_select.value = time_picker.value.getHours()
            is_init = true
        }

        MPopover {
            id: menu_dialog
            anchorEl: hour_select
            height: 400
            anchorOrigin: Item.Right
            transformOrigin: Item.Left

            MOverflowYBox {
                height: 400

                MMenuList {
                    Repeater {
                        model: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]

                        delegate: MMenuItem {
                            text: modelData < 10 ? `0${modelData} 时` : `${modelData} 时`

                            onClicked: {
                                hour_select.value = modelData
                                hour_select.index = index
                                hour_select.change(hour_select.value, hour_select.index)
                                menu_dialog.close()
                            }
                        }
                    }
                }
            }

            onAboutToShow: {
                hour_select.menuOpened = true
            }

            onClosed: {
                hour_select.menuOpened = false
            }
        }
    }

    MTextField {
        property bool is_init: false
        id: min_text
        width: 110
        variant: time_picker.variant
        size: time_picker.size
        color: time_picker.color
        anchors.bottom: parent.bottom

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
        }

        MTypography {
            id: min_unit
            x: parent.width-min_unit.width-10
            z: 1
            height: parent.height
            text: qsTr("分")
            verticalAlignment: Text.AlignVCenter
        }
    }
}

