import QtQuick 2.13
import "../../../common_js/Tools.js" as Tools

Timer {
    id: timer
    interval: 0
    repeat: false
    running: false
    triggeredOnStart: false

    property var current_task_id: 0
    property var task_map: ({})
    property var task_list: ([])
    property var next_trigger_time: -1

    function exeOnceAtTime(func, mtimes) {
        task_map[current_task_id] = {
            func,
            mtimes,
        }
        current_task_id++
        return current_task_id-1
    }

    function exe(task_id) {
        let task_info = task_map[task_id]

        if (!task_info) {
            return
        }

        let current_time = Date.parse(new Date())
        let trigger_time = current_time+task_info.mtimes

        let in_list = false
        for (let i = 0; i < task_list.length; i++) {
            let task_in = task_list[i]
            if (task_in.task_id === task_id) {
                task_in.trigger_time = trigger_time
                in_list = true
                break
            }
        }
        if (!in_list) {
            task_list.push({
                task_id,
                trigger_time,
            })
        }
        if (timer.running) {
            if (trigger_time < next_trigger_time) {
                next_trigger_time = trigger_time
                timer.interval = task_info.mtimes
                timer.restart()
            }
        }
        else {
            next_trigger_time = trigger_time
            timer.interval = task_info.mtimes
            timer.start()
        }
    }

    onTriggered: {
        let current_time = Date.parse(new Date())
        let new_task_list = []
        let new_trigger_time = -1
        for (let i = 0; i < task_list.length; i++) {
            let the_task = task_list[i]
            if (the_task.trigger_time <= current_time) {
                let task_info = task_map[the_task.task_id]
                task_info.func()
            }
            else {
                new_task_list.push(the_task)
                if (new_trigger_time === -1 || new_trigger_time > the_task.trigger_time) {
                    new_trigger_time = the_task.trigger_time
                }
            }
        }
        if (new_task_list.length > 0) {
            timer.task_list = new_task_list
            timer.next_trigger_time = new_trigger_time
            timer.interval = parseInt(new_trigger_time-current_time)
            timer.restart()
        }
    }
}
