import QtQuick 2.13
import QtQuick.Dialogs 1.2

MButton {
    id: button
    property string title: qsTr('请选择路径') // 窗口标题
    signal change(string url)

    onClicked: {
        file_dialog.open()
    }

    FileDialog {
        id: file_dialog
        title: button.title
        selectFolder: true
        onAccepted: {
            let path_text = folder.toString()
            if (path_text.indexOf('file:///') === 0) {
                console.log(Qt.platform.os)
                if (Qt.platform.os === 'windows' || Qt.platform.os==="winrt") {
                    path_text = path_text.substring(8, path_text.length)
                }
                else if (Qt.platform.os === 'osx') {
                    path_text = path_text.substring(7, path_text.length)
                }
            }

            change(path_text)
        }
    }
}
