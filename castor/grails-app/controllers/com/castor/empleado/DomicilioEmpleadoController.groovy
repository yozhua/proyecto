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
class DomicilioEmpleadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DomicilioEmpleado.list(params), model:[domicilioEmpleadoCount: DomicilioEmpleado.count()]
    }

    def show(DomicilioEmpleado domicilioEmpleado) {
        respond domicilioEmpleado
    }

    def create() {
        respond new DomicilioEmpleado(params)
    }

    @Transactional
    def save(DomicilioEmpleado domicilioEmpleado) {

        def domicilio = JSON.parse(params.domicilioEmpleado)
        println domicilio as JSON

        domicilioEmpleado.empleado = Empleado.last()
        domicilioEmpleado.calle = domicilio.calle
        domicilioEmpleado.numeroExterior = domicilio.numeroExterior
        domicilioEmpleado.numeroInterior = domicilio.numeroInterior
        domicilioEmpleado.colonia = domicilio.colonia
        domicilioEmpleado.ciudad = domicilio.ciudad
        domicilioEmpleado.municipio = domicilio.municipio
        domicilioEmpleado.estado = domicilio.estado
        domicilioEmpleado.pais = domicilio.pais
        domicilioEmpleado.codigoPostal = domicilio.codigoPostal.toInteger()
        domicilioEmpleado.referencias = domicilio.referencias

        println domicilioEmpleado as JSON
        if (domicilioEmpleado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (!domicilioEmpleado.validate()) {
            transactionStatus.setRollbackOnly()
            respond domicilioEmpleado.errors, view:'create'
            return
        }

        domicilioEmpleado.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'domicilioEmpleado.label', default: 'DomicilioEmpleado'), domicilioEmpleado.id])
                redirect domicilioEmpleado
            }
            '*' { respond domicilioEmpleado, [status: CREATED] }
        }
    }

    def edit(DomicilioEmpleado domicilioEmpleado) {
        respond domicilioEmpleado
    }

    @Transactional
    def update(DomicilioEmpleado domicilioEmpleado) {
        if (domicilioEmpleado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (domicilioEmpleado.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond domicilioEmpleado.errors, view:'edit'
            return
        }

        domicilioEmpleado.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'domicilioEmpleado.label', default: 'DomicilioEmpleado'), domicilioEmpleado.id])
                redirect domicilioEmpleado
            }
            '*'{ respond domicilioEmpleado, [status: OK] }
        }
    }

    @Transactional
    def delete(DomicilioEmpleado domicilioEmpleado) {

        if (domicilioEmpleado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        domicilioEmpleado.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'domicilioEmpleado.label', default: 'DomicilioEmpleado'), domicilioEmpleado.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'domicilioEmpleado.label', default: 'DomicilioEmpleado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
