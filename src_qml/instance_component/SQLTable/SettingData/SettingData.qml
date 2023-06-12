pragma Singleton

import QtQuick 2.0
import "../TableBase"
import "../../../common_js/Tools.js" as Tools

TableBase {
    table_name: 'SettingData'
    table_field: ({
        name: 'TEXT',
        value: 'TEXT',
    })

    function getValue(name, callback) {
        let query = getTable().all().filter('name', '=', name)
        query.list(null, (data)=>{
            if (data.length === 0) {
                callback(null)
            }
            else {
                try {
                    callback(JSON.parse(data[0].value))
                }
                catch (e) {
                    callback(null)
                }
            }
        })
    }

    function setValue(name, value) {
        let query = getTable().all().filter('name', '=', name)
        query.list(null, (data)=>{
            if (data.length === 0) {
                create({
                    name,
                    value: JSON.stringify(value),
                })
            }
            else {
                let the_data = data[0]
                the_data.value = JSON.stringify(value)
                save()
            }
        })
    }
}
