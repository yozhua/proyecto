package com.castor.encargado

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
class EncargadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def getAllEncargado(){
        def encargados = Encargado.list()
        render encargados as JSON
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def getAllQuienAutoriza(){
        def encargados = Encargado.findAllWhere(autorizacion: true)                     
        render encargados as JSON
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def busqueda() {
        render view: '/encargado/find'
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Encargado.list(params), model:[encargadoCount: Encargado.count()]
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def show(Encargado encargado) {
        respond encargado
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def create() {
        respond new Encargado(params)
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    @Transactional
    def save(Encargado encargado) {
        if (encargado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (encargado.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond encargado.errors, view:'create'
            return
        }

        encargado.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'encargado.label', default: 'Encargado'), encargado.id])
                redirect encargado
            }
            '*' { respond encargado, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def edit(Encargado encargado) {
        respond encargado
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    @Transactional
    def update(Encargado encargado) {
        if (encargado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (encargado.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond encargado.errors, view:'edit'
            return
        }

        encargado.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'encargado.label', default: 'Encargado'), encargado.id])
                redirect encargado
            }
            '*'{ respond encargado, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    @Transactional
    def delete(Encargado encargado) {

        if (encargado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        encargado.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'encargado.label', default: 'Encargado'), encargado.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'encargado.label', default: 'Encargado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
