package com.fycd.contact

import org.apache.shiro.SecurityUtils

class TempleController {

	static navigation = [
		group:'tabs',
		order:25,
		title:'佛堂',
		action:'list',
		isVisible: { (SecurityUtils.subject?.isAuthenticated() || SecurityUtils.subject?.isRemembered()) &&
			(SecurityUtils.subject?.hasRole(["admin"])) }
	]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        [templeInstanceList: Temple.list(params), templeInstanceTotal: Temple.count()]
    }

    def create = {
        def templeInstance = new Temple()
        templeInstance.properties = params
        return [templeInstance: templeInstance]
    }

    def save = {
        def templeInstance = new Temple(params)
        if (templeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'temple.label', default: 'Temple'), templeInstance.id])}"
            redirect(action: "show", id: templeInstance.id)
        }
        else {
            render(view: "create", model: [templeInstance: templeInstance])
        }
    }

    def show = {
        def templeInstance = Temple.get(params.id)
        if (!templeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'temple.label', default: 'Temple'), params.id])}"
            redirect(action: "list")
        }
        else {
            [templeInstance: templeInstance]
        }
    }

    def edit = {
        def templeInstance = Temple.get(params.id)
        if (!templeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'temple.label', default: 'Temple'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [templeInstance: templeInstance]
        }
    }

    def update = {
        def templeInstance = Temple.get(params.id)
        if (templeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (templeInstance.version > version) {
                    
                    templeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'temple.label', default: 'Temple')] as Object[], "Another user has updated this Temple while you were editing")
                    render(view: "edit", model: [templeInstance: templeInstance])
                    return
                }
            }
            templeInstance.properties = params
            if (!templeInstance.hasErrors() && templeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'temple.label', default: 'Temple'), templeInstance.id])}"
                redirect(action: "show", id: templeInstance.id)
            }
            else {
                render(view: "edit", model: [templeInstance: templeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'temple.label', default: 'Temple'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def templeInstance = Temple.get(params.id)
        if (templeInstance) {
            try {
                templeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'temple.label', default: 'Temple'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'temple.label', default: 'Temple'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'temple.label', default: 'Temple'), params.id])}"
            redirect(action: "list")
        }
    }
}
