pragma Singleton

import QtQuick 2.15

Item {
    function postJSON(url, arg, callback) {
        let xhr = new XMLHttpRequest()
        xhr.open("POST", url)
        xhr.setRequestHeader("Content-Type", "application/json")
        xhr.onreadystatechange = function() {
            // console.log("xhr.onreadystatechange")
            if (xhr.readyState == 4) {
                if (callback) {
                    callback(xhr.responseText)
                }
            }
        }
        xhr.send(JSON.stringify(arg))
    }
}
