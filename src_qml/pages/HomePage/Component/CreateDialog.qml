import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "../../../common_component/MaterialUI"
import "../../../common_js/Color.js" as Color

MDialog {
    id: createPopup
    disableBackdropClick: true
    width: 600
//    height: 200
    padding: 20
    transitionComponent: MFade {}
    property var tryDownload

    onOpened: {
        if (!save_file.text) {
            // 需要判断是否存在问题
            save_file.text = '下载文件.mp4'
        }
        save_path.text = '/Users/andyqsmart/Downloads'
        download_link.text = 'https://prd-vodcdn.xylink.com/vodfiles/sharefiles/live/2c924e496fb46e43016fbce90dd60562/20201/54018c06-b410-4bd8-a846-cec73ef457e7/stream.m3u8'
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            spacing: 0

            MTypography {
                variant: 'h6'
                text: qsTr("新建下载任务")
                RowLayout.fillWidth: true
            }

            MouseArea {
                width: 32
                height: 32
                cursorShape: Qt.PointingHandCursor

                MIcon {
                    name: 'close'
                    size: 20
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                onClicked: {
                    createPopup.close()
                }
            }
        }

        RowLayout {
            Layout.topMargin: 20
            Layout.fillWidth: true

            MTypography {
                wrapMode: Text.WrapAnywhere
                text: qsTr('下载链接：')
            }

            MTextField {
                id: download_link
                Layout.fillWidth: true
                variant: 'outlined'
            }
        }

        RowLayout {
            Layout.topMargin: 20
            Layout.fillWidth: true

            MTypography {
                wrapMode: Text.WrapAnywhere
                text: qsTr('保存位置：')
            }

            MTextField {
                id: save_path
                Layout.fillWidth: true
                variant: 'outlined'
            }

            MDirectoryButton {
                implicitWidth: 64
                variant: 'outlined'
                size: 'small'
                text: qsTr('选择')
                onChange: {
                    save_path.text = url
                }
            }
        }

        RowLayout {
            Layout.topMargin: 20
            Layout.fillWidth: true

            MTypography {
                wrapMode: Text.WrapAnywhere
                text: qsTr('保存名称：')
            }

            MTextField {
                id: save_file
                Layout.fillWidth: true
                variant: 'outlined'
            }
        }

        RowLayout {
            Layout.topMargin: 20
            Layout.fillWidth: true

            Item {
                Layout.fillWidth: true
            }

            MButton {
                implicitWidth: 80
                variant: 'contained'
                color: 'primary'
                text: '下载'

                onClicked: {
                    tryDownload(download_link.text, save_path.text, save_file.text)
                }
            }
        }

//        MTypography {
//            topPadding: 10
//            ColumnLayout.fillWidth: true
//            horizontalAlignment: Text.AlignRight
//            text: qsTr('Copyright © 2023')
//            textColor: 'textSecondary'
//            variant: 'caption'
//        }
    }
}
