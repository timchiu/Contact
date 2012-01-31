package com.fycd.contact

import org.apache.shiro.SecurityUtils

class TaoCenterController {

	static navigation = [
		group:'tabs',
		order:20,
		title:'道務中心',
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
        [taoCenterInstanceList: TaoCenter.list(params), taoCenterInstanceTotal: TaoCenter.count()]
    }

    def create = {
        def taoCenterInstance = new TaoCenter()
        taoCenterInstance.properties = params
        return [taoCenterInstance: taoCenterInstance]
    }

    def save = {
        def taoCenterInstance = new TaoCenter(params)
        if (taoCenterInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'taoCenter.label', default: 'TaoCenter'), taoCenterInstance.id])}"
            redirect(action: "show", id: taoCenterInstance.id)
        }
        else {
            render(view: "create", model: [taoCenterInstance: taoCenterInstance])
        }
    }

    def show = {
        def taoCenterInstance = TaoCenter.get(params.id)
        if (!taoCenterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taoCenter.label', default: 'TaoCenter'), params.id])}"
            redirect(action: "list")
        }
        else {
            [taoCenterInstance: taoCenterInstance]
        }
    }

    def edit = {
        def taoCenterInstance = TaoCenter.get(params.id)
        if (!taoCenterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taoCenter.label', default: 'TaoCenter'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [taoCenterInstance: taoCenterInstance]
        }
    }

    def update = {
        def taoCenterInstance = TaoCenter.get(params.id)
        if (taoCenterInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (taoCenterInstance.version > version) {
                    
                    taoCenterInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'taoCenter.label', default: 'TaoCenter')] as Object[], "Another user has updated this TaoCenter while you were editing")
                    render(view: "edit", model: [taoCenterInstance: taoCenterInstance])
                    return
                }
            }
            taoCenterInstance.properties = params
            if (!taoCenterInstance.hasErrors() && taoCenterInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'taoCenter.label', default: 'TaoCenter'), taoCenterInstance.id])}"
                redirect(action: "show", id: taoCenterInstance.id)
            }
            else {
                render(view: "edit", model: [taoCenterInstance: taoCenterInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taoCenter.label', default: 'TaoCenter'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def taoCenterInstance = TaoCenter.get(params.id)
        if (taoCenterInstance) {
            try {
                taoCenterInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'taoCenter.label', default: 'TaoCenter'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'taoCenter.label', default: 'TaoCenter'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taoCenter.label', default: 'TaoCenter'), params.id])}"
            redirect(action: "list")
        }
    }
}
