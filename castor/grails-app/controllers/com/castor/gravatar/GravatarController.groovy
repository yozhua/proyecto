package com.castor.gravatar

import grails.converters.JSON
import org.springframework.security.access.annotation.Secured
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.AuthenticationTrustResolver
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.WebAttributes
import java.security.MessageDigest

import javax.servlet.http.HttpServletResponse

@Secured('permitAll')
class GravatarController {
 
   	/**Sirve para obtener el hash de un String recibido mediante un parámetro, esto para crear el avatar del usuario*/
	def getHash(){
		String correo = params.correo
		def digest = MessageDigest.getInstance("MD5")
		def md5hash = new BigInteger(1,digest.digest(correo.getBytes())).toString(16).padLeft(32,"0")
		render "https://www.gravatar.com/avatar/"+md5hash.toString()+"?s=40&d=identicon"			
	}
}
