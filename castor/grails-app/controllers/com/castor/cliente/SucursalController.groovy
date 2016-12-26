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

@Transactional(readOnly = true)
class SucursalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", create: "GET"]

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA','ROLE_TECNICO'])
    def getAllSucursales(){
        def sucursales = Sucursal.list()        
        render sucursales as JSON
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    def busqueda() {
        render view: '/sucursal/find'
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])    
    def busquedaSucursal () {
        //Cliente cliente = params.cliente
        String nombre = params.nombre
        //TipoSucursal tipoSucursal = params.tipoSucursal //checar        
        String telefono = params.telefono
        String estatus = params.estatus
                
        println nombre
        println telefono
        println estatus

        def query = Sucursal.where {
            //cliente == cliente ||            
            nombre =~nombre ||
            //tipoSucursal == tipoSucursal ||            
            telefono =~ telefono ||
            estatus == estatus             
        }        
        def listaSucursales = query.findAll()        
        
        println estatus     
        //listaCliente.listOrderByNombreComercial()
        println listaSucursales as JSON                      
        render(view:'results', model:['listaSucursales':listaSucursales])
    }   

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sucursal.list(params), model:[sucursalCount: Sucursal.count()]
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    def show() {
        def sucursal = Sucursal.findById(params.id)
        def tipoSucursal = TipoSucursal.find(sucursal.tipoSucursal)
                        
        params.sucursal = sucursal
        params.tipoSucursal = tipoSucursal        
        respond params
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    def create() {
        respond new Sucursal(params)
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    @Transactional
    def save(Sucursal sucursal) {
        println params as JSON
        def sucursalJson = params        
        println sucursal as JSON

        sucursal.cliente = Cliente.findById(sucursalJson.cliente)
        sucursal.nombre = sucursalJson.nombre        
        sucursal.tipoSucursal = TipoSucursal.findById(sucursalJson.tipoSucursal)
        sucursal.telefono = sucursalJson.telefono
        sucursal.calle = sucursalJson.calle
        sucursal.numeroExterior = sucursalJson.numeroExterior
        sucursal.numeroInterior = sucursalJson.numeroInterior
        sucursal.colonia = sucursalJson.colonia
        sucursal.ciudad = sucursalJson.ciudad
        sucursal.municipio = sucursalJson.municipio
        sucursal.estado = sucursalJson.estado
        sucursal.pais = sucursalJson.pais
        sucursal.codigoPostal = sucursalJson.codigoPostal.toInteger()
        sucursal.estatus = true

        println sucursal as JSON

        if (sucursal == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (!sucursal.validate()) {
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

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
    def edit(Sucursal sucursal) {
        respond sucursal
    }

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
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

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
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

    @Secured(['ROLE_ADMIN','ROLE_ADMINISTRATIVO','ROLE_GERENCIA'])
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

