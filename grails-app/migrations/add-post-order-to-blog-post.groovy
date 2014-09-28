databaseChangeLog = {

	changeSet(author: "vishesh (generated)", id: "1411884458996-1") {
		addColumn(tableName: "blog_post") {
			column(defaultValue: "0", name: "post_order", type: "int4") {
				constraints(nullable: "false")
			}
		}
	}
}
