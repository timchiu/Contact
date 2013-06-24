package com.fycd.contact

import grails.converters.JSON
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.apache.shiro.crypto.hash.Sha256Hash
import org.apache.shiro.subject.Subject
import org.apache.shiro.SecurityUtils


class ArchivedTaoMemberController {

	def authService
	// Export service provided by Export plugin
	def exportService
	
	static navigation = [
		group:'tabs',
		order:30,
		title:'歸檔',
		action:'list',
		isVisible: { (SecurityUtils.subject?.isAuthenticated() || SecurityUtils.subject?.isRemembered()) &&
			(SecurityUtils.subject?.hasRole(["admin"])) }
	]

	static genderList = ["Man", "Woman", "Boy", "Girl"]
	static educationLevels = ["Kindergarden", "Elementary", "Middle School", "High School", "Bachelors", "Masters", "PhD"]
	static grades = 0..17
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 20, 100)
		def results = authService.getArchivedUsers(params)
		println(results.toString())
		[taoMemberInstanceList: results[0], taoMemberInstanceTotal: results[1]]
	}

	
	def create = {
		def taoMemberInstance = new TaoMember()
		taoMemberInstance.properties = params
		return [taoMemberInstance: taoMemberInstance, genderList: genderList, grades: grades, educationLevels: educationLevels, languageList: getLanguages(), taoGroupNames: getTaoGroupNames()]
	}
	
	def getTaoGroupNames = {
		def documentation = message(code: "taoMember.taoGroup.documentation.name")
		def culinary = message(code: "taoMember.taoGroup.culinary.name")
		def multimedia = message(code: "taoMember.taoGroup.multimedia.name")
		def taoAffairs = message(code: "taoMember.taoGroup.taoaffairs.name")
		def service = message(code: "taoMember.taoGroup.service.name")
		def general = message(code: "taoMember.taoGroup.general.name")
		return [documentation, culinary, multimedia, taoAffairs, service, general]
	}

	def getLanguages = {
		def english = message(code: "taoMember.languages.english")
		def mandarin = message(code: "taoMember.languages.mandarin")
		def cantonese = message(code: "taoMember.languages.cantonese")
		def vietnamese = message(code: "taoMember.languages.vietnamese")
		return [mandarin, english, cantonese, vietnamese]
	}

	def save = {
		println params
		if (params.introducer_id) {
			params."introducer.id" = params.introducer_id
		}
		if (params.guarantor_id) {
			params."guarantor.id" = params.guarantor_id
		}
		if (params.transmittingMaster_id) {
			params."transmittingMaster.id" = params.transmittingMaster_id
		}
		if (params.contactPerson_id) {
			params."contactPerson.id" = params.contactPerson_id
		}
		
		def newParams = params.findAll { (it.key != "introducer" && it.key != "guarantor" && it.key != "transmittingMaster" && it.key != "contactPerson") }
		println newParams
		def taoMemberInstance = new TaoMember(newParams)
		
		// add to member status
		taoMemberInstance.addToRoles(Role.findByName("member"))
		
		// set password
		if (params.password) {
			taoMemberInstance.passwordHash = new Sha256Hash(params.password).toHex()
		}
		
		if (taoMemberInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'taoMember.label', default: 'TaoMember'), taoMemberInstance.id])}"
			redirect(action: "show", id: taoMemberInstance.id)
		}
		else {
			render(view: "create", model: [taoMemberInstance: taoMemberInstance, genderList: genderList, grades: grades, educationLevels: educationLevels, languageList: getLanguages(), taoGroupNames: getTaoGroupNames()])
		}
	}

	def show = {
		def taoMemberInstance = TaoMember.get(params.id)
		if (!taoMemberInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taoMember.label', default: 'TaoMember'), params.id])}"
			redirect(action: "list")
		}
		else {
			[taoMemberInstance: taoMemberInstance]
		}
	}

	def edit = {
		def taoMemberInstance = TaoMember.get(params.id)
		if (!taoMemberInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taoMember.label', default: 'TaoMember'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [taoMemberInstance: taoMemberInstance, genderList: genderList, grades: grades, educationLevels: educationLevels, languageList: getLanguages(), taoGroupNames: getTaoGroupNames()]
		}
	}

	def update = {
		def taoMemberInstance = TaoMember.get(params.id)
		if (taoMemberInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (taoMemberInstance.version > version) {
					
					taoMemberInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'taoMember.label', default: 'TaoMember')] as Object[], "Another user has updated this TaoMember while you were editing")
					render(view: "edit", model: [taoMemberInstance: taoMemberInstance])
					return
				}
			}
			
			println params
			if (params.introducer_id) {
				params."introducer.id" = params.introducer_id
			}
			if (params.guarantor_id) {
				params."guarantor.id" = params.guarantor_id
			}
			if (params.transmittingMaster_id) {
				params."transmittingMaster.id" = params.transmittingMaster_id
			}
			if (params.contactPerson_id) {
				params."contactPerson.id" = params.contactPerson_id
			}
			
			def newParams = params.findAll { (it.key != "introducer" && it.key != "guarantor" && it.key != "transmittingMaster" && it.key != "contactPerson") }
			println newParams
			taoMemberInstance.properties = newParams
			
			// set password
			Subject currentUser = SecurityUtils.getSubject()
			if (params["password"] && currentUser.hasRole("admin")) {
				taoMemberInstance.passwordHash = new Sha256Hash(params["password"]).toHex()
			}
			
			if (!taoMemberInstance.hasErrors() && taoMemberInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'taoMember.label', default: 'TaoMember'), taoMemberInstance.id])}"
				redirect(action: "show", id: taoMemberInstance.id)
			}
			else {
				render(view: "edit", model: [taoMemberInstance: taoMemberInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taoMember.label', default: 'TaoMember'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def taoMemberInstance = TaoMember.get(params.id)
		if (taoMemberInstance) {
			try {
				taoMemberInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'taoMember.label', default: 'TaoMember'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'taoMember.label', default: 'TaoMember'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taoMember.label', default: 'TaoMember'), params.id])}"
			redirect(action: "list")
		}
	}
	
	def autoCompleteTaoMember = {
		def q = params.query?.trim()
		def list = TaoMember.findAllByEnglishNameIlikeOrChineseNameIlike("%${q}%","%${q}%")
		def jsonList = list.collect { [ id: it.id, name: it.toString() ] }
		def jsonResult = [
			result: jsonList
		]
		render jsonResult as JSON
	}

	def autoCompleteTransmittingMaster = {
		def masterRole = Role.findByName("master")
		def masters= TaoMember.executeQuery('from TaoMember where :masterRole in elements(roles)', [masterRole: masterRole])
		def jsonList = masters.collect { [ id: it.id, name: it.toString() ] }
		def jsonResult = [
			result: jsonList
		]
		render jsonResult as JSON
	}

	def search = {
//		render TaoMember.search(params.q, params)
		println "searching for ${params.q}"
		def q = params.q
		if (q) {
			q = q.getBytes("UTF8");
			q = new String(q, "UTF8");
			println "q: " + q
		}
		params.max = Math.min(params.max ? params.int('max') : 20, 1000)
//		def searchResults = TaoMember.search(params.q, params)
		def searchResults = TaoMember.search(q, params)
		flash.message = "${searchResults.total} results found for search: ${params.q}"
//		flash.q = params.q
		flash.q = q
		return [searchResults:searchResults.results, resultCount:searchResults.total]
	  }

	
	
//	def authService
//	
//	static navigation = [
//		group:'tabs',
//		order:30,
//		title:'Archived',
//		action:'list',
//		isVisible: { (SecurityUtils.subject?.isAuthenticated() || SecurityUtils.subject?.isRemembered()) &&
//			(SecurityUtils.subject?.hasRole(["admin"])) }
//	]
//
//    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
//
//    def index = {
//        redirect(action: "list", params: params)
//    }
//
//    def list = {
//        params.max = Math.min(params.max ? params.int('max') : 20, 100)
//		def results = authService.getArchivedUsers()
//		println(results.count())
//		println(results.toString())
//		[taoMemberInstanceList: results, taoMemberInstanceTotal: results.count()]
//    }
//
//    def create = {
//        def templeInstance = new Temple()
//        templeInstance.properties = params
//        return [templeInstance: templeInstance]
//    }
//
//    def save = {
//        def templeInstance = new Temple(params)
//        if (templeInstance.save(flush: true)) {
//            flash.message = "${message(code: 'default.created.message', args: [message(code: 'temple.label', default: 'Temple'), templeInstance.id])}"
//            redirect(action: "show", id: templeInstance.id)
//        }
//        else {
//            render(view: "create", model: [templeInstance: templeInstance])
//        }
//    }
//
//    def show = {
//        def templeInstance = Temple.get(params.id)
//        if (!templeInstance) {
//            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'temple.label', default: 'Temple'), params.id])}"
//            redirect(action: "list")
//        }
//        else {
//            [templeInstance: templeInstance]
//        }
//    }
//
//    def edit = {
//        def templeInstance = Temple.get(params.id)
//        if (!templeInstance) {
//            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'temple.label', default: 'Temple'), params.id])}"
//            redirect(action: "list")
//        }
//        else {
//            return [templeInstance: templeInstance]
//        }
//    }
//
//    def update = {
//        def templeInstance = Temple.get(params.id)
//        if (templeInstance) {
//            if (params.version) {
//                def version = params.version.toLong()
//                if (templeInstance.version > version) {
//                    
//                    templeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'temple.label', default: 'Temple')] as Object[], "Another user has updated this Temple while you were editing")
//                    render(view: "edit", model: [templeInstance: templeInstance])
//                    return
//                }
//            }
//            templeInstance.properties = params
//            if (!templeInstance.hasErrors() && templeInstance.save(flush: true)) {
//                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'temple.label', default: 'Temple'), templeInstance.id])}"
//                redirect(action: "show", id: templeInstance.id)
//            }
//            else {
//                render(view: "edit", model: [templeInstance: templeInstance])
//            }
//        }
//        else {
//            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'temple.label', default: 'Temple'), params.id])}"
//            redirect(action: "list")
//        }
//    }
//
//    def delete = {
//        def templeInstance = Temple.get(params.id)
//        if (templeInstance) {
//            try {
//                templeInstance.delete(flush: true)
//                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'temple.label', default: 'Temple'), params.id])}"
//                redirect(action: "list")
//            }
//            catch (org.springframework.dao.DataIntegrityViolationException e) {
//                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'temple.label', default: 'Temple'), params.id])}"
//                redirect(action: "show", id: params.id)
//            }
//        }
//        else {
//            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'temple.label', default: 'Temple'), params.id])}"
//            redirect(action: "list")
//        }
//    }
}
