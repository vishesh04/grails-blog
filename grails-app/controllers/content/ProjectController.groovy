package content

import grails.converters.JSON
import groovyx.net.http.RESTClient
import mysite.Utils

class ProjectController {
    public static final String TC_API = "http://api.topcoder.com"
    public static final String TC_SITE = "http://www.topcoder.com"
    public static final String TC_HANDLE = "Ninja91"

    static scaffold = true

    def importFromTc() {
        def resp = [:]
        def projects
        if (request.method == "GET") {
            def restClient = new RESTClient(TC_API)
            try {
                restClient.headers."Authorization" = "Bearer $params.jwtToken"
                def apiResponse = restClient.get(path: '/v2/user/challenges',
                        query: [type: 'PAST'])
                projects = apiResponse.data.data
                resp.success = true
            } catch (e) {
                resp.success = false
                resp.message = "Please try with manual json"
            }
        } else {
            projects = request.JSON.data
            resp.success = true
        }
        projects.each {
            def project = Project.findByTcChallengeId(it.challengeId)
            if (!project) {
                try {
                    //check if I won/submitted, if so create project in db
                    if (it.status == "Completed") {
                        def resultClient = new RESTClient(TC_API)
                        def resultResponse = resultClient.get(path: "/v2/develop/challenges/result/$it.challengeId")
                        def results = resultResponse.data.results
                        if (results.handle.contains(TC_HANDLE)) {
                            log.info("creating project with title: $it.challengeName")
                            // get the challenge detail
                            def challengeClient = new RESTClient(TC_API)
                            def challengeResponse = challengeClient.get(path: "/v2/challenges/$it.challengeId")
                            def challenge = challengeResponse.data
                            project = new Project()
                            project.title = it.challengeName
                            project.platforms = it.platforms
                            project.technologies = it.technologies
                            project.tcChallengeId = it.challengeId
                            project.url = "$TC_SITE/challenge-details/$it.challengeId"
                            def length = challenge.detailedRequirements?.size()
                            if (length && length > 310) {
                                length = 310
                            }
                            project.description = challenge.detailedRequirements?.substring(0,length).replaceAll("<(.|\n)*?>", '')+"<a target='_blank' href=$project.url>...View more</a>"
                            project.save(flush: true)
                        }
                    }
                } catch (e) {
                    log.error "error importing project. title: $it.challengeName. id: $it.challengeId"
                }
            }
        }
        log.info("Done importing")
        resp.projets = Project.findAll()
        render resp as JSON
    }

    def projects() {
        def projects = Project.findAll()
        projects.each {
            if (it.tcChallengeId) {
                it.title = "<a target='_blank' href='$it.url'>$it.title</a>"
            }
        }
        [projects: projects]
    }
}