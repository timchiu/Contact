package com.fycd.contact

import grails.converters.JSON

class TaoRegion {
	def userService
	
	static searchable = true
	
	String name
	TaoMember primaryLeader
	TaoMember backupLeader
	
	static hasMany = [ groups : ContactGroup ]
	
    static constraints = {
		name()
		primaryLeader(nullable: true, blank: false)
		backupLeader(nullable: true, blank: false)
    }
	
	static belongsTo = TaoCenter
	
	String toString() {
		return name
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
