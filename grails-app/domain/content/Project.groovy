package content

class Project {

    String title
    String url
    String tcChallengeId
    String description
    boolean published = true
    boolean availableToAll = false
    Integer projectOrder

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
        availableToAll defaultValue: false
        projectOrder defaultValue:'0'
    }

    def beforeInsert() {
        def maxProjectOrder = Project.createCriteria().get {
            projections {
                max "projectOrder"
            }
        } as Integer
        this.projectOrder = maxProjectOrder + 1
    }
}
