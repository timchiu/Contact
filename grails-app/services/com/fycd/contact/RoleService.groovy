package com.fycd.contact

class RoleService {

    static transactional = true

    def createIfNotExist(name, properties) {
		def role = Role.findByName(name)
		if (!role) {
			return new Role(properties).save(failOnError: true)
		} else {
			return role
		}
    }
}
