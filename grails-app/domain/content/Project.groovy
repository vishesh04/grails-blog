package content

class Project {

    String title
    String url
    String tcChallengeId
    String description
    boolean published = true

    static hasMany = [
            technologies: String,
            platforms: String
    ]

    static constraints = {
        title()
        tcChallengeId()
        url()
        description display: false
        url nullable: true
        tcChallengeId nullable: true
        description nullable: true
    }

    static mapping = {
        description type: 'text'
        published defaultValue: true
    }
}
