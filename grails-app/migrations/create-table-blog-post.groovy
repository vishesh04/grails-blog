databaseChangeLog = {

	changeSet(author: "vishesh (generated)", id: "1411738203404-1") {
		createTable(tableName: "blog_post") {
			column(name: "id", type: "int8") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "blog_postPK")
			}

			column(name: "version", type: "int8") {
				constraints(nullable: "false")
			}

			column(name: "html_content", type: "text") {
				constraints(nullable: "false")
			}

			column(name: "title", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "vishesh (generated)", id: "1411738203404-2") {
		createSequence(sequenceName: "hibernate_sequence")
	}
}
