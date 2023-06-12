var IMAGE_PROVIDER_NAME = 'image_provider'

function pathJoin(path1, path2) {
    if (path1[path1.length-1] == '/') {
        path1 = path1.substring(0, path1.length-1)
    }
    return `${path1}/${path2}`
}

function getImagePathById(image_id) {
    if (isNone(image_id)) {
        return ''
    }

    return `image://${IMAGE_PROVIDER_NAME}/${image_id}`
}

function isNone(value) {
    if (value === undefined)
        return true
    if (value === null)
        return true
    if (typeof(value) == "number" && isNaN(value))
        return true
    return false
}

function prefixZero(num, length) {
    return ('' + num).length < length ? ((new Array(length + 1)).join('0') + num).slice(-length) : '' + num;
}

function getTimeStamp() {
    let timestamp = Date.parse(new Date())
    return parseInt(timestamp/1000)
}

function getTimeStampByDate(date) {
    return parseInt(new Date(date).getTime()/1000)
}

function getTimeByDate(date, format="%y.%M.%d %h:%mm.%s") {
    // console.log(date)
    format = format.replace("%MM", Tools.prefixZero(date.getMonth()+1, 2))
    format = format.replace("%dd", Tools.prefixZero(date.getDate(), 2))
    format = format.replace("%hh", Tools.prefixZero(date.getHours(), 2))
    format = format.replace("%mm", Tools.prefixZero(date.getMinutes(), 2))
    format = format.replace("%ss", Tools.prefixZero(date.getSeconds(), 2))

    format = format.replace("%y", date.getFullYear())
    format = format.replace("%M", date.getMonth()+1)
    format = format.replace("%d", date.getDate())
    format = format.replace("%h", date.getHours())
    format = format.replace("%m", date.getMinutes())
    format = format.replace("%s", date.getSeconds())
    return format
}

function getDateByStamp(time_stamp) {
    return new Date(time_stamp*1000)
}

function getTimeByStamp(timestamp, format="%y.%M.%d %h:%mm.%s") {
    let date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
    format = format.replace("%MM", Tools.prefixZero(date.getMonth()+1, 2))
    format = format.replace("%dd", Tools.prefixZero(date.getDate(), 2))
    format = format.replace("%hh", Tools.prefixZero(date.getHours(), 2))
    format = format.replace("%mm", Tools.prefixZero(date.getMinutes(), 2))
    format = format.replace("%ss", Tools.prefixZero(date.getSeconds(), 2))

    format = format.replace("%y", date.getFullYear())
    format = format.replace("%M", date.getMonth()+1)
    format = format.replace("%d", date.getDate())
    format = format.replace("%h", date.getHours())
    format = format.replace("%m", date.getMinutes())
    format = format.replace("%s", date.getSeconds())
    return format
}

function getSecondTimeByStamp(timestamp, format="%hh:%mm:%ss") {
    let seconds = timestamp%60
    let minutes = (timestamp-seconds)/60
    let hours = (minutes-minutes%60)/60
    minutes = minutes%60
    format = format.replace("%hh", Tools.prefixZero(hours, 2))
    format = format.replace("%mm", Tools.prefixZero(minutes, 2))
    format = format.replace("%ss", Tools.prefixZero(seconds, 2))

    format = format.replace("%h", hours)
    format = format.replace("%m", minutes)
    format = format.replace("%s", seconds)
    return format
}
