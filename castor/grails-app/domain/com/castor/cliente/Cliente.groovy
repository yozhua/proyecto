package com.castor.cliente
import com.castor.bitacora.Bitacora
import com.castor.encargado.Encargado

class Cliente {

	String nombreComercial
	TipoPersona tipoPersona
	TipoCliente tipoCliente
	String nombrePersona
	String apellidoPaterno
	String apellidoMaterno
	String razonSocial
	String rfc
	String email
	String telefonofijo
	String telefonoCelular
	boolean estatus

	static belongsTo = [tipoPersona: TipoPersona,
						tipoCliente: TipoCliente]

	static hasMany = [	sucursal : Sucursal, 						
						bitacora : Bitacora]

    static constraints = {    	
    	nombreComercial minSize: 5, maxSize: 100
		tipoPersona nullable: false
 		tipoCliente nullable: false
		nombrePersona nullable: true
		apellidoPaterno nullable: true
		apellidoMaterno nullable: true
		razonSocial nullable: true
		rfc minSize: 12, maxSize: 15, unique: true
		email email: true		
		telefonofijo minSize: 7, maxSize: 8
		telefonoCelular minSize: 10, maxSize: 10
		estatus nullable: false
    }

    static mapping = {
			version false
			razonSocial (type:'text')
	}
}
