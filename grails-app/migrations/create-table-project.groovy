databaseChangeLog = {

    changeSet(author: "vishesh (generated)", id: "1411890791296-1") {
        createTable(tableName: "project") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "projectPK")
            }

            column(name: "version", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "text")

            column(name: "tc_challenge_id", type: "varchar(255)")

            column(name: "title", type: "varchar(255)") {
                constraints(nullable: "false")
            }

            column(name: "url", type: "varchar(255)")
        }
    }

    changeSet(author: "vishesh (generated)", id: "1411890791296-2") {
        createTable(tableName: "project_platforms") {
            column(name: "project_id", type: "int8")

            column(name: "platforms_string", type: "varchar(255)")
        }
    }

    changeSet(author: "vishesh (generated)", id: "1411890791296-3") {
        createTable(tableName: "project_technologies") {
            column(name: "project_id", type: "int8")

            column(name: "technologies_string", type: "varchar(255)")
        }
    }

    changeSet(author: "vishesh (generated)", id: "1411890791296-4") {
        addForeignKeyConstraint(baseColumnNames: "project_id", baseTableName: "project_platforms", constraintName: "FK_qcixpg60bvbergr2wqbm7wdl5", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "project", referencesUniqueColumn: "false")
    }

    changeSet(author: "vishesh (generated)", id: "1411890791296-5") {
        addForeignKeyConstraint(baseColumnNames: "project_id", baseTableName: "project_technologies", constraintName: "FK_pggkwj8n347e02svdrfx7tbod", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "project", referencesUniqueColumn: "false")
    }
}
