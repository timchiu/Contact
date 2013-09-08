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
	
}
