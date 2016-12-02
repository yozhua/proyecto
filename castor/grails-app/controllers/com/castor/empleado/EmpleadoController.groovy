package com.castor.empleado
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
class EmpleadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Empleado.list(params), model:[empleadoCount: Empleado.count()]
    }

    def getUsuarioSoporte(id){
        def usuarioSoporte = User.findAllWhere(autorizacion: id)                     
        render usuarioSoporte as JSON
    }

    def busqueda() {
        render view: '/empleado/find'
    }
    def show(Empleado empleado) {
        respond empleado
    }

    def create() {
        respond new Empleado(params)
    }

    @Transactional
    def save(Empleado empleado) {
        println params as JSON
        def empleado2 = JSON.parse(params.empleado)
        def user = User.get(empleado2.user)
        println user as JSON
        println empleado as JSON


        empleado.user = user
        empleado.nombre = empleado2.nombre
        empleado.apellidoPaterno = empleado2.apellidoPaterno
        empleado.apellidoMaterno = empleado2.apellidoMaterno
        empleado.telefono = empleado2.telefono
        empleado.nombreContacto = empleado2.nombreContacto
        empleado.telefonoContacto = empleado2.telefonoContacto
        empleado.relacionContacto = empleado2.relacionContacto

        println empleado as JSON

        if (empleado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (!empleado.validate()) {
            transactionStatus.setRollbackOnly()
            respond empleado.errors, view:'create'
            return
        }

        empleado.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'empleado.label', default: 'Empleado'), empleado.id])
                redirect empleado
            }
            '*' { respond empleado, [status: CREATED] }
        }
    }

    def edit(Empleado empleado) {
        respond empleado
    }

    @Transactional
    def update(Empleado empleado) {
        if (empleado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (empleado.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond empleado.errors, view:'edit'
            return
        }

        empleado.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'empleado.label', default: 'Empleado'), empleado.id])
                redirect empleado
            }
            '*'{ respond empleado, [status: OK] }
        }
    }

    @Transactional
    def delete(Empleado empleado) {

        if (empleado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        empleado.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'empleado.label', default: 'Empleado'), empleado.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'empleado.label', default: 'Empleado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
