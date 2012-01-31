package com.fycd.contact

import grails.converters.JSON

class ContactGroup {
	def userService
	
	static searchable = true
	
	String name
	TaoMember leader
	
	static hasMany = [ members : TaoMember ]
	
    static constraints = {
		name()
		leader(blank: false, nullable: true)
    }
	
	static belongsTo = [ taoRegion : TaoRegion ]
	
	String toString() {
		return name + (leader ? "(${leader})" : "") 
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
