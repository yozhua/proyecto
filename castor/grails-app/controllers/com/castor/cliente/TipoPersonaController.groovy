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
class TipoPersonaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoPersona.list(params), model:[tipoPersonaCount: TipoPersona.count()]
    }

    def show(TipoPersona tipoPersona) {
        respond tipoPersona
    }

    def create() {
        respond new TipoPersona(params)
    }

    @Transactional
    def save(TipoPersona tipoPersona) {
        if (tipoPersona == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoPersona.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoPersona.errors, view:'create'
            return
        }

        tipoPersona.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoPersona.label', default: 'TipoPersona'), tipoPersona.id])
                redirect tipoPersona
            }
            '*' { respond tipoPersona, [status: CREATED] }
        }
    }

    def edit(TipoPersona tipoPersona) {
        respond tipoPersona
    }

    @Transactional
    def update(TipoPersona tipoPersona) {
        if (tipoPersona == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoPersona.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoPersona.errors, view:'edit'
            return
        }

        tipoPersona.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoPersona.label', default: 'TipoPersona'), tipoPersona.id])
                redirect tipoPersona
            }
            '*'{ respond tipoPersona, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoPersona tipoPersona) {

        if (tipoPersona == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        tipoPersona.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoPersona.label', default: 'TipoPersona'), tipoPersona.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoPersona.label', default: 'TipoPersona'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
