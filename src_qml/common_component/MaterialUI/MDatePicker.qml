import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "./styles"

Rectangle {
    id: datePicker
    property date value: new Date()
    property string _last_text: ''
//    property int _last_selection_start: -1
//    property int _last_selection_end: -1
    signal change(date date)

    width: children[1].width
    height: children[1].height
    radius: 5
    border.width: textInput.activeFocus ? 2 : 1
    border.color: textInput.activeFocus ? Palette.primaryMain : '#3B000000'

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

    MouseArea {
        anchors.fill: parent

        onClicked: {
            textInput.focus = true
        }
    }

    Row {
        id: row
        topPadding: 10
        bottomPadding: 10
        leftPadding: 20
        rightPadding: 20

        MouseArea {
            width: children[0].width
            height: children[0].height
            cursorShape: Qt.PointingHandCursor

            Icon {
                name: 'calendar'
                size: 16
                color: Palette.lightTextSecondary
            }

            onClicked: {
//                mouse.accepted = false
                selectPopup.open()
            }
        }

        TextInput {
            id: textInput
            font.pointSize: TypographyStyle.fontStyleList.body2.size
            text: "0000/00/00"
//            text: getTimeByDate(new Date(), "%y/%MM/%dd")
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: 20

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

            MouseArea {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                cursorShape: Qt.IBeamCursor
                enabled: false
            }
        }
    }

    Popup {
        id: selectPopup
        x: 0
        padding: 0
        visible: false
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

        DateSelector {
            id: dateSelector
//            selectedDate: datePicker.value

            onClicked: {
//                console.log(date)
                datePicker.value = date
                textInput.text = getTimeByDate(date, "%y/%MM/%dd")
//                console.log('date click change')
                change(date)
            }

            Component.onCompleted: {
                dateSelector.selectedDate = datePicker.value
            }
        }
    }
}
