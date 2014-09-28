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

        "500"(view: '/error')
    }
}
