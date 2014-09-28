package content

/**
 * Created by vishesh on 26-Sep-14.
 */
class BlogPost {
    String title;
    String htmlContent
    Integer postOrder
    boolean published = true

    static mapping = {
        htmlContent type:'text'
        postOrder defaultValue:'0'
        published defaultValue: true
    }

    String toString() {
        return title
    }

    static constraints = {
        title()
        postOrder()
        htmlContent display: false
    }
}