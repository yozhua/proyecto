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


@Transactional(readOnly = true)
class BitacoraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Bitacora.list(params), model:[bitacoraCount: Bitacora.count()]
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def show(Bitacora bitacora) {
        respond bitacora
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def create() {
        respond new Bitacora(params)
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def busqueda() {
        render view: '/bitacora/find'
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
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

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
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

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
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

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
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
