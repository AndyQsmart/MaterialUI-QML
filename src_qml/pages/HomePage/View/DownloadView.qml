import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "../../../common_component/MaterialUI"
import "../../../common_qml"
import "../../../common_js/Color.js" as Color
import "../Component"

Rectangle {
    id: container
    // anchors.fill: parent
    property var listModel
    property var onClick
    property int currentMenuIndex: -1

    MOverflowYBox {
        id: scroll_container
        anchors.fill: parent
        ListView {
            id: download_list_view
            property int item_height: 72
            model: listModel
            anchors.fill: parent
            anchors.margins: 10
            delegate: DownloadItem {
                index: index
                width: download_list_view.width
                height: download_list_view.item_height
                is_select: currentSelectIndex === index
                download_data: {
                    let ans = listModel.get(index)
                    return ans
                }

                onLeftClick: function(){
                    onClick(index)
                }
                onRightClick: function(arg) {
                    onClick(index)
                    // console.log("onitem right click", JSON.stringify(arg))
                    currentMenuIndex = index
                    let scroll_bar = scroll_container.ScrollBar.vertical
                    let offset = scroll_container.contentHeight*scroll_bar.position

                    right_menu.open()
                    let pos_y = arg.mouseY-offset
                    if (pos_y+right_menu.height > container.y+container.height) {
                        pos_y = container.y+container.height-right_menu.height
                    }
                    right_menu.x = arg.mouseX
                    right_menu.y = pos_y
                }
            }
        }

        ColumnLayout {
            visible: listModel.count === 0
            width: parent.width
            height: parent.parent.height
            spacing: 10

            Rectangle {
                Layout.fillHeight: true
            }

            MIcon {
                name: "download"
                size: 28
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            MTypography {
                textColor: "textSecondary"
                text: "暂无下载任务"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            Rectangle {
                Layout.fillHeight: true
            }
        }
    }

    Rectangle {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: {
            let ans = parent.height-listModel.count*download_list_view.item_height-10
            if (ans < 0) {
                return 0
            }
            return ans
        }
        color: Color.none
        MouseArea {
            anchors.fill: parent
            onClicked: {
                onClick(-1)
            }
        }
    }

    MMenu {
        id: right_menu
        width: 120
        // height: 100

        ColumnLayout {
            width: parent.width

            MMenuItem {
                id: start_pause_menu
                Layout.fillWidth: true
                property bool pause: {
                    let item = listModel.get(currentMenuIndex)
                    return item && item.pause ? true : false
                }

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: parent.leftPadding
                    anchors.rightMargin: parent.rightPadding

                    MIcon {
                        name: start_pause_menu.pause ? "arrow-down" : "pause"
                        size: 14
                    }

                    MTypography {
                        RowLayout.fillWidth: true
                        leftPadding: 10
                        text: start_pause_menu.pause ? "开始" : "暂停"
                    }
                }

                onClicked: {
                    if (pause) {
                        console.log("DownloadItem.unpause task:", currentMenuIndex)
                        GlobalTaskList.unpauseDownload(currentMenuIndex)
                    }
                    else {
                        console.log("DownloadItem.pause task:", currentMenuIndex)
                        GlobalTaskList.pauseDownload(currentMenuIndex)
                    }
                    right_menu.close()
                }
            }
            MMenuItem {
                Layout.fillWidth: true

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: parent.leftPadding
                    anchors.rightMargin: parent.rightPadding

                    MIcon {
                        name: "trash"
                        size: 14
                    }

                    MTypography {
                        RowLayout.fillWidth: true
                        leftPadding: 10
                        text: "删除"
                    }
                }

                onClicked: {
                    GlobalTaskList.deleteDownload(currentMenuIndex, false)
                    right_menu.close()
                }
            }
            MMenuItem {
                Layout.fillWidth: true

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: parent.leftPadding
                    anchors.rightMargin: parent.rightPadding

                    MIcon {
                        name: "remove"
                        size: 14
                    }

                    MTypography {
                        RowLayout.fillWidth: true
                        leftPadding: 10
                        text: "彻底删除"
                    }
                }

                onClicked: {
                    GlobalTaskList.deleteDownload(currentMenuIndex, true)
                    right_menu.close()
                }
            }
        }
    }
}
