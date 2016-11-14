package com.castor.seguridad

class Token {

	/*
	token es la cadena encriptada, tokenType es el tipo de token, 
	en algún momento necesitaras mas tipos, por ahora solo existen 
	para restablecer contraseña y tokenStatus que indica si el token ya fue usado.
	*/

   	String token
    String tokenType
    Boolean tokenStatus

    static constraints = {
        token()
        tokenType inList: ['restore','other']
        tokenStatus defaultValue:false
    }
	
	static mapping = {	
		version false
		table '`token`'
	}
}
