package content

import grails.converters.JSON
import grails.util.Holders
import groovyx.net.http.RESTClient
import mysite.Utils

import static groovyx.net.http.ContentType.URLENC

class ProjectController {
    public static final String TC_API = "http://api.topcoder.com"
    public static final String TC_SITE = "http://www.topcoder.com"
    public final String TC_HANDLE = Holders.config.auth.tcHandle

    static scaffold = true

    def beforeInterceptor = [action: this.&auth, except: ['projects', 'allProjects']]

    def authService

    private auth() {
        if (!authService.authorizeScaffoldings(params.password) ) {
            response.status = 404
            return false
        }
    }

    def importFromTc() {
        def requestMethod = request.method
        def tcPassword = params.tcPassword
        Project.async.task {
            withTransaction {
                def projects
                if (requestMethod == "GET") {
                    def restClient = new RESTClient(TC_API)
                    try {
                        def authResponse = restClient.post(path: '/v2/auth',
                                body: [username: TC_HANDLE,
                                       password: tcPassword],
                                requestContentType: URLENC
                        )
                        def jwtToken = authResponse.data.token
                        log.info("importing tc projects. jwt $jwtToken")
                        restClient.headers."Authorization" = "Bearer $jwtToken"
                        def apiResponse = restClient.get(path: '/v2/user/challenges',
                                query: [type: 'PAST'])
                        projects = apiResponse.data.data
                    } catch (e) {
                        log.error(e)
                    }
                } else {
                    projects = request.JSON.data
                }
                projects.each {
                    def project = Project.findByTcChallengeId(it.challengeId)
                    if (!project) {
                        try {
                            if (it.status == "Completed") {
                                def resultClient = new RESTClient(TC_API)
                                def resultResponse = resultClient.get(path: "/v2/develop/challenges/result/$it.challengeId")
                                def results = resultResponse.data.results
                                //check if I won/submitted, if so create project in db
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
                                    project.projectOrder = 9999 // it will be replaced with appropriate value by trigger
                                    def length = challenge.detailedRequirements?.size()
                                    if (length && length > 310) {
                                        length = 310
                                    }
                                    project.description = challenge.detailedRequirements?.substring(0,length)
                                            .replaceAll("<(.|\n)*?>", '')+"<a target='_blank' href=$project.url>...View more</a>"
                                    project.save(flush: true, failOnError: true)
                                }
                            }
                        } catch (e) {
                            log.error "error importing project. title: $it.challengeName. id: $it.challengeId", e
                        }
                    }
                }
                log.info("Done importing")
            }
        }
        def resp = [started: true]
        render resp as JSON
    }

    def projects() {
        def projects
        def restrictAccess = false
        def filters = Holders.config.iprestictions
        if (filters) {
            restrictAccess = Utils.restrictAccess(request, filters)
        }
        if (restrictAccess) {
            projects = Project.findAllByPublishedAndAvailableToAll(true, true)
            log.info("acess restricted to project page")
        } else {
            projects = Project.findAllByPublished(true)
        }
        renderProjects(projects)
    }

    def allProjects() {
        def projects = Project.findAllByPublished(true)
        render(view: 'projects',
                model: renderProjects(projects))

    }

    private def renderProjects(projects) {
        projects.each {
            if (it.tcChallengeId) {
                it.title = "<a target='_blank' href='$it.url'>$it.title</a>"
            }
        }
        return [projects: projects.sort {-it.projectOrder}]
    }
}
