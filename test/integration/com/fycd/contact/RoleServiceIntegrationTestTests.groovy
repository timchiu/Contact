package com.fycd.contact

import grails.test.*
import com.fycd.contact.RoleService

class RoleServiceIntegrationTestTests extends GroovyTestCase {
	
	def roleService
	
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {
		if (roleService == null) {
			println "null service"
		} else {
			Role admin = roleService.createIfNotExist("admin", [name: "master", permissions: ["taomember:*:*", "contactgroup:*:*", "taoregion:*:*", "contactrecord:saveFromForm:*"]])
			assert admin.name == "admin"
		}
    }
}
