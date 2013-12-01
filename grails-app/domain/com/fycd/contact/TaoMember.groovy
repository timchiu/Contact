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
	Date taoSeminarDate
	Boolean completedTaoSeminar
	String taoSeminarNotes
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
	Integer grade
	
	Address address
	Boolean archived
	
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
		taoSeminarNotes(maxSize: 512, nullable : true)
		archived(nullable : true)
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
		grade(nullable : true, blank: true, default: 0)
		taoSeminarDate(nullable: true)
    }
	
//	static belongsTo = [ contactGroup : ContactGroup, currentTemple : Temple, taoReceivingTemple : Temple, introducer : TaoMember, guarantor : TaoMember, transmittingMaster : TaoMember ]

	static belongsTo = [ contactGroup : ContactGroup, currentTemple : Temple, taoReceivingTemple : Temple]
	
	static mapping = {
		address lazy:false	// look at composition/embedding
		contactRecords lazy:false
	}
	
	String toString() {
//		if (chineseName != null && englishName != null) {
//			return chineseName + "(" + englishName + ")"
//		} else {
			return chineseName ?: englishName
//		}
	}
	
	String printName() {
		return chineseName ?: englishName
	}
	
	String toTsv() {
		String tab = "\t"
		return id + tab + printName() + tab + gender + tab + introducer?.printName() + tab + guarantor?.printName() +
		tab + contactPerson?.printName() + tab + contactPerson?.id + tab + contactGroup?.toString() + tab + contactGroup?.id + tab + combineLang() + tab + age +
		tab + email + tab + completedTaoSeminar + tab + notes?.replace("\n", " ")?.replace("\r\n", " ")?.replace("\r", " ")
	}

	String combineLang() {
		StringBuilder sb = new StringBuilder()
		for (String l : languages) {
				sb.append(l)
		}
		return sb.toString()
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
}

class Address {
	
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

}
	