class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"                       (controller: "Home", action: "posts")
        "/blog/$action"           (controller: "Blog")
        "/post/$id/$slug"         (controller: "Blog", action: "show")
        "/tc"                     (controller: "Tc", action: "index")
        "/projects"               (controller: "Project", action: "projects")
        "/projects/all"           (controller: "Project", action: "allProjects")

        "/jitsi/login"            (controller: "Demo", action: "jitsiLogin")
        "/jitsi/logout"           (controller: "Demo", action: "jitsiLogout")
        "/jitsi/stats"            (controller: "Demo", action: "jitsiStats")
        "/api/jitsi/stats"        (controller: "Demo", action: "jitsiStatsAPI")

        "500"(view: '/error')
    }
}
