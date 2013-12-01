dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
	logSql=false
	
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
//            url = "jdbc:hsqldb:mem:devDB"
			driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost/fycd_contact?useUnicode=yes&characterEncoding=UTF-8"
			username = "fillIn"
			password = "fillIn"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
//            url = "jdbc:hsqldb:mem:testDb"
			dbCreate = "update" // one of 'create', 'create-drop','update'
			driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost/fycd_contact?useUnicode=yes&characterEncoding=UTF-8"
			username = "fillIn"
			password = "fillIn"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
//            url = "jdbc:hsqldb:file:prodDb;shutdown=true"
			driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost/fycd_contact?useUnicode=yes&characterEncoding=UTF-8"
			username = "zhande"
			password = "hengde"
        }
    }
}
