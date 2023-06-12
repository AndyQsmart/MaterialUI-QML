pragma Singleton

import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    property var download_list: ListModel {
        // const { download_link, file_name, file_path, m3u8, file_urls, pause, downloadFile } = item
        // const { url } = file_path[index]
        // const { gid, uri, out, status } = downloadFile[index]
        // const { base_uri, base_path, files } = m3u8
        // const { file } = files
        dynamicRoles: true
    }
    property var history_list: ListModel {
        dynamicRoles: true
    }
    property var trash_list: ListModel {
        dynamicRoles: true
    }

    Timer {
        id: set_timeout
        interval: 1000
        running: false
        repeat: false
    }

    function recoverFromDisk() {

    }

    function flushListToDisk() {

    }

    function deleteDownload(index, delete_file, callback) {
        pauseDownload(index, function() {
            let item = download_list.get(index)
            let save_path = Aria2Util.getTempSaveFolder(item.file_path, item.file_name)
            download_list.remove(index, 1)
            if (delete_file) {
                set_timeout.interval = 1000
                set_timeout.triggered.connect(function() {
                    DownloadM3u8.deleteTempFolder(save_path)
                    console.log("GlobalTaskList.DownloadM3u8.deleteTempFolder:", save_path)
                })
                set_timeout.start()
            }
            else {
                console.log("GlobalTaskList.deleteDownload:need move to trash")
            }
            flushListToDisk()
        })
    }

    function unpauseDownload(index, callback) {
        let download_item = download_list.get(index)
        let downloadFile = download_item.downloadFile
        let gid_list = []
        for (let i = 0; i < downloadFile.count; i++) {
            let item = downloadFile.get(i)
            if (item.status !== "complete") {
                gid_list.push(item.gid)
            }
        }
        Aria2Util.multiUnpause(gid_list, function(res) {
            download_list.set(index, {
                pause: false,
            })
            if (callback) {
                callback()
            }
            flushListToDisk()
        })
    }

    function pauseDownload(index, callback) {
        let download_item = download_list.get(index)
        let downloadFile = download_item.downloadFile
        let gid_list = []
        for (let i = 0; i < downloadFile.count; i++) {
            let item = downloadFile.get(i)
            if (item.status !== "complete") {
                gid_list.push(item.gid)
            }
        }
        Aria2Util.multiPause(gid_list, function(res) {
            download_list.set(index, {
                pause: true,
            })
            if (callback) {
                callback()
            }
            flushListToDisk()
        })
    }

    function refreshDownloadStatus(index) {
        var downloadSpeed = 0
        var uploadSpeed = 0
        var numActive = 0
        var numWaiting = 0
        var numStopped = 0

        let download_item = download_list.get(index)
        let downloadFile = download_item.downloadFile
        let gid_list = []
        let gid_map = {}
        for (let i = 0; i < downloadFile.count; i++) {
            let item = downloadFile.get(i)
            if (item.status !== "complete") {
                gid_list.push(item.gid)
                gid_map[item.gid] = i
            }
            else {
                numStopped += 1
            }
        }

        Aria2Util.multicallTellStatus(gid_list, function(res) {
            for (let j = 0; j < res.length; j++) {
                let item = res[j][0]
                let ts_index = gid_map[item.gid]
                download_item.downloadFile.set(ts_index, {
                    status: item.status,
                    totalLength: item.totalLength,
                    completedLength: item.completedLength,
                    uploadLength: item.uploadLength,
                    downloadSpeed: item.downloadSpeed,
                    uploadSpeed: item.uploadSpeed,
                })
                if (item.status === "active") {
                    downloadSpeed += parseInt(item.downloadSpeed)
                }
            }
            download_list.set(index, {
                downloadSpeed,
                uploadSpeed,
                numActive,
                numWaiting,
                numStopped,
                numTotal: downloadFile.count,
            })
            flushListToDisk()
        })
    }

    function addDownloadItem(item) {
        download_list.append(item)
        flushListToDisk()
    }
}
