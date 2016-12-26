package com.castor.encargado
import com.castor.cliente.Sucursal
import com.castor.bitacora.Bitacora
import com.castor.seguridad.User

class Encargado {

	User user
	Sucursal sucursal
	String nombre
	String apellidoPaterno
	String apellidoMaterno	
	String telefono
	boolean autorizacion
	boolean estatus

	static belongsTo = [sucursal: Sucursal, user: User]

	static hasMany = [bitacora : Bitacora]

    static constraints = {
    	user nullable: false
		sucursal nullable: false		
		nombre minSize: 4, maxSize: 20
		apellidoPaterno minSize: 4, maxSize: 20
		apellidoMaterno nullable: true				
		telefono minSize: 7, maxSize: 10
		estatus nullable: false
		autorizacion nullable: false
    }
	
	static mapping = {
		version false
	}
}
