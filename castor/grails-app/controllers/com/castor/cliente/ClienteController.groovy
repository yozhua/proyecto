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

@Secured('permitAll')
@Transactional(readOnly = true)
class ClienteController {    

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def getAllClientes(){
        def clientes = Cliente.list()
        render clientes as JSON
    }

    def busqueda() {
        render view: '/cliente/find'
    }   
        
    def busquedaCliente = {
        String nombreComercial = params.nombreComercial
        String rfc = params.rfc
        //TipoCliente tipoCliente = params.tipoCliente //checar
        //TipoPersona tipoPersona = params.tipoPersona //checar
        String apellidoPaterno = params.apellidoPaterno
        String apellidoMaterno = params.apellidoMaterno
        String nombrePersona = params.nombrePersona
        String estatus = params.estatus
        String razonSocial = params.razonSocial
        
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
        println estatus     
        render(view:'searchResults', model:['listaClientes':listaClientes])
    }    

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cliente.list(params), model:[clienteCount: Cliente.count()]
    }

    def show(Cliente cliente) {
        respond cliente
    }

    def create() {
        respond new Cliente(params)
    }


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
            notFound()
            return
        }

        if (cliente.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond cliente.errors, view:'create'
            return
        }

        cliente.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cliente.label', default: 'Cliente'), cliente.id])
                redirect cliente
            }
            '*' { respond cliente, [status: CREATED] }
        }
    }

    def edit(Cliente cliente) {
        respond cliente
    }

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
