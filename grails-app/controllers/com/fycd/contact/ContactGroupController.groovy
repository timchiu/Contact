package com.fycd.contact

import org.apache.shiro.SecurityUtils

class ContactGroupController {

	static navigation = [
		group:'tabs',
		order:5,
		title:"聯絡小組",
		action:'list',
		isVisible: { (SecurityUtils.subject?.isAuthenticated() || SecurityUtils.subject?.isRemembered()) && 
					(SecurityUtils.subject?.hasRole(["groupLeader"]) ||
						SecurityUtils.subject?.hasRole(["regionLeader"]) || SecurityUtils.subject?.hasRole(["seniorLecturer"]) ||
						SecurityUtils.subject?.hasRole(["master"]) || SecurityUtils.subject?.hasRole(["admin"])) }
	]
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contactGroupInstanceList: ContactGroup.list(params), contactGroupInstanceTotal: ContactGroup.count()]
    }

    def create = {
        def contactGroupInstance = new ContactGroup()
        contactGroupInstance.properties = params
        return [contactGroupInstance: contactGroupInstance]
    }

    def save = {
		println params
		if (params.leader_id) {
			params."leader.id" = params.leader_id
		}
		def newParams = params.findAll { (it.key != "leader") }
		println newParams
		
        def contactGroupInstance = new ContactGroup(newParams)
        if (contactGroupInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'contactGroup.label', default: 'ContactGroup'), contactGroupInstance.id])}"
            redirect(action: "show", id: contactGroupInstance.id)
        }
        else {
            render(view: "create", model: [contactGroupInstance: contactGroupInstance])
        }
    }

    def show = {
        def contactGroupInstance = ContactGroup.get(params.id)
        if (!contactGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactGroup.label', default: 'ContactGroup'), params.id])}"
            redirect(action: "list")
        }
        else {
            [contactGroupInstance: contactGroupInstance]
        }
    }

    def edit = {
        def contactGroupInstance = ContactGroup.get(params.id)
        if (!contactGroupInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactGroup.label', default: 'ContactGroup'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [contactGroupInstance: contactGroupInstance]
        }
    }

    def update = {
        def contactGroupInstance = ContactGroup.get(params.id)
        if (contactGroupInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (contactGroupInstance.version > version) {
                    
                    contactGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'contactGroup.label', default: 'ContactGroup')] as Object[], "Another user has updated this ContactGroup while you were editing")
                    render(view: "edit", model: [contactGroupInstance: contactGroupInstance])
                    return
                }
            }
			
			println params
			if (params.leader_id) {
				params."leader.id" = params.leader_id
			}
			def newParams = params.findAll { (it.key != "leader") }
			println newParams
			
            contactGroupInstance.properties = newParams
            if (!contactGroupInstance.hasErrors() && contactGroupInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'contactGroup.label', default: 'ContactGroup'), contactGroupInstance.id])}"
                redirect(action: "show", id: contactGroupInstance.id)
            }
            else {
                render(view: "edit", model: [contactGroupInstance: contactGroupInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactGroup.label', default: 'ContactGroup'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def contactGroupInstance = ContactGroup.get(params.id)
        if (contactGroupInstance) {
            try {
                contactGroupInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'contactGroup.label', default: 'ContactGroup'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'contactGroup.label', default: 'ContactGroup'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactGroup.label', default: 'ContactGroup'), params.id])}"
            redirect(action: "list")
        }
    }
}
