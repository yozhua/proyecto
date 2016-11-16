package seguridad
import grails.transaction.Transactional
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor
import com.castor.seguridad.Token
import org.apache.commons.validator.routines.EmailValidator 
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
@Transactional
class TokenService {

    def grailsApplication //Variable global de la aplicacion

    /**
     * guardar un token
     * @param token
     * @return
     */
    def save(Token token) {
        token.save()
    }

    
    /**
     * Encriptar una cadena
     * @param string
     * @return
     */
    def encrypt(string){
        def jasyptConfig    = grailsApplication.config.jasypt
        def stringEncryptor = new StandardPBEStringEncryptor(jasyptConfig)
        return stringEncryptor.encrypt(string)
    }

    /**
     * desencriptar una cadena
     * @param token
     * @return
     */
    def decrypt(token){
        def jasyptConfig    = grailsApplication.config.jasypt
        def stringEncryptor = new StandardPBEStringEncryptor(jasyptConfig)
        return stringEncryptor.decrypt(token)
    }

    /**
     * Verificar que un token exista, sea de un tipo especifico
     * y que no haya sido usado
     * @param token
     * @param type
     * @return
     */
    def check_token(token,type){
        return Token.findByTokenAndTokenTypeAndTokenStatus(token,type,false)
    }

    /**
     * Busca un token y cambia su status a true
     * @param token
     * @return
     */
    def use_token(token){
        def find_token = Token.findByToken(token)
        find_token.tokenStatus = true
        return find_token.save()
    }

}