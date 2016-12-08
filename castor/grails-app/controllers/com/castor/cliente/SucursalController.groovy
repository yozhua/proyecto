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

@Secured('permitAll')
@Transactional(readOnly = true)
class SucursalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def getAllSucursales(){
        def sucursales = Sucursal.list()        
        render sucursales as JSON
    }

    def busqueda() {
        render view: '/sucursal/find'
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sucursal.list(params), model:[sucursalCount: Sucursal.count()]
    }

    def show(Sucursal sucursal) {
        respond sucursal
    }

    def create() {
        respond new Sucursal(params)
    }

    @Transactional
    def save(Sucursal sucursal) {
        if (sucursal == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sucursal.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sucursal.errors, view:'create'
            return
        }

        sucursal.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sucursal.label', default: 'Sucursal'), sucursal.id])
                redirect sucursal
            }
            '*' { respond sucursal, [status: CREATED] }
        }
    }

    def edit(Sucursal sucursal) {
        respond sucursal
    }

    @Transactional
    def update(Sucursal sucursal) {
        if (sucursal == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (sucursal.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond sucursal.errors, view:'edit'
            return
        }

        sucursal.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'sucursal.label', default: 'Sucursal'), sucursal.id])
                redirect sucursal
            }
            '*'{ respond sucursal, [status: OK] }
        }
    }

    @Transactional
    def delete(Sucursal sucursal) {

        if (sucursal == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        sucursal.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'sucursal.label', default: 'Sucursal'), sucursal.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sucursal.label', default: 'Sucursal'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

