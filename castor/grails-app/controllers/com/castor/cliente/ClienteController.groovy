package com.castor.cliente
import com.castor.cliente.*
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
import grails.gorm.*

@Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
@Transactional(readOnly = true)
class ClienteController {    

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def getAllClientes(){
        def clientes = Cliente.list()
        render clientes as JSON
    }

    
    /**
    *Envía vista con formulario del riesgo a editar
    */@Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    @Transactional
    def editRiesgo(){
        if (params == null) {
            notFound()
            return
        } 
        def riesgo = Cliente.get(params.id)
        if(riesgo){
            response.status = 200
            [riesgo:riesgo,create:false]
        }
        else{
            response.status = 404
            render ([message: "No se encontró el cliente"] as JSON)
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    def busqueda() {
        render view: '/cliente/find'
    }   
    
    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])    
    def busquedaCliente () {
        String nombreComercial = params.nombreComercial
        String rfc = params.rfc
        //TipoCliente tipoCliente = params.tipoCliente //checar
        //TipoPersona tipoPersona = params.tipoPersona //checar
        String apellidoPaterno = params.apellidoPaterno
        String apellidoMaterno = params.apellidoMaterno
        String nombrePersona = params.nombrePersona
        String estatus = params.estatus
        String razonSocial = params.razonSocial

        println estatus     
        def query = Cliente.where {
            nombreComercial =~nombreComercial ||
            rfc =~ rfc ||
            //tipoCliente == tipoCliente ||
            //tipoPersona == tipoPersona ||
            apellidoPaterno =~ apellidoPaterno ||
            apellidoMaterno =~ apellidoMaterno ||
            nombrePersona =~ nombrePersona ||
            estatus == estatus ||
            razonSocial =~ razonSocial                        
        }
        def listaClientes = query.findAll()        
        //listaCliente.listOrderByNombreComercial()
        println listaClientes as JSON                      
        render(view:'results', model:['listaClientes':listaClientes])
    }    

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cliente.list(params), model:[clienteCount: Cliente.count()]
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    def show() {
        
        def cliente = Cliente.findById(params.id)
        def tipoPersona = TipoPersona.find(cliente.tipoPersona)
        def tipoCliente = TipoCliente.find(cliente.tipoCliente)
                
        params.cliente=cliente
        params.tipoPersona = tipoPersona
        params.tipoCliente = tipoCliente
        
        respond params
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    def create() {
        respond new Cliente(params)
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    @Transactional
    def save(Cliente cliente) {
        println params as JSON        
        def clienteJson = params
        println cliente as JSON

        cliente.nombreComercial = clienteJson.nombreComercial
        cliente.tipoPersona = TipoPersona.findById(clienteJson.tipoPersona)
        cliente.tipoCliente = TipoCliente.findById(clienteJson.tipoCliente)
        cliente.nombrePersona = clienteJson.nombrePersona
        cliente.apellidoPaterno = clienteJson.apellidoPaterno
        cliente.apellidoMaterno = clienteJson.apellidoMaterno
        cliente.razonSocial = clienteJson.razonSocial
        cliente.rfc = clienteJson.rfc
        cliente.email = clienteJson.email
        cliente.telefonofijo = clienteJson.telefonofijo
        cliente.telefonoCelular = clienteJson.telefonoCelular
        cliente.estatus = true

        println cliente as JSON

        if (cliente == null) {
            transactionStatus.setRollbackOnly()
            //respond cliente.errors, view:'create'//Quitar estal linea si hay error
            notFound()
            return            
        }

        if (!cliente.validate()) {
            transactionStatus.setRollbackOnly()
            respond cliente.errors, view:'create'
            return
        }

        cliente.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
                redirect cliente
                //redirect action:"show" //redirecciono a show descomentar linea superior
            }
            '*' { respond cliente, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    def edit(Cliente cliente) {
        respond cliente
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    @Transactional
    def update(Cliente cliente) {
        if (cliente == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (cliente.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond cliente.errors, view:'edit'
            return
        }

        cliente.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
                redirect cliente
            }
            '*'{ respond cliente, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    @Transactional
    def delete(Cliente cliente) {

        if (cliente == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        cliente.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cliente.label', default: 'Cliente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }   
}
