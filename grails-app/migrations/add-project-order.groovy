databaseChangeLog = {

    changeSet(author: "vishesh (generated)", id: "1418932640864-1") {
        addColumn(tableName: "project") {
            column(defaultValue: "false", name: "available_to_all", type: "boolean") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "vishesh (generated)", id: "1418932640864-2") {
        addColumn(tableName: "project") {
            column(defaultValue: "0", name: "project_order", type: "int4") {
                constraints(nullable: "false")
            }
        }
    }
}
