pragma Singleton

import QtQuick 2.0
import "../../../common_component/SQL/QSQL"

Item {
    property bool is_connect: false
    property var migrate_map: ({})

    function connect() {
        if (!is_connect) {
            QSQL.connect({
                 identifier: "QSQL",
                 version: "1.0",
                 description: "QSQL is a curd layer lib",
                 estimatedSize: 1000000,
            })
            is_connect = true
        }
    }

    function addColumnSQL(tableName, columnName, columnType) {
        return `ALTER TABLE ${tableName} ADD ${columnName} ${columnType}`
    }

    function addField(tx, table_name, add_list, callback) {
        let queries = []
        let i
        for (i = 0; i < add_list.length; i++) {
            let item = add_list[i]
            queries.push(addColumnSQL(table_name, item.name, item.type))
        }
//        console.log(queries)
        for (i = 0; i < queries.length; i++) {
            console.log(queries[i])
            tx.executeSql(queries[i])
        }
        if (callback) {
            callback()
        }
    }

    function deleteField(tx, table_name, new_table_field, callback) {
        let queries = []
        let new_columns_list = []
        let common_key_list = []
        for (let key in new_table_field) {
            new_columns_list.push(`${key} ${new_table_field[key]}`)
            common_key_list.push(key)
        }
//        console.log(JSON.stringify(new_columns_list))
//        console.log(JSON.stringify(common_key_list))
//		queries.push(`DROP TABLE ${table_name}_bkp;`)
        queries.push(`ALTER TABLE ${table_name} RENAME TO ${table_name}_bkp;`)
        queries.push(`CREATE TABLE IF NOT EXISTS ${table_name}(${new_columns_list.join(',')});`)
        // queries.unshift([`INSERT INTO ${table_name} SELECT ${common_key_list.join(', ')} FROM ${table_name}_bkp;`, null]);
        queries.push(`INSERT INTO ${table_name} SELECT ${common_key_list.join(', ')} FROM ${table_name}_bkp;`)
        queries.push(`DROP TABLE ${table_name}_bkp;`)
//        console.log(queries)

        try {
            tx.executeSql(`DROP TABLE ${table_name}_bkp;`)
        }
        catch (e) { }

        for (let i = 0; i < queries.length; i++) {
            console.log(queries[i])
            tx.executeSql(queries[i])
        }
        if (callback) {
            callback()
        }
    }

    function createTable(tx, table_name, table_field, callback) {
        let columns_list = []
        for (let key in table_field) {
            columns_list.push(key+' '+table_field[key])
        }
        console.log(`CREATE TABLE IF NOT EXISTS ${table_name}(${columns_list.join(',')})`)
        tx.executeSql(`CREATE TABLE IF NOT EXISTS ${table_name}(${columns_list.join(',')})`)
        if (callback) {
            callback()
        }
    }

    function compareTable(tx, table_name, old_table_field, new_table_field, callback) {
        let delete_list = []
        let add_list = []
        let common_table_field = {}
        let key
        for (key in old_table_field) {
            if (key !== 'id' && (!new_table_field[key] || old_table_field[key] !== new_table_field[key])) {
                delete_list.push({
                    name: key,
                    type: old_table_field[key],
                })
            }
            else {
                common_table_field[key] = old_table_field[key]
            }
        }
        for (key in new_table_field) {
            if (key !== 'id' && (!old_table_field[key] || old_table_field[key] !== new_table_field[key])) {
                add_list.push({
                    name: key,
                    type: new_table_field[key],
                })
            }
        }

        console.log(JSON.stringify({
            add_list,
            delete_list,
        }))

        if (add_list.length === 0 && delete_list.length === 0) {
            if (callback) {
                callback()
            }

            return
        }

        if (delete_list.length === 0) {
            addField(tx, table_name, add_list, function() {
                console.log('migrate success')
                if (callback) {
                    callback()
                }
            })
        }
        else {
            deleteField(tx, table_name, common_table_field, function() {
                if (add_list.length > 0) {
                    addField(tx, table_name, add_list, function() {
                        console.log('migrate success')
                        if (callback) {
                            callback()
                        }
                    })
                }
            })
        }
    }

    function migrateTable(table_name, the_table_field, callback) {
        if (migrate_map[table_name]) {
            console.log(`(TableFactory.qml)Already migrate: ${table_name}`)
            if (callback) {
                callback()
            }
            return
        }

        function the_callback() {
            migrate_map[table_name] = true
            if (callback) {
                callback()
            }
        }

        let table_field = Object.assign({
            id: 'VARCHAR(32)',
        }, the_table_field)
        let query_table_sql = `select sql from sqlite_master where type = "table" and name == "${table_name}"`
        QSQL.connection.transaction(function (tx) {
            let result = tx.executeSql(query_table_sql)
            if (result.rows.length === 0) {
                console.log(`(TableFactory.qml)First time create table: ${table_name}`)
                createTable(tx, table_name, table_field, the_callback)
                return
            }

            createTable(tx, table_name, table_field, function() {
                // 先获取旧的表结构
                let create_table_sql = result.rows[0].sql
                let field_columns = new RegExp("CREATE TABLE `*\\w+`*\\((.+)\\)").exec(create_table_sql)[1].split(',')
                let old_table_field = {}
                for (let i = 0; i < field_columns.length; i++) {
                    let item = new RegExp("`*(\\w+)`* (.+)").exec(field_columns[i])
                    let col_name = item[1]
                    let col_type = item[2]
                    old_table_field[col_name.replace(' ', '')] = col_type.replace(' ', '')
                }
//                old_table_field.id = 'VARCHAR(32)'

                compareTable(tx, table_name, old_table_field, table_field, the_callback)
            })
        })
    }
}
