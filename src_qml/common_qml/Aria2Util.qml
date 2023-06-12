pragma Singleton

import QtQuick 2.15

Item {
    function exeFunc(name, arg, callback) {
        let post_arg = {
            jsonrpc:'2.0',
            id:'qt',
            method: name,
            params: arg,
        }
        if (arg && arg.length > 0) {
            post_arg.params = arg
        }
        // console.log("Aria2Util:exeFunc", JSON.stringify(post_arg))
        QHttp.postJSON("http://localhost:6800/jsonrpc", post_arg, callback)
    }

    function multiExeFunc(args, callback) {
        let request_args = []
        for (let i = 0; i < args.length; i++) {
            let item = args[i]
            request_args.push({
                methodName: item.name,
                params: item.arg,
            })
        }

        exeFunc("system.multicall", [request_args], callback)
    }

    function init() {
        DownloadM3u8.initAria2()
    }

    function shutdown(callback) {
        exeFunc("aria2.shutdown", [], callback)
    }

    function forceShutdown(callback) {
        exeFunc("aria2.forceShutdown", [], callback)
    }

    function getGlobalOption(callback) {
        exeFunc("aria2.getGlobalOption", [], callback)
    }

    function getGlobalStat(callback) {
        exeFunc("aria2.getGlobalStat", [], function(res) {
            console.log(res)
            let data = JSON.parse(res)
            const { result } = data
            if (callback) {
                callback(result)
            }
        })
    }

    function tellStatus(gid, callback) {
        exeFunc("aria2.tellStatus", [gid], function(res) {
            // console.log(res)
            let data = JSON.parse(res)
            const { result } = data
            if (callback) {
                callback(result)
            }
        })
    }

    function multicallTellStatus(gid_list, callback) {
        let args = []
        for (let i = 0; i < gid_list.length; i++) {
            args.push({
                name: 'aria2.tellStatus',
                arg: [gid_list[i]],
            })
        }

        multiExeFunc(args, function(res) {
            // console.log(res)
            let data = JSON.parse(res)
            const { result } = data
            if (callback) {
                callback(result)
            }
        })
    }

    function tellActive(callback) {
        exeFunc("aria2.tellActive", [], function(res) {
            // console.log(res)
            let data = JSON.parse(res)
            const { result } = data
            if (callback) {
                callback(result)
            }
        })
    }

    function multiUnpause(gid_list, callback) {
        let args = []
        for (let i = 0; i < gid_list.length; i++) {
            args.push({
                name: 'aria2.unpause',
                arg: [gid_list[i]],
            })
        }

        multiExeFunc(args, function(res) {
            // console.log(res)
            let data = JSON.parse(res)
            const { result } = data
            if (callback) {
                callback(result)
            }
        })
    }

    function multiPause(gid_list, callback) {
        let args = []
        for (let i = 0; i < gid_list.length; i++) {
            args.push({
                name: 'aria2.pause',
                arg: [gid_list[i]],
            })
        }

        multiExeFunc(args, function(res) {
            // console.log(res)
            let data = JSON.parse(res)
            const { result } = data
            if (callback) {
                callback(result)
            }
        })
    }

    function getTempSaveFolder(file_path, file_name) {
        let save_folder = file_path[file_path.length-1] === "/" ? `${file_path}${file_name}_ts` : `${file_path}/${file_name}_ts`;
        return save_folder
    }

    function downloadUri(file_path, file_name, file_urls, callback) {
        let gid_list = []
        let rest = file_urls.length
        let save_folder = getTempSaveFolder(file_path, file_name)

        let args = []
        for (let i = 0; i < file_urls.length; i++) {
            let uri = file_urls[i]
            args.push({
                name: 'aria2.addUri',
                arg: [
                    [uri],
                    {
                        dir: save_folder,
                        out: `${i+1}.ts`,
                    }
                ],
            })
        }

        multiExeFunc(args, function(res) {
            let data = JSON.parse(res)
            const { result } = data
            let downloadFile = []
            for (let j = 0; j < result.length; j++) {
                downloadFile.push({
                    gid: result[j][0],
                    uri: file_urls[j],
                    out: `${j+1}.ts`,
                    status: "waiting",
                })
            }
            if (callback) {
                // console.log(JSON.stringify(gid_list))
                callback(downloadFile)
            }
        })
    }
}
