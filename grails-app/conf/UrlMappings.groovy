class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"                       (controller: "Home", action: "posts")
        "/blog/$id/$slug"         (controller: "Blog", action: "show")
        "/tc"                     (controller: "Tc", action: "index")

        "500"(view: '/error')
    }
}
