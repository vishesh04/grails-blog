package mysite

import groovyx.net.http.RESTClient

import static groovyx.net.http.ContentType.URLENC

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

    static def getIpAddress(def request) {
        def ipAddress = request.getHeader("Client-IP")
        if (!ipAddress)
            ipAddress = request.getHeader("X-Forwarded-For")
        if (!ipAddress)
            ipAddress = request.remoteAddr
        return ipAddress
    }

    static def getIpInfo(request) {
        def apiUrl = "http://ipinfo.io"
        String ipAdress = getIpAddress(request)
        def restClient = new RESTClient(apiUrl)
        def resp = restClient.get(
                path: "/$ipAdress/json",
                requestContentType: URLENC)
        return resp.data
    }

    static boolean restrictAccess(request, restrictions) {
        try {
            def ipInfo = getIpInfo(request)
            for (def restriction: restrictions) {
                def restricted = true
                for (e in restriction) {
                    def requestVal = ipInfo."${e.key}"
                    if (requestVal) {
                        if (e.value.startsWith("contains-")) {
                            if (!requestVal.contains(e.value.substring(9))){
                                restricted = false
                                break
                            }
                        } else {
                            //exact match
                            if (requestVal != e.value){
                                restricted = false
                                break
                            }
                        }
                    } else {
                        //no value for a key in given filter. don't restrict access due to this filter
                        restricted = false
                    }
                }
                if (restricted) {
                    return true
                }
            }
            return false
        } catch (e) {
            return false
        }
    }
}
