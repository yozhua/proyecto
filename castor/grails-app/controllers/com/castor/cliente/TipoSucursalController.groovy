package com.castor.cliente

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.security.access.annotation.Secured
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.AuthenticationTrustResolver
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.WebAttributes

import javax.servlet.http.HttpServletResponse

@Transactional(readOnly = true)
class TipoSucursalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoSucursal.list(params), model:[tipoSucursalCount: TipoSucursal.count()]
    }

    def show(TipoSucursal tipoSucursal) {
        respond tipoSucursal
    }

    def create() {
        respond new TipoSucursal(params)
    }

    @Transactional
    def save(TipoSucursal tipoSucursal) {
        if (tipoSucursal == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoSucursal.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoSucursal.errors, view:'create'
            return
        }

        tipoSucursal.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoSucursal.label', default: 'TipoSucursal'), tipoSucursal.id])
                redirect tipoSucursal
            }
            '*' { respond tipoSucursal, [status: CREATED] }
        }
    }

    def edit(TipoSucursal tipoSucursal) {
        respond tipoSucursal
    }

    @Transactional
    def update(TipoSucursal tipoSucursal) {
        if (tipoSucursal == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoSucursal.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoSucursal.errors, view:'edit'
            return
        }

        tipoSucursal.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoSucursal.label', default: 'TipoSucursal'), tipoSucursal.id])
                redirect tipoSucursal
            }
            '*'{ respond tipoSucursal, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoSucursal tipoSucursal) {

        if (tipoSucursal == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        tipoSucursal.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoSucursal.label', default: 'TipoSucursal'), tipoSucursal.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoSucursal.label', default: 'TipoSucursal'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
