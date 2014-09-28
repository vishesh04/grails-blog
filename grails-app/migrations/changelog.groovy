databaseChangeLog = {

	include file: 'create-table-blog-post.groovy'

	include file: 'add-post-order-to-blog-post.groovy'

	include file: 'create-table-project.groovy'

	include file: 'add-published-to-content.groovy'
}
