package mysite
/**
 * Created by vishesh on 27-Sep-14.
 */
class Utils {

   static getUrlSlug(url) {
       //replace all non alpha numeric chars with hyphen
       def notAlphaNumericUnderscoreRegex = "[^a-zA-Z0-9_]"
       url = url.replaceAll(notAlphaNumericUnderscoreRegex, "-")
       return url
   }
}
