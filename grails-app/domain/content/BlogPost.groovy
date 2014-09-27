package content

/**
 * Created by vishesh on 26-Sep-14.
 */
class BlogPost {
    String title;
    String htmlContent;

    static mapping = {
        htmlContent type:'text'
    }
}