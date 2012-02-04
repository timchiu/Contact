package com.fycd.contact

import com.fycd.contact.TaoMember

class AuthService {

    static transactional = true

//    boolean hasAnyRoles(List<String> roles) {
//		def subject = SecurityUtils.subject
//		if (!(subject?.isAuthenticated() || subject?.isRemembered())) {
//			return false
//		} else {
//			boolean[] flags = subject.principal.hasRoles(roles)
//			flags.each {
//				if (it) {
//					return true
//				}  
//			}
//			return false
//		} 
//    }
//	
//	boolean displayContactGroupMenu() {
//		return hasAnyRoles(["admin"])
//	}
	
	def getAvailableTaoMembers(subject, params) {
//		def entries = new LinkedHashSet<TaoMember>()

		def ids = new HashSet<Long>()
		if (subject.hasRole("admin")) {
			def results = TaoMember.list(params);
			return [results, TaoMember.count()]
		} else if (subject.hasRole("master") || (subject.hasRole("seniorLecturer"))) { // add seniorlecturer roles as leaders of taocenter
			ids.addAll(getTransmittingMasterResults(subject.principal))
			ids.addAll(getRegionLeaderResults(subject.principal))
			ids.addAll(getGroupLeaderResults(subject.principal))
			ids.addAll(findUnder21Results(subject.principal))
			ids.addAll(getMemberResults(subject.principal))
		} else if (subject.hasRole("regionLeader")) {
			ids.addAll(getRegionLeaderResults(subject.principal))
			ids.addAll(getGroupLeaderResults(subject.principal))
			ids.addAll(findUnder21Results(subject.principal))
			ids.addAll(getMemberResults(subject.principal))
		} else if (subject.hasRole("groupLeader")) {
			ids.addAll(getGroupLeaderResults(subject.principal))
			ids.addAll(findUnder21Results(subject.principal))
			ids.addAll(getMemberResults(subject.principal))
		} else if (subject.hasRole("academicLeader")) {
			ids.addAll(findUnder21Results(subject.principal))
			ids.addAll(getMemberResults(subject.principal))
		} else if (subject.hasRole("member")) {
			ids.addAll(getMemberResults(subject.principal))
		}
		def results = TaoMember.findAllByIdInList(new ArrayList(ids), params)
		return [results, ids.size()]
	}
	
//	def getMemberResults (TaoMember user, params) {
//		def results = TaoMember.createCriteria().list (max : params.max ? params.int('max') : 10, 
//														offset: params.offset ? params.offset : 0){
//			or {
//				eq('introducer', user)
//				eq('guarantor', user)
//				eq('contactPerson', user)
//			}
//
//			if (params.sort == "contactRecords.dateCreated") {
//				contactRecords {
//					order("dateCreated", params.order ? params.order : "desc")
//				}
//			} else if (params.sort == "contactRecords.createdBy") {
//				contactRecords {
//					order("createdBy", params.order ? params.order : "desc")
//				}
//			} else {
//				order(params.sort ? params.sort : "id", params.order ? params.order : "desc")
//			}
//		}
//		return results
//	}

	def getMemberResults (TaoMember user) {
		def results = TaoMember.executeQuery("select distinct m.id from TaoMember m where m.introducer = :user or m.guarantor = :user or m.contactPerson = :user",
								[user: user])
		return results
	}
		
	
	def getTransmittingMasterResults (TaoMember user) {
		def results = new HashSet()
		def centers = TaoCenter.executeQuery('from TaoCenter where :leader in elements(leaders)', [leader: user])
		centers.each {
			it.regions.each {  
				it.groups.each {
					results.addAll(it.members*.id)
				}
			}  
		}
		return results
	}
		
	def getRegionLeaderResults (TaoMember user) {
		def results = new HashSet()
		def regions = TaoRegion.findAllByPrimaryLeaderOrBackupLeader(user, user)
		regions.each {
			it.groups.each {
				results.addAll(it.members*.id)
			} 
		}
		return results
	}
	
	def getGroupLeaderResults (TaoMember user) {
		def results = new HashSet()
		def groups = ContactGroup.findAllByLeader(user)
		groups.each {
			results.addAll(it.members*.id) 
		}
		return results
	}

	def findUnder21Results (TaoMember user) {
		def results = TaoMember.executeQuery("select distinct m.id from TaoMember m where m.age != null and m.age <= 21")
		return results
	}

	
}

