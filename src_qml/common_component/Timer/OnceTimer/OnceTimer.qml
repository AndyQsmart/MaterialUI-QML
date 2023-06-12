import QtQuick 2.13
import "../../../common_js/Tools.js" as Tools

Timer {
    id: timer
    interval: 0
    repeat: false
    running: false
    triggeredOnStart: false

    property var task_list: ([])
    property var next_trigger_time: -1

    function setTimeout(func, mtimes) {
        let current_time = Date.parse(new Date())
        let trigger_time = current_time+mtimes
        task_list.push({
            func,
            trigger_time,
        })
        if (timer.running) {
            if (trigger_time < next_trigger_time) {
                next_trigger_time = trigger_time
                timer.interval = mtimes
                timer.restart()
            }
        }
        else {
            next_trigger_time = trigger_time
            timer.interval = mtimes
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
                the_task.func()
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
