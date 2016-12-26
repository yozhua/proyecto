package com.castor.cliente
import com.castor.bitacora.Bitacora
import com.castor.encargado.Encargado

class Sucursal {

	Cliente cliente
	TipoSucursal tipoSucursal
	String nombre
	String telefono
	String calle
	String numeroExterior
	String numeroInterior
	String colonia
	String ciudad
	String municipio
	String estado
	String pais
	Integer codigoPostal
	String referencias
	boolean estatus

	static belongsTo = [cliente: Cliente,
						tipoSucursal: TipoSucursal]

	static hasMany = [	encargado : Encargado, 
						bitacora : Bitacora]

    static constraints = {
    	cliente nullable: false
		tipoSucursal nullable: false
		nombre minSize: 2, maxSize: 50
		telefono minSize: 7, maxSize: 10
		calle minSize: 2, maxSize: 50
		numeroExterior minSize: 1, maxSize: 50
		numeroInterior nullable: true
		colonia minSize: 3, maxSize: 50
		ciudad minSize: 3, maxSize: 50
		municipio minSize: 3, maxSize: 50
		estado minSize: 3, maxSize: 50
		pais minSize: 3, maxSize: 50
		codigoPostal minSize: 5, maxSize: 5
		referencias nullable: true
		estatus nullable: false
    }
	
	static mapping = {
		version false
		referencias (type:'text')

	}
}
