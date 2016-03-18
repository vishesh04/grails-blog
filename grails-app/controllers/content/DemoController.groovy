package content

import grails.converters.JSON
import groovyx.net.http.RESTClient

import static groovyx.net.http.ContentType.URLENC

class DemoController {

    private static final String JITSI_PASSWORD = 'j1ts1'

    def jitsiLogin() {
        if (request.method == 'GET') {
            if (session.jitsiLoggedIn == true) {
                redirect(uri: '/jitsi/stats')
            }
        } else if(request.method == 'POST') {
            if (params.password == JITSI_PASSWORD) {
                session.jitsiLoggedIn = true
                session.refreshInterval = params.refreshInterval
                redirect(uri: '/jitsi/stats')
            } else {
                flash.message = "Invalid password"
                redirect(uri: '/jitsi/login')
            }
        } else {
            response.status = 405
        }
    }

    def jitsiStats() {
        if (session.jitsiLoggedIn == true) {
            [refreshInterval: session.refreshInterval]
        } else {
            redirect(uri: '/jitsi/login')
        }
    }

    def jitsiLogout() {
        session.jitsiLoggedIn = false
        redirect(uri: '/jitsi/login')
    }

    def jitsiStatsAPI() {
        RESTClient restClient = new RESTClient('http://jellrtc.com:8080')
        def resp = restClient.get(path: '/colibri/stats', requestContentType: URLENC)
        render resp.data as JSON
    }
}
