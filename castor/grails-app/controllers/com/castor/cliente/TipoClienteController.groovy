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
class TipoClienteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoCliente.list(params), model:[tipoClienteCount: TipoCliente.count()]
    }

    def show(TipoCliente tipoCliente) {
        respond tipoCliente
    }

    def create() {
        respond new TipoCliente(params)
    }

    @Transactional
    def save(TipoCliente tipoCliente) {
        if (tipoCliente == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoCliente.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoCliente.errors, view:'create'
            return
        }

        tipoCliente.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoCliente.label', default: 'TipoCliente'), tipoCliente.id])
                redirect tipoCliente
            }
            '*' { respond tipoCliente, [status: CREATED] }
        }
    }

    def edit(TipoCliente tipoCliente) {
        respond tipoCliente
    }

    @Transactional
    def update(TipoCliente tipoCliente) {
        if (tipoCliente == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoCliente.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoCliente.errors, view:'edit'
            return
        }

        tipoCliente.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoCliente.label', default: 'TipoCliente'), tipoCliente.id])
                redirect tipoCliente
            }
            '*'{ respond tipoCliente, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoCliente tipoCliente) {

        if (tipoCliente == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        tipoCliente.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoCliente.label', default: 'TipoCliente'), tipoCliente.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoCliente.label', default: 'TipoCliente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
