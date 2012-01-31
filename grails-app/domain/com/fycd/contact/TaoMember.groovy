package com.fycd.contact

import grails.converters.JSON

class TaoMember extends User implements Comparable {
	def userService
	
	static searchable = true
	
	String chineseName
	String englishName
	String email
	String gender
	String phoneNumber
	String cellphone
	String notes
	String occupation
	String educationLevel
	Date birthDate
	Date vegetarianDate
	Date taoReceivingDate
	String taoReceivingLunarDate
	String taoReceivingTime
	String meritFee
	Boolean completedTaoSeminar
	TaoMember introducer
	TaoMember guarantor
	TaoMember transmittingMaster
	TaoMember contactPerson
	Temple taoReceivingTemple
	Temple currentTemple
	ContactGroup contactGroup
	String taoGroup
	List contactRecords
	Integer excelId
	Integer age
	
	Address address
	
	static embedded = ['address']
	static hasMany = [ contactRecords : ContactRecord, languages : String, taoGroup : String]
    static constraints = {
		chineseName(nullable : true)
		englishName(nullable : true)
		gender(nullable : true)
		phoneNumber(nullable : true)
		cellphone(nullable : true)
		address(nullable : true)
		email(nullable : true, email : true)
		contactPerson(nullable : true)
		contactGroup(nullable : true)
		birthDate(nullable : true)
		notes(maxSize: 512, nullable : true)
		currentTemple(nullable : true)
		taoReceivingTemple(nullable : true)
		vegetarianDate(nullable : true)
		taoReceivingDate(nullable : true)
		completedTaoSeminar(nullable : true)
		introducer(nullable : true)
		guarantor(nullable : true)
		transmittingMaster(nullable : true)
		educationLevel(nullable : true)
		occupation(nullable : true)
		meritFee(nullable : true)
		taoReceivingLunarDate(nullable : true)
		excelId(nullable : true)
		taoReceivingTime(nullable : true)
		taoGroup(nullable : true)
		age(nullable : true)
    }
	
//	static belongsTo = [ contactGroup : ContactGroup, currentTemple : Temple, taoReceivingTemple : Temple, introducer : TaoMember, guarantor : TaoMember, transmittingMaster : TaoMember ]

	static belongsTo = [ contactGroup : ContactGroup, currentTemple : Temple, taoReceivingTemple : Temple]
	
	static mapping = {
		address lazy:false	// look at composition/embedding
		contactRecords lazy:false
	}
	
	String toString() {
		if (chineseName != null && englishName != null) {
			return chineseName + "(" + englishName + ")"
		} else {
			return chineseName ?: englishName
		}
	}
	
	int compareTo(o) {
		int cname = this.chineseName <=> o?.chineseName
		if (cname == 0) {
			int ename = this.englishName <=> o?.englishName
			if (ename == 0) {
				return this.email <=> o?.email
			} else {
				return ename
			}
		} else {
			return cname
		}
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

class Address {
//	def userService
	
	String region
	String street1
	String street2
	String city
	String stateOrProvince
	String zipCode
	String country
	
	static belongsTo = TaoMember
	
	static constraints = {
		region(nullable : true)
		street1(nullable : true)
		street2(nullable : true)
		city(nullable : true)
		stateOrProvince(nullable : true)
		zipCode(nullable : true)
		country(nullable : true)
	}
	
	String toString() {
		return (street1 ?: "") + " " + (street2 ?: "") + " "+ (city ?: "") + " " + (stateOrProvince ?: "")+ " " + (zipCode ?: "")
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
	