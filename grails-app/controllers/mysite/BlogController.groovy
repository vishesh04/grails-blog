package mysite

import content.BlogPost

class BlogController {

    def show() {
        def id = params.id
        def blogPost = BlogPost.get(id)
        [blogPost: blogPost]
    }

    def editor() { }

    def save() {
        def blogPost = new BlogPost()
        blogPost.title = params.title
        blogPost.htmlContent = params.htmlContent
        blogPost.save(flush: true)
        render(view: 'editor', model: [blogPost: blogPost])
    }
}
