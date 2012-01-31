package com.fycd.contact

import grails.converters.JSON
import java.text.SimpleDateFormat

class ContactRecord {
	def userService
	
	Date dateCreated
	Date lastUpdated
	String createdBy
	String description
	
//	static belongsTo = [createdBy : TaoMember]
	
	static constraints = {
		dateCreated()
		createdBy(blank: false)
		description(maxSize:1500)
	}
	
	static mapping = {
		sort dateCreated:"desc"
	}
	
	String toString() {
		return "${createdBy} wrote: " + description
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
