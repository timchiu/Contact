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

}
