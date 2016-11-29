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
class SucursalController {
    
    def getAllSucursales(){
    	def sucursales = Sucursal.list()    	
        render sucursales as JSON
    }
}
    	
       