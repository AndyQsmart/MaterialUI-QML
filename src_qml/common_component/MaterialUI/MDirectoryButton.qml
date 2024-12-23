import QtQuick
import QtQuick.Dialogs

MButton {
    id: button
    property string title: qsTr('请选择路径') // 窗口标题
    signal change(string url)

    onClicked: {
        file_dialog.open()
    }

    FolderDialog {
        id: file_dialog
        title: button.title
        onAccepted: {
            let path_text = selectedFolder.toString()
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
