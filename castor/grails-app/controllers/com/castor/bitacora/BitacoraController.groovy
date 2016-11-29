package com.castor.bitacora
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

@Secured('ROLE_ADMIN,ROLE_ADMINISTRATIVO,ROLE_TECNICO,ROLE_GERENCIA')
@Transactional(readOnly = true)
class BitacoraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Bitacora.list(params), model:[bitacoraCount: Bitacora.count()]
    }

    def show(Bitacora bitacora) {
        respond bitacora
    }

    def create() {
        respond new Bitacora(params)
    }

    @Transactional
    def save(Bitacora bitacora) {
        if (bitacora == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (bitacora.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond bitacora.errors, view:'create'
            return
        }

        bitacora.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bitacora.label', default: 'Bitacora'), bitacora.id])
                redirect bitacora
            }
            '*' { respond bitacora, [status: CREATED] }
        }
    }

    def edit(Bitacora bitacora) {
        respond bitacora
    }

    @Transactional
    def update(Bitacora bitacora) {
        if (bitacora == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (bitacora.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond bitacora.errors, view:'edit'
            return
        }

        bitacora.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'bitacora.label', default: 'Bitacora'), bitacora.id])
                redirect bitacora
            }
            '*'{ respond bitacora, [status: OK] }
        }
    }

    @Transactional
    def delete(Bitacora bitacora) {

        if (bitacora == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        bitacora.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'bitacora.label', default: 'Bitacora'), bitacora.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bitacora.label', default: 'Bitacora'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
