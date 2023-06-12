import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "../../../common_component/MaterialUI"
import "../../../common_js/Color.js" as Color

Rectangle {
    id: container
    property var download_info: null
    property bool pause: download_info && download_info.pause ? download_info.pause : false
    property string file_name: download_info && download_info.file_name ? download_info.file_name : ''
    property var downloadFile: download_info ? download_info.downloadFile : null
    property var downloadSpeed: download_info ? download_info.downloadSpeed : 0

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        MTypography {
            width: parent.width
            Layout.margins: 10
            text: file_name
        }

        MDivider {
            Layout.fillWidth: true
        }

        MOverflowYBox {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ListView {
                id: file_view
                property int item_height: 50
                anchors.fill: parent
                anchors.margins: 10
                model: downloadFile
                spacing: 10
                delegate: DownloadInfoFileItem {
                    width: file_view.width
                    height: file_view.item_height
                    itemData: {
                        if (!downloadFile) {
                            return {}
                        }
                        let ans = downloadFile.get(index)

                        return ans ? ans : {}
                    }
                }
            }
        }
    }
}
