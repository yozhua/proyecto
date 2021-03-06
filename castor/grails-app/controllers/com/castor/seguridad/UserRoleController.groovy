package com.castor.seguridad
import seguridad.UserService
import org.apache.commons.validator.routines.EmailValidator
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
import grails.converters.*
import groovy.transform.ToString
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

@Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
@Transactional(readOnly = true)
class UserRoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserRole.list(params), model:[userRoleCount: UserRole.count()]
    }

    def show(UserRole userRole) {
        respond userRole
    }

    def create() {
        respond new UserRole(params)
    }

    @Transactional
    def save(UserRole userRole) {
        def userol = JSON.parse(params.userrole)
        println userol as JSON

        userRole.user = User.get(userol.user)
        userRole.role = Role.get(userol.role)

        println userRole as JSON
        if (userRole == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (!userRole.validate()) {
            transactionStatus.setRollbackOnly()
            respond userRole.errors
            return
        }

        userRole.save flush:true
    }

    def edit(UserRole userRole) {
        respond userRole
    }

    @Transactional
    def update(UserRole userRole) {
        if (userRole == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (userRole.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond userRole.errors, view:'edit'
            return
        }

        userRole.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRole.id])
                redirect userRole
            }
            '*'{ respond userRole, [status: OK] }
        }
    }

    @Transactional
    def delete(UserRole userRole) {

        if (userRole == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        userRole.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRole.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
