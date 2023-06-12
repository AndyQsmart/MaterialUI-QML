import QtQuick 2.13
import QtQuick.Dialogs 1.2

MButton {
    id: button
    property string title: qsTr('请选择文件') // 窗口标题
    property bool multiple: false
    property string accept: ''

    signal change(var url_list)

    onClicked: {
        file_dialog.open()
    }

    FileDialog {
        id: file_dialog
        title: button.title
        selectMultiple: multiple
        nameFilters: {
            let ans = []
            switch (button.accept) {
                case "srt":
                    ans.push("字幕文件 (*.srt)")
                    break
            }
            ans.push("所有文件 (*)")
            return ans
        }
        onAccepted: {
            let ans = []
            for (let i = 0; i < fileUrls.length; i++) {
                let path_text = fileUrls[i]
                if (path_text.indexOf('file:///') === 0) {
                    console.log(Qt.platform.os)
                    if (Qt.platform.os === 'windows' || Qt.platform.os==="winrt") {
                        path_text = path_text.substring(8, path_text.length)
                    }
                    else if (Qt.platform.os === 'osx') {
                        path_text = path_text.substring(7, path_text.length)
                    }
                    ans.push(path_text)
                }
            }
            change(ans)
        }
    }
}
