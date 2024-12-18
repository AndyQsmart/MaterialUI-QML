import QtQuick 2.15
import "./styles"

Item {
    id: datePicker
    property string variant: 'standard' // 'filled' 'outlined' 'standard'
    property string size: 'medium' // 'medium' | 'small'
    property string color: 'primary'
    property date value: new Date()
    signal change(date date)



    property string _last_text: ''
    width: textInput.width
    height: textInput.height
//    radius: 5
//    border.width: textInput.activeFocus ? 2 : 1
//    border.color: textInput.activeFocus ? Palette.primaryMain : '#3B000000'

    function prefixZero(num, length) {
        return ('' + num).length < length ? ((new Array(length + 1)).join('0') + num).slice(-length) : '' + num;
    }

    function getTimeByDate(date, format="%y.%M.%d %h:%mm.%s") {
        // console.log(date)
        format = format.replace("%MM", prefixZero(date.getMonth()+1, 2))
        format = format.replace("%dd", prefixZero(date.getDate(), 2))
        format = format.replace("%hh", prefixZero(date.getHours(), 2))
        format = format.replace("%mm", prefixZero(date.getMinutes(), 2))
        format = format.replace("%ss", prefixZero(date.getSeconds(), 2))

        format = format.replace("%y", date.getFullYear())
        format = format.replace("%M", date.getMonth()+1)
        format = format.replace("%d", date.getDate())
        format = format.replace("%h", date.getHours())
        format = format.replace("%m", date.getMinutes())
        format = format.replace("%s", date.getSeconds())
        return format
    }

    function setValue(date) {
        value = date
        dateSelector.selectedDate = date
        datePicker._last_text = getTimeByDate(date, "%y/%MM/%dd")
        textInput.text = datePicker._last_text
    }


    MTextField {
        id: textInput
        variant: datePicker.variant
        size: datePicker.size
        color: datePicker.color
        text: "0000/00/00"
//        text: getTimeByDate(new Date(), "%y/%MM/%dd")
        leftPadding: 30+textInput._padding[3]

        onTextChanged: {
            if (textInput.text !== datePicker._last_text) {
//                    console.log(textInput.text, datePicker._last_text)

                let pre_select_start = textInput.selectionStart
                let pre_select_end = textInput.selectionEnd
                let old_str = datePicker._last_text
                let new_str = textInput.text
                let ans_str = ''
                let old_valid_count = 0
                let new_valid_count = 0

                let i = 0
                for (i = 0; i < old_str.length; i++) {
                    let item = old_str[i]
                    if (item >= '0' && item <= '9' || item === '_' || item === '/') {
                        old_valid_count++
                    }
                }
                for (i = 0; i < new_str.length; i++) {
                    let item = new_str[i]
                    if (item >= '0' && item <= '9' || item === '_' || item === '/') {
                        new_valid_count++
                    }
                }

                for (i = 0; i < new_str.length; i++) {
                    let item = new_str[i]
                    if (item >= '0' && item <= '9' || item === '_') {
                        ans_str += item
                        if (ans_str.length === 4) {
                            ans_str += '/'
                        }
                        if (ans_str.length === 7) {
                            ans_str += '/'
                        }
                        if (ans_str.length === 10) {
                            break
                        }
                    }
                }
                while (ans_str.length < 10) {
                    ans_str += '_'
                    if (ans_str.length === 4) {
                        ans_str += '/'
                    }
                    if (ans_str.length === 7) {
                        ans_str += '/'
                    }
                }

                textInput.text = ans_str
                let now_index = pre_select_end+new_valid_count-old_valid_count
                if (new_valid_count > old_valid_count && (now_index === 4 || now_index === 7)) {
                    now_index++
                }
                textInput.select(now_index, now_index)
                datePicker._last_text = ans_str
                if (/[0-9]{4}\/[0-9]{2}\/[0-9]{2}/.test(ans_str)) {
                    let date_list = ans_str.split('/')
                    let new_date = new Date(datePicker.value)
                    new_date.setFullYear(date_list[0])
                    new_date.setMonth(date_list[1]-1)
                    new_date.setDate(date_list[2])
                    datePicker.value = new_date
                    dateSelector.selectedDate = new_date
                    change(new_date)
                }
            }
        }

        Component.onCompleted: {
            datePicker._last_text = getTimeByDate(datePicker.value, "%y/%MM/%dd")
//                console.log(datePicker.value)
            textInput.text = datePicker._last_text
        }
    }


    Item {
        anchors.left: parent.left
        anchors.leftMargin: textInput._padding[3]
        anchors.verticalCenter: parent.verticalCenter
        width: 16
        height: 16

        MIconButton {
            anchors.centerIn: parent

            Item {
                width: 16
                height: 16

                MIcon {
                    name: 'calendar'
                    size: 16
                    color: Palette.lightTextSecondary
                    anchors.centerIn: parent
                }
            }

            onClicked: {
                selectPopup.open()
            }
        }
    }

    MPopover {
        id: selectPopup
        anchorEl: datePicker
        anchorOrigin: Item.Bottom
        transformOrigin: Item.Top
        marginThreshold: 26 // 16+10
        focus: true

        MDateSelector {
            id: dateSelector
//            selectedDate: datePicker.value

            onClicked: {
                datePicker.value = date
                textInput.text = getTimeByDate(date, "%y/%MM/%dd")
                change(date)
            }

            Component.onCompleted: {
                dateSelector.selectedDate = datePicker.value
            }
        }
    }
}
