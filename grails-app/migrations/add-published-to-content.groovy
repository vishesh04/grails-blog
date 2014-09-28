databaseChangeLog = {

	changeSet(author: "vishesh (generated)", id: "1411903418961-1") {
		addColumn(tableName: "blog_post") {
			column(defaultValue: "true", name: "published", type: "boolean") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "vishesh (generated)", id: "1411903418961-2") {
		addColumn(tableName: "project") {
			column(defaultValue: "true", name: "published", type: "boolean") {
				constraints(nullable: "false")
			}
		}
	}
}
