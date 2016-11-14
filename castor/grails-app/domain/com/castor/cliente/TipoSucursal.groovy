package com.castor.cliente

class TipoSucursal {

	String nombre
	String descripcion
    
    static constraints = {
    	nombre minSize: 5, maxSize: 25
		descripcion minSize: 3, maxSize: 255
    }
	
	static mapping = {
		version false
	}
}
