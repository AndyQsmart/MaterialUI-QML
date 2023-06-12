pragma Singleton

import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "./persistence.js" as Persistence
import "./persistence.store.sql.js" as PersistenceStoreSql

QtObject {
    id: qsql
    property var connection: null
    property var db: {
        var the_db = Persistence.createPersistence()

        the_db.transaction = function (callback) {
            if (!connection) {
                throw new Error("No ongoing database connection, please connect first.")
            } else {
                connection.transaction(callback)
            }
        }

        the_db.store = the_db.store || {}
        the_db.store.sql = {
            defaultTypeMapper: PersistenceStoreSql.defaultTypeMapper,
            config: PersistenceStoreSql.config,
        };

        var sqliteDialect = {
            // columns is an array of arrays, e.g.
            // [["id", "VARCHAR(32)", "PRIMARY KEY"], ["name", "TEXT"]]
            createTable: function (tableName, columns) {
                var tm = the_db.typeMapper;
                var sql = "CREATE TABLE IF NOT EXISTS `" + tableName + "` (";
                var defs = [];
                for (var i = 0; i < columns.length; i++) {
                    var column = columns[i];
                    defs.push("`" + column[0] + "` " + tm.columnType(column[1]) + (column[2] ? " " + column[2] : ""));
                }
                sql += defs.join(", ");
                sql += ')';
                return sql;
            },

            // columns is array of column names, e.g.
            // ["id"]
            createIndex: function (tableName, columns, options) {
                options = options || {};
                return "CREATE " + (options.unique ? "UNIQUE " : "") + "INDEX IF NOT EXISTS `" + tableName + "__" + columns.join("_") +
                    "` ON `" + tableName + "` (" +
                    columns.map(function (col) { return "`" + col + "`"; }).join(", ") + ")";
            }
        }

        the_db.store.sql.config(the_db, sqliteDialect)
        the_db.save = the_db.flush

        return the_db
    }

    function connect(arg) {
        const { identifier, version, description, estimatedSize } = arg
        console.log('(QSQL.qml)Connect datebase', JSON.stringify(arg))
        qsql.connection = LocalStorage.openDatabaseSync(
            identifier,
            version,
            description,
            estimatedSize,
            function (db) {

            }
        )
        if (qsql.connection.version === '') {
            // FIX:  Error: SQL: database version mismatch
            qsql.connection.changeVersion('', version);
        }
    }
}
