dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    dialect = org.hibernate.dialect.PostgreSQL9Dialect

    //uri = new URI("postgres://eltropy:swhad0o9@localhost:5432/eltropydb")
    uri = new URI(System.env.DATABASE_URL)
    url = "jdbc:postgresql://" + uri.host + ":" + uri.port + uri.path

    username = uri.userInfo.split(":")[0]
    password = uri.userInfo.split(":")[1]

    dbCreate = "" // one of 'create', 'create-drop', 'update', 'validate', ''
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    production {
        dataSource {
            properties {
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
                maxActive = -1
                minEvictableIdleTimeMillis=1800000
                timeBetweenEvictionRunsMillis=1800000
                numTestsPerEvictionRun=3
                testOnBorrow=true
                testWhileIdle=true
                testOnReturn=true
                validationQuery="SELECT 1"
            }
        }
    }
}
