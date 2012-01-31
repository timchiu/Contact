package com.fycd.contact

class EventLogItem {
	
		String actor
		int level // designate different events with different priorities. e.g. customer facing can be higher level
		boolean external	// bit to determine if this should be customer visible
	
		String actionType	// e.g. notification, account creation, password reset, delivery project creation
		String actionDetails	// e.g. email notification sent to yyy@zzz.com, abc@cgi.com created
		String comments
		Date dateCreated
	
		String className
		String persistedObjectId
		Long persistedObjectVersion = 0
	
		static constraints = {
			actor(blank : false)
			actionType(blank : false)
			comments(nullable : true)
			className(nullable : true)
			persistedObjectId(nullable : true)
			persistedObjectVersion(nullable : true)
			actionDetails(maxSize:4096, nullable: true)
		}
	
		// default sort order
		static mapping = { sort "lastUpdated":"desc" }
	
		String toString() {
			return actor + " did " + actionType + "on $className:$persistedObjectId:$persistedObjectVersion on " + dateCreated;
		}
	
	}
	