package mysite

import grails.converters.JSON
import groovyx.net.http.RESTClient

class TcController {

    def index() {}

    def explore() {
        def explorer = new RESTClient('https://api.topcoder.com')
        try {
            def resp = explorer.get(path: '/v2/challenges/active',
                    query: [type: 'develop'])
            def json = resp.data
            def customResp = []
            json.data.each {
                if (it.status != "Active") {
                    return
                }

                if (it.registrationOpen == "No ") {
                    return
                }

                if (it.challengeType == 'First2Finish' && it.numSubmissions >= 1) {
                    return
                }

                if (it.challengeType == 'First2Finish' && it.challengeName.startsWith("Hercules")) {
                    return
                }

                if (it.challengeType == 'Code') {
                    it.challengeType = "1. $it.challengeType"
                }

                //it.submissionEndDate = Date.parse(it.submissionEndDate).format('MMM dd, yyyy')
                customResp << it
            }
            //render resp.data as JSON
            customResp.sort { it.challengeType }
            render customResp as JSON
        } catch (e) {
            response.status = 500
            render e
        }
    }
}
