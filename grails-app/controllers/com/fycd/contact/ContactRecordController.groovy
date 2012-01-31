package com.fycd.contact

import org.apache.shiro.SecurityUtils

class ContactRecordController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contactRecordInstanceList: ContactRecord.list(params), contactRecordInstanceTotal: ContactRecord.count()]
    }

    def create = {
        def contactRecordInstance = new ContactRecord()
        contactRecordInstance.properties = params
        return [contactRecordInstance: contactRecordInstance]
    }

    def save = {
        def contactRecordInstance = new ContactRecord(params)
        if (contactRecordInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'contactRecord.label', default: 'ContactRecord'), contactRecordInstance.id])}"
            redirect(action: "show", id: contactRecordInstance.id)
        }
        else {
            render(view: "create", model: [contactRecordInstance: contactRecordInstance])
        }
    }

	def saveFromForm = {
		if (params.taoMemberInstance.id && params.description) {
			TaoMember member = TaoMember.findById(params.taoMemberInstance.id)
			member.addToContactRecords(new ContactRecord(description: params.description, createdBy: SecurityUtils.subject?.principal?.toString()).save(failOnError: true))
			redirect(controller: "taoMember", action: "show", id: params.taoMemberInstance.id)

//			contactRecordInstance.description =  params.description
//			def createdBy = TaoMember.findByUsername(SecurityUtils.subject?.principal)
//			contactRecordInstance.createdBy = createdBy
//			log.info "Created by ${createdBy.username} with subject = ${SecurityUtils.subject?.principal}"
//			
//			if (contactRecordInstance.save(flush: true)) {
//				flash.message = "${message(code: 'default.created.message', args: [message(code: 'contactRecord.label', default: 'ContactRecord'), contactRecordInstance.id])}"
//				TaoMember createdFor = TaoMember.findById(params.taoMemberInstance.id)
//				createdFor.addToContactRecords(contactRecordInstance)
//	
//				redirect(controller: "taoMember", action: "show", id: params.taoMemberInstance.id)
//			}
		}
		else {
			def contactRecordInstance = new ContactRecord()
			render(view: "create", model: [contactRecordInstance: contactRecordInstance])
		}
	}
	
    def show = {
        def contactRecordInstance = ContactRecord.get(params.id)
        if (!contactRecordInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRecord.label', default: 'ContactRecord'), params.id])}"
            redirect(action: "list")
        }
        else {
            [contactRecordInstance: contactRecordInstance]
        }
    }

    def edit = {
        def contactRecordInstance = ContactRecord.get(params.id)
        if (!contactRecordInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRecord.label', default: 'ContactRecord'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [contactRecordInstance: contactRecordInstance]
        }
    }

    def update = {
        def contactRecordInstance = ContactRecord.get(params.id)
        if (contactRecordInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (contactRecordInstance.version > version) {
                    
                    contactRecordInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'contactRecord.label', default: 'ContactRecord')] as Object[], "Another user has updated this ContactRecord while you were editing")
                    render(view: "edit", model: [contactRecordInstance: contactRecordInstance])
                    return
                }
            }
            contactRecordInstance.properties = params
            if (!contactRecordInstance.hasErrors() && contactRecordInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'contactRecord.label', default: 'ContactRecord'), contactRecordInstance.id])}"
                redirect(action: "show", id: contactRecordInstance.id)
            }
            else {
                render(view: "edit", model: [contactRecordInstance: contactRecordInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRecord.label', default: 'ContactRecord'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def contactRecordInstance = ContactRecord.get(params.id)
        if (contactRecordInstance) {
            try {
                contactRecordInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'contactRecord.label', default: 'ContactRecord'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'contactRecord.label', default: 'ContactRecord'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRecord.label', default: 'ContactRecord'), params.id])}"
            redirect(action: "list")
        }
    }
}
