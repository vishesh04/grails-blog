class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"         (controller: "Blog", action: "index")
        "/tc"       (controller: "Tc", action: "index")

        "500"(view: '/error')
    }
}
