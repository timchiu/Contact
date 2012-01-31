package com.fycd.contact

import org.apache.shiro.SecurityUtils

class TaoRegionController {

	static navigation = [
		group:'tabs',
		order:10,
		title:'區',
		action:'list',
		isVisible: { (SecurityUtils.subject?.isAuthenticated() || SecurityUtils.subject?.isRemembered()) &&
			(SecurityUtils.subject?.hasRole(["regionLeader"]) || SecurityUtils.subject?.hasRole(["seniorLecturer"]) ||
				SecurityUtils.subject?.hasRole(["master"]) || (SecurityUtils.subject?.hasRole(["admin"]))) }

	]

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        [taoRegionInstanceList: TaoRegion.list(params), taoRegionInstanceTotal: TaoRegion.count()]
    }

    def create = {
        def taoRegionInstance = new TaoRegion()
        taoRegionInstance.properties = params
        return [taoRegionInstance: taoRegionInstance]
    }

    def save = {
		if (params.primaryLeader_id) {
			params."primaryLeader.id" = params.primaryLeader_id
		}
		if (params.backupLeader_id) {
			params."backupLeader.id" = params.backupLeader_id
		}

		def newParams = params.findAll {(it.key != "primaryLeader" && it.key != "backupLeader")}
		
        def taoRegionInstance = new TaoRegion(newParams)
        if (taoRegionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'taoRegion.label', default: 'TaoRegion'), taoRegionInstance.id])}"
            redirect(action: "show", id: taoRegionInstance.id)
        }
        else {
            render(view: "create", model: [taoRegionInstance: taoRegionInstance])
        }
    }

    def show = {
        def taoRegionInstance = TaoRegion.get(params.id)
        if (!taoRegionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taoRegion.label', default: 'TaoRegion'), params.id])}"
            redirect(action: "list")
        }
        else {
            [taoRegionInstance: taoRegionInstance]
        }
    }

    def edit = {
        def taoRegionInstance = TaoRegion.get(params.id)
        if (!taoRegionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taoRegion.label', default: 'TaoRegion'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [taoRegionInstance: taoRegionInstance]
        }
    }

    def update = {
        def taoRegionInstance = TaoRegion.get(params.id)
        if (taoRegionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (taoRegionInstance.version > version) {
                    
                    taoRegionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'taoRegion.label', default: 'TaoRegion')] as Object[], "Another user has updated this TaoRegion while you were editing")
                    render(view: "edit", model: [taoRegionInstance: taoRegionInstance])
                    return
                }
            }
			
			if (params.primaryLeader_id) {
				params."primaryLeader.id" = params.primaryLeader_id
			}
			if (params.backupLeader_id) {
				params."backupLeader.id" = params.backupLeader_id
			}
			
			def newParams = params.findAll { (it.key != "primaryLeader" && it.key != "backupLeader") }
			println newParams
			
            taoRegionInstance.properties = newParams
            if (!taoRegionInstance.hasErrors() && taoRegionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'taoRegion.label', default: 'TaoRegion'), taoRegionInstance.id])}"
                redirect(action: "show", id: taoRegionInstance.id)
            }
            else {
                render(view: "edit", model: [taoRegionInstance: taoRegionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taoRegion.label', default: 'TaoRegion'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def taoRegionInstance = TaoRegion.get(params.id)
        if (taoRegionInstance) {
            try {
                taoRegionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'taoRegion.label', default: 'TaoRegion'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'taoRegion.label', default: 'TaoRegion'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'taoRegion.label', default: 'TaoRegion'), params.id])}"
            redirect(action: "list")
        }
    }
}
