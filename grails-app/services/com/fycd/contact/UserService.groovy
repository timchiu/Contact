package com.fycd.contact

import org.apache.shiro.SecurityUtils

class UserService {

    static transactional = true

	String getCurrentActor() {
		String actor = "system"
		try {
			actor = SecurityUtils.subject?.principal?.toString()
		} catch (org.apache.shiro.UnavailableSecurityManagerException e) {
			// this is expected as Shiro's security manager may not have been setup initially when BootStrap.groovy is run.
		}
		return actor
    }
}
