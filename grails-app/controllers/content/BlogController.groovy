package content

import content.BlogPost

class BlogController {

    static scaffold = BlogPost

    def beforeInterceptor = [action: this.&auth, except: ['show', 'about']]

    def authService

    private auth() {
        if (!authService.authorizeScaffoldings(params.password) ) {
            response.status = 404
            return false
        }
    }

    def show() {
        def id = params.id
        def blogPost = BlogPost.get(id)
        [blogPost: blogPost]
    }

    def editor() {
        if(params.id) {
          [blogPost: BlogPost.get(params.id)]
        }
    }

    def save() {
        def blogPost
        if (params.id) {
           blogPost = BlogPost.get(params.id)
        } else {
            blogPost = new BlogPost()
        }
        blogPost.title = params.title
        blogPost.htmlContent = params.htmlContent
        blogPost.save(flush: true)
        redirect(action: 'editor', params: [id: blogPost.id])
    }

    def about() {}
}
