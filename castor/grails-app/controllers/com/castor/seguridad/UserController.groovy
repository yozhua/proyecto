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
class UserController {

 def userService
    static allowedMethods = [getEmail: "POST", getUser: "POST", save: "POST", update: "PUT", delete: "DELETE"]
    /************* restore pass *********/
    /**
     * Renderea la vista de restablecer contraseña
     * donde solo aparece el correo
     * @return
     */
    def restore_pass(){
        render view: '/restore/restore_pass'
    }

    def initial_view(){
        render view: '/login/auth'
    }
    /**
     * envio del email
     * @return
     */
    @Transactional(readOnly = false)
    def send_email(){
        def errors = []
        /**
         * Valido que el email exista y a demas sea un email valido
         */

        def valid_email = userService.validate_email(params.email)//Validación del email

        if(valid_email.valid && valid_email.exist){//si es valido y existe

            userService.send_email(params.email)//envio el email

            redirect action:'auth', controller:'login'//redirijo al login

            return

        }else{//sino es valido añado el error encontrado
            errors?.add(!valid_email.valid?"user.email.invalid.label":null)
            errors?.add(!valid_email.exist?"user.email.exist.label":null)
        }

        render view:'/restore/restore_pass', model:[errors:errors]//rendereo la misma vista indicando los errores
    }

    /**
     * Si el token existe, es del tipo correcto y no ha sido usado
     * muestro la vista de cambio de contraseña
     * sino muestro el error 404
     * @return
     */
    def change_pass(String token){
        if(userService.check_token(token)){
            render view: '/restore/change_pass'
        }else{
            render view: '/error/404'
        }
    }

    /**
     * Verifico que el token exista y sea del tipo correcto
     * que no haya sido usado, si cumple hago el update del password
     * que consta de validar primero el passwor con el campo confirm
     * si todo es correcto redirijo al login
     * @return
     */
    @Transactional(readOnly = false)
    def update_pass(){

        def errors = []
        if(userService.check_token(params.token)){//verifico la integridad del token
            def update_user = userService.update_pass(params)//trato de hacer el update del password (hay validacion)
                if(update_user.response){ //si la respuesta de update_pass es true
                redirect action:'auth', controller:'login'//redirigir a login
                return
            }
            errors?.add(update_user.valid?"user.password.error":null)//sino se hizo el update añado los errores que se encuentren (Valid y match)
            errors?.add(update_user.match?"user.password.confirm.error":null)

        }else{//si trataron de alterar el token
            errors.add('user.invalid.token')//añado un error de token invalido
        }
        render view: '/restore/change_pass', model:['errors': errors]//rendereo la vista nuevamente con los errores que encuentre
    }

    //Obtener usuario
    def getUser(){
      try{

        def usuario = User.findByUsername(params.username)

        if(usuario){
          response.status = 200
          render ([disponible: false] as JSON)
        }else{
          response.status = 200
          render ([disponible: true] as JSON)
        }


      }
      catch(Exception ex){
        response.status = 500
        render ([message: "No puede haber datos vacíos en miembro."] as JSON)
      }

    }

    //Obtener email
    def getEmail(){
      try{
        def email = User.findByEmail(params.email)
        if(email){
          response.status = 200
          render ([disponible: true] as JSON)
        }else{
          response.status = 200
          render ([disponible: false] as JSON)
        }
      }
      catch(Exception ex){
        response.status = 500
        render ([message: "No puede haber datos vacíos en miembro."] as JSON)
      }

    }


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userCount: User.count()]
    }

    def show(User user) {
        respond user
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User user) {

        def usuario = JSON.parse(params.user)
        println usuario as JSON

        user.username = usuario.username
        user.email = usuario.email
        user.password = usuario.password

        println user as JSON
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (!user.validate()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'create'
            return
        }

        user.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def numeroUser(){
      try{
        if(User.getAll() == null){
          render (id:1)
        }else
        {
          render User.last() as JSON
        }
      }
      catch(Exception ex){
        response.status = 500
        render ([message: "No puede haber datos vacíos en miembro."] as JSON)
      }
    }

    def numeroRole(){
    try{
      render Role.findById(params.rol) as JSON
    }
    catch(Exception ex){
      response.status = 500
      render ([message: "No puede haber datos vacíos en miembro."] as JSON)
    }
    }

    def edit(User user) {
        respond user
    }

    @Transactional
    def update(User user) {
        def usuario = JSON.parse(params.user)
        println usuario as JSON

        user.username = usuario.username
        user.email = usuario.email
        
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (!user.validate()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'edit'
            return
        }

        user.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    @Transactional
    def delete(User user) {

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        user.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
