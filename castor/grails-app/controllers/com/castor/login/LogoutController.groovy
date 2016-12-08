package com.castor.login
import org.springframework.security.access.annotation.Secured
import org.springframework.security.web.RedirectStrategy
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.converters.JSON
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

@Secured('permitAll')
class LogoutController {

    RedirectStrategy redirectStrategy

	/**
	 * Index action. Redirects to the Spring security logout uri.
	 */
	def index() {

		if (!request.post && SpringSecurityUtils.getSecurityConfig().logout.postOnly) {
			response.sendError HttpServletResponse.SC_METHOD_NOT_ALLOWED // 405
			return "redirect :localhost:8080/login/auth"
			//return "redirect :localhost:8080/login/auth"
			// return redirect action:'auth', controller:'login'
			//render view: '/login/auth'
			//render([error: 'access denied'] as JSON)
			//println  (response.sendError HttpServletResponse.SC_METHOD_NOT_ALLOWED as jason)
		}

		// TODO put any pre-logout code here
		redirectStrategy.sendRedirect request, response, SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/logoff'
		response.flushBuffer()		
		return "redirect :localhost:8080/login/auth"
		//render view: 'auth'	
		//redirect ["http://localhost:8080/login/auth"]
		//render(view: "login/auth")
//		return "redirect:/login?logout"
		// http://localhost:8080/login/auth
		//You can redirect wherever you want, but generally it's a good practice to show login screen again.
	}

	def salir(){
		redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/j_spring_security_logout'
	}	
	
	
	def logoutPage () {
		if (!request.post && SpringSecurityUtils.getSecurityConfig().logout.postOnly) {
			response.sendError HttpServletResponse.SC_METHOD_NOT_ALLOWED // 405
			return "redirect :localhost:8080/login/auth"
		}
		redirectStrategy.sendRedirect request, response, SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/logoff'
		response.flushBuffer()
		redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl
		return "redirect:/login/auth"//You can redirect wherever you want, but generally it's a good idea to show login screen again.
	}

}