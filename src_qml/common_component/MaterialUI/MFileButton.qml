import QtQuick 2.13
import QtQuick.Dialogs 1.3

MButton {
    id: button
    property string title: qsTr('请选择文件') // 窗口标题
    property bool multiple: false
    property string accept: ''
    property string acceptName: ""
    property string acceptExt: ""
    property bool acceptAll: true

    signal change(var fileUrls)

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
                case "image":
                    ans.push("图片文件 (*.jpg *.jp2 *.jpeg *.png *.gif *.tiff)")
                    break
                case "audio":
                    ans.push("音频文件 (*.mp3 *.3gpp *.ac3 *.au *.mp2 *.mp4)")
                    break
                case "video":
                    ans.push("视频文件 (*.mp4 *.3gpp *.mpeg *.mpg *.rmvb *.mkv)")
                    break
            }
            if ((acceptName && acceptName !== "") || (acceptExt && acceptExt !== "")) {
                ans.push(`${acceptName} (${acceptExt})`)
            }
            if (acceptAll) {
                ans.push("所有文件 (*)")
            }
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
