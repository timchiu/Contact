package com.fycd.contact

import grails.test.*

class AgeTestTests extends GroovyTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testSomething() {
		def member = TaoMember.get(2);
		println(member.birthDate);

    }
}
