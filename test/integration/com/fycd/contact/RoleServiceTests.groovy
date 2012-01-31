package com.fycd.contact

import grails.test.*

class RoleServiceTests extends GroovyTestCase {
	
	def roleService 
	
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {
		Role admin = roleService.createIfNotExist("admin", [name: "master", permissions: ["taomember:*:*", "contactgroup:*:*", "taoregion:*:*", "contactrecord:saveFromForm:*"]])
    }
}
