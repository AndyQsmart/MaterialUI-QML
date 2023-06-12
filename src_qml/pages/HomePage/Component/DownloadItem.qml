import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "../../../common_qml"
import "../../../common_component/MaterialUI"
import "../../../common_component/MaterialUI/styles"
import "../../../common_js/Color.js" as Color

MListItem {
    id: mListItem
    button: true
    property int index
    property var download_data: ({})
    property bool is_select: false
    property var onLeftClick
    property var onRightClick
    property string file_name: download_data && download_data.file_name ? download_data.file_name : ""
    property bool pause: download_data && download_data.pause ? true : false
    property int downloadSpeed: download_data && download_data.downloadSpeed ? download_data.downloadSpeed : 0
    property int uploadSpeed: download_data && download_data.uploadSpeed ? download_data.uploadSpeed : 0
    property int numActive: download_data && download_data.numActive ? download_data.numActive : 0
    property int numWaiting: download_data && download_data.numWaiting ? download_data.numWaiting : 0
    property int numStopped: download_data && download_data.numStopped ? download_data.numStopped : 0
    property int numTotal: download_data && download_data.numTotal ? download_data.numTotal : 0

    Timer {
        interval: 500
        running: !mListItem.pause
        repeat: true
        onTriggered: {
            GlobalTaskList.refreshDownloadStatus(index)
        }
    }

    Rectangle {
        visible: is_select
        anchors.fill: parent
        color: Colors.alpha(Color.primary, 0.3)
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onClicked: {
            if (mouse.button === Qt.RightButton) {
                onRightClick({
                    mouseX: mouseX+mListItem.x,
                    mouseY: mouseY+mListItem.y,
                })
                return
            }
            onLeftClick()
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 0

        MIcon {
            name: "folder-open"
            color: "#ffb74d"
            size: 32
        }

        Rectangle {
            RowLayout.fillWidth: true
            RowLayout.fillHeight: true
            Layout.leftMargin: 10
            color: Color.none

            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                MTypography {
                    text: file_name
                    lineHeight: 1
                }

                RowLayout {
                    MTypography {
                        text: `${numStopped}/${numTotal}`
                        variant: "caption"
                        textColor: "textSecondary"
                        lineHeight: 1
                    }

                    Rectangle {
                        RowLayout.fillWidth: true
                        color: Color.none
                    }

                    MTypography {
                        text: {
                            if (pause) {
                                return ""
                            }

                            // console.log(downloadSpeed)
                            let byte_speed = downloadSpeed
                            if (byte_speed < 1024) {
                                return `${byte_speed}B/s`
                            }

                            byte_speed = byte_speed/1024
                            if (byte_speed < 1024) {
                                return `${byte_speed.toFixed(2)}KB/s`
                            }

                            byte_speed = byte_speed/1024
                            if (byte_speed < 1024) {
                                return `${byte_speed.toFixed(2)}MB/s`
                            }

                            byte_speed = byte_speed/1024
                            return `${byte_speed.toFixed(2)}GB/s`
                        }
                        variant: "caption"
                        textColor: "textSecondary"
                        lineHeight: 1
                    }
                }

                MLinearProgress {
                    ColumnLayout.fillWidth: true
                    value: numStopped/(numTotal)
                    variant: "determinate"
                }
            }
        }

        Rectangle {
            width: 30
            RowLayout.fillHeight: true
            color: Color.none

            ColumnLayout {
                anchors.fill: parent

                Rectangle {
                    width: 30
                    height: 30
                    color: Color.none

                    MButton {
                        id: mButton
                        Layout.alignment: Qt.AlignVCenter
                        width: 30
                        height: 30
                        topPadding: 10
                        rightPadding: 10
                        bottomPadding: 10
                        leftPadding: 10

                        onClicked: {
                            if (pause) {
                                console.log("DownloadItem.unpause task:", mListItem.index)
                                GlobalTaskList.unpauseDownload(mListItem.index)
                            }
                            else {
                                console.log("DownloadItem.pause task:", mListItem.index)
                                GlobalTaskList.pauseDownload(mListItem.index)
                            }
                        }

                        MIcon {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: Color.dark_gray
                            name: pause ? "arrow-down" : "pause"
                        }                        
                    }
                }
                Rectangle {
                    ColumnLayout.fillWidth: true
                    ColumnLayout.fillHeight: true
                    color: Color.none
                }
            }
        }
    }
}
