pragma Singleton

import QtQuick 2.0
import "../QSQL"
import "../../../common_js/Tools.js" as Tools

Item {
    function getRangeQueryByField(field_name, kwarg) {
        let persistence = QSQL.db
        let min_field_value = kwarg['min_' + field_name]
        let max_field_value = kwarg['max_' + field_name]
        let field_value = kwarg[field_name]
        if (!Tools.isNone(field_value)) {
            return new persistence.PropertyFilter(field_name, '=', field_value)
        }
        if (Tools.isNone(min_field_value) && Tools.isNone(max_field_value)) {
            return null
        }
        let query = null
        if (!Tools.isNone(min_field_value)) {
            query = new persistence.PropertyFilter(field_name, '>=', min_field_value)
        }
        if (!Tools.isNone(max_field_value)) {
            if (query) {
                query = new persistence.AndFilter(
                    query,
                    new persistence.PropertyFilter(field_name, '<=', max_field_value)
                )
            }
            else {
                query = new persistence.PropertyFilter(field_name, '<=', max_field_value)
            }
        }
        return query
    }
}
