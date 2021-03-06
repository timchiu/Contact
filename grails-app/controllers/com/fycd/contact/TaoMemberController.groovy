package com.fycd.contact

import grails.converters.JSON
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.apache.shiro.crypto.hash.Sha256Hash
import org.apache.shiro.subject.Subject
import org.apache.shiro.SecurityUtils

class TaoMemberController {

	def authService
	// Export service provided by Export plugin
	def exportService
	
	static navigation = [
		group:'tabs',
		order:1,
		title:"道親",
		action:'list',
		isVisible: { (SecurityUtils.subject?.isAuthenticated() || SecurityUtils.subject?.isRemembered()) &&
			(SecurityUtils.subject?.hasRole(["member"]) || SecurityUtils.subject?.hasRole(["groupLeader"]) ||
				SecurityUtils.subject?.hasRole(["regionLeader"]) || SecurityUtils.subject?.hasRole(["seniorLecturer"]) ||
				SecurityUtils.subject?.hasRole(["master"]) || (SecurityUtils.subject?.hasRole(["admin"])) ||
				SecurityUtils.subject?.hasRole(["academicLeader"])) }
	]

	static genderList = ["man", "woman", "boy", "girl"]
	static educationLevels = ["kg", "el", "jh", "hs", "bs", "ms", "dr"]
	static grades = 0..17
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		if(params?.format && params.format != "html"){
			response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
			response.setHeader("Content-disposition", "attachment; filename=books.${params.extension}")
			params.max = 10000
			def results = authService.getAvailableTaoMembers(SecurityUtils.subject, params)
			exportService.export(params.format, response.outputStream, results[0], [:], [:])
		} else {
			params.max = Math.min(params.max ? params.int('max') : 20, 1000)
			def results = authService.getAvailableTaoMembers(SecurityUtils.subject, params)
			[taoMemberInstanceList: results[0], taoMemberInstanceTotal: results[1]]
		}
    }

    def create = {
        def taoMemberInstance = new TaoMember()
        taoMemberInstance.properties = params
        return [taoMemberInstance: taoMemberInstance, genderList: genderList, grades: grades, educationLevels: educationLevels, 
			languageList: getLanguages(), taoGroupNames: getTaoGroupNames(), taoReceivingTimes: getTaoReceivingTimes()]
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

	def getTaoReceivingTimes = {
		def one = message(code: "taoMember.taoReceivingTime.one")
		def two = message(code: "taoMember.taoReceivingTime.two")
		def three = message(code: "taoMember.taoReceivingTime.three")
		def four = message(code: "taoMember.taoReceivingTime.four")
		def five = message(code: "taoMember.taoReceivingTime.five")
		def six = message(code: "taoMember.taoReceivingTime.six")
		def seven = message(code: "taoMember.taoReceivingTime.seven")
		def eight = message(code: "taoMember.taoReceivingTime.eight")
		def nine = message(code: "taoMember.taoReceivingTime.nine")
		def ten = message(code: "taoMember.taoReceivingTime.ten")
		def eleven = message(code: "taoMember.taoReceivingTime.eleven")
		def twelve = message(code: "taoMember.taoReceivingTime.twelve")
		return [one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve]
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
		} else {
			taoMemberInstance.passwordHash = "please change me"
		}
		
        if (taoMemberInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'taoMember.label', default: 'TaoMember'), taoMemberInstance.id])}"
            redirect(action: "show", id: taoMemberInstance.id)
        }
        else {
            render(view: "create", model: [taoMemberInstance: taoMemberInstance, genderList: genderList, grades: grades, 
				educationLevels: educationLevels, languageList: getLanguages(), taoGroupNames: getTaoGroupNames(), taoReceivingTimes: getTaoReceivingTimes()])
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
            return [taoMemberInstance: taoMemberInstance, genderList: genderList, grades: grades, educationLevels: educationLevels, 
				languageList: getLanguages(), taoGroupNames: getTaoGroupNames(), taoReceivingTimes: getTaoReceivingTimes()]
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
		def list = TaoMember.findAllByEnglishNameIlikeOrChineseNameIlike("${q}%","${q}%")
		def jsonList = list.collect { [ id: it.id, name: it.toString() ] }
		def jsonResult = [
			result: jsonList
		]
		render jsonResult as JSON
	}

	def autoCompleteTransmittingMaster = {
		def masterRole = Role.findByName("master") 
		def masters= TaoMember.executeQuery('from TaoMember where :masterRole in elements(roles)', [masterRole: masterRole], [max: 20])
		def jsonList = masters.collect { [ id: it.id, name: it.toString() ] }
		def jsonResult = [
			result: jsonList
		]
		render jsonResult as JSON
	}

	def search = {
		println "searching for ${params.q}"
		def q = params.q
		if (q) {
			q = q.getBytes("UTF8");
			q = new String(q, "UTF8");
			println "q: " + q
		}
		params.max = Math.min(params.max ? params.int('max') : 20, 1000)
		def searchResults = TaoMember.search(q, params)

		def subject = SecurityUtils.subject
		if (subject.hasRole("regionLeader") || subject.hasRole("master") || subject.hasRole("seniorLecturer") || subject.hasRole("admin")) {
			flash.message = "${searchResults.total} results found for search: ${params.q}"
			flash.q = q
			return [searchResults:searchResults.results, resultCount:searchResults.total]
		} else {
			def accessibleMembers = authService.getAvailableTaoMembers(subject, params)[0]
			def filteredSearchResults = []
			def results = searchResults.results
			for (result in results) {
				def memberId = result.id
				for (accessibleMember in accessibleMembers) {
					def accessibleMemberId = accessibleMember.id
					if (accessibleMemberId == memberId) {
						filteredSearchResults.add(result)
					}
				}
			}
			flash.message = "${filteredSearchResults.size()} results found for search: ${params.q}"
			flash.q = q
			return [searchResults: filteredSearchResults, resultCount: filteredSearchResults.size()]
		}
	}
	
}
