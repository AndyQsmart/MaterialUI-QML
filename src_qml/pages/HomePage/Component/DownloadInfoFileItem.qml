import QtQuick 2.13
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "../../../common_component/MaterialUI"
import "../../../common_js/Color.js" as Color

Rectangle {
    property var itemData: ({})
    property string status: itemData && itemData.status ? itemData.status : "waiting"

    function byteToStr(totalByte) {
        if (totalByte < 1024) {
            return `${totalByte}B`
        }
        totalByte = totalByte/1024
        if (totalByte < 1024) {
            return `${totalByte.toFixed(2)}KB`
        }
        totalByte = totalByte/1024
        if (totalByte < 1024) {
            return `${totalByte.toFixed(2)}MB`
        }
        totalByte = totalByte/1024
        return `${totalByte.toFixed(2)}GB`
    }

    Rectangle {
        anchors.left: parent.left
        anchors.top: parent.top
        height: parent.height
        width: 2
        color: Color.primary
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: 5
        spacing: 10

        Rectangle {
            width: parent.width
            height: children[0].height

            MTypography {
                width: parent.width
                text: itemData && itemData.out ? itemData.out : ""
            }
        }

        Rectangle {
            width: parent.width
            height: children[0].height

            MTypography {
                id: total_size
                anchors.left: parent.left
                width: parent.width/3
                text: {
                    if (status === "waiting") {
                        return "等待下载"
                    }
                    if (status === "error") {
                        return "下载错误"
                    }
                    if (status === "removed") {
                        return "已删除"
                    }

                    let totalByte = itemData && itemData.totalLength ? itemData.totalLength : 0
                    return byteToStr(totalByte)
                }
            }

            MTypography {
                anchors.left: total_size.right
                width: parent.width/3
                text: {
                    if (status !== "active") {
                        return ""
                    }

                    let downloadSpeed = itemData && itemData.downloadSpeed ? itemData.downloadSpeed : 0
                    return `${byteToStr(downloadSpeed)}/s`
                }
            }

            MTypography {
                anchors.right: parent.right
                width: parent.width/3
                text: {
                    if (status === "waiting") {
                        return ""
                    }
                    if (status === "complete") {
                        return "100%"
                    }
                    if (status === "error") {
                        return ""
                    }
                    if (status === "removed") {
                        return ""
                    }

                    let completedLength = itemData && itemData.completedLength ? itemData.completedLength : 0
                    let totalByte = itemData && itemData.totalLength ? itemData.totalLength : 1
                    return `${(completedLength/totalByte*100).toFixed(2)}%`
                }
            }
        }
    }
}
