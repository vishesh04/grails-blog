package mysite

import content.BlogPost

class HomeController {

    def posts() {
        //list first 5 posts' snippet, with pagination for other posts
        def posts = BlogPost.findAll()
        posts.each {
            def postLink = "/post/$it.id/${Utils.getUrlSlug(it.title)}"
            it.title = "<a href='$postLink'>$it.title</a>"
            it.htmlContent = it.htmlContent.substring(0,310)+"<a href=$postLink>...Continue reading</a>"
        }
        [posts: posts]
    }
}
