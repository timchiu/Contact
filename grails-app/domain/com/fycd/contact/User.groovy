package com.fycd.contact

import grails.converters.JSON

class User {
	def userService
	
    String username
    String passwordHash
    Date dateCreated
	Date lastUpdated
    static hasMany = [ roles: Role, permissions: String ]

    static constraints = {
        username(nullable: true, blank: false, size:3..20, unique: true)
//		password(size: 6..15,
//			validator: { passwordHash, user ->
//				return passwordHash != user.username
//			})
	}
	
	static mapping = {
		roles lazy:false	// look at composition/embedding
		permissions lazy:false
	}
	
//	def afterUpdate() {
//		def json = this as JSON
//		EventLogItem.withNewSession {
//			new EventLogItem(actor:userService.currentActor, actionType:ActionType.UPDATE.value,
//					actionDetails: json.toString(), className: this.class.name, persistedObjectId : this.id,
//					persistedObjectVersion: this.version).save(flush:true, failOnError: true)
//		}
//	}
//
//	def afterInsert() {
//		def json = this as JSON
//		EventLogItem.withNewSession {
//			new EventLogItem(actor:userService.currentActor, actionType:ActionType.CREATE.value,
//					actionDetails: json.toString(), className: this.class.name, persistedObjectId : this.id,
//					persistedObjectVersion: this.version).save(flush:true, failOnError: true)
//		}
//	}
}
