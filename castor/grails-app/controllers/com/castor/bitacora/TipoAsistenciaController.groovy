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
class TipoAsistenciaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    
    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])   
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoAsistencia.list(params), model:[tipoAsistenciaCount: TipoAsistencia.count()]
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def show(TipoAsistencia tipoAsistencia) {
        respond tipoAsistencia
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def create() {
        respond new TipoAsistencia(params)
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    @Transactional
    def save(TipoAsistencia tipoAsistencia) {
        if (tipoAsistencia == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoAsistencia.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoAsistencia.errors, view:'create'
            return
        }

        tipoAsistencia.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoAsistencia.label', default: 'TipoAsistencia'), tipoAsistencia.id])
                redirect tipoAsistencia
            }
            '*' { respond tipoAsistencia, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def edit(TipoAsistencia tipoAsistencia) {
        respond tipoAsistencia
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    @Transactional
    def update(TipoAsistencia tipoAsistencia) {
        if (tipoAsistencia == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (tipoAsistencia.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond tipoAsistencia.errors, view:'edit'
            return
        }

        tipoAsistencia.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoAsistencia.label', default: 'TipoAsistencia'), tipoAsistencia.id])
                redirect tipoAsistencia
            }
            '*'{ respond tipoAsistencia, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    @Transactional
    def delete(TipoAsistencia tipoAsistencia) {

        if (tipoAsistencia == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        tipoAsistencia.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoAsistencia.label', default: 'TipoAsistencia'), tipoAsistencia.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
    
    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoAsistencia.label', default: 'TipoAsistencia'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
