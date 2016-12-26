package com.castor.empleado
import com.castor.seguridad.*

import groovy.json.JsonSlurper
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


@Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])

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
    def show() {
        def empleado = Empleado.findById(params.id)

        def usuarios = User.find(empleado.user)

        def domicilio = DomicilioEmpleado.findByEmpleado(empleado)

        def rol = Role.find(UserRole.findByUser(usuarios).role)
        params.empleado=empleado
        params.domicilio = domicilio
        params.user = usuarios
        params.rol = rol

        respond params as JSON
    }

    def create() {
        respond new Empleado(params)
    }

    def busca(){
      try{

        def slurper = new JsonSlurper()
        def empleados=slurper.parseText(params.empleado)
        println empleados
        def query = "from Empleado em "
        def qnombre = "em.nombre ="+ empleados.nombre
        def qapellidoPaterno = "em.apellidoPaterno ="+empleados.apellidoPaterno
        def qapellidoMaterno = "em.apellidoMaterno ="+empleados.apellidoMaterno
        def qestatus = "em.estatus ="+empleados.estatus
        def where = false

        if(empleados.nombre != null && (empleados.nombre.length() > 0)){
          if(where){
            query+= " "+ qnombre
          }else{
            query+=" where "+qnombre
            where=true
          }
        }
        if(empleados.apellidoPaterno != null && (empleados.apellidoPaterno.length() > 0)){
          if(where){
            query+= " and "+ qapellidoPaterno
          }else{
            query+=" where "+qapellidoPaterno
            where=true
          }
        }
        if(empleados.apellidoMaterno != null && (empleados.apellidoMaterno.length() > 0)){
          if(where){
            query+= " and "+ qapellidoMaterno
          }else{
            query+=" where "+qapellidoMaterno
            where=true
          }
        }
        if(empleados.estatus != null && (empleados.estatus.length() > 0)){
          if(where){
            query+= " and "+ qestatus
          }else{
            query+=" where "+qestatus
            where=true
          }
        }
        def empleadobusqueda = Empleado.findAll  (query)
        println empleadobusqueda as JSON
        response.status = 200
        render (empleadobusqueda as JSON)
      }
        catch(Exception ex){
          response.status = 500
          render ([message: "Hubo un error"] as JSON)
      }

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
        empleado.estatus = true

        println empleado as JSON

        if (empleado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (!empleado.validate()) {
            transactionStatus.setRollbackOnly()
            respond empleado.errors
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

    def edit() {
      def empleado = Empleado.findById(params.id)

      def usuarios = User.find(empleado.user)

      def domicilio = DomicilioEmpleado.findByEmpleado(empleado)

      def rol = Role.find(UserRole.findByUser(usuarios).role)
      params.empleado=empleado
      params.domicilio = domicilio
      params.user = usuarios
      params.rol = rol

      respond params
    }

    @Transactional
    def update(Empleado empleado) {
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
        empleado.estatus = empleado2.estaus

        println empleado as JSON

        if (empleado == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (!empleado.validate()) {
            transactionStatus.setRollbackOnly()
            respond empleado.errors
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
