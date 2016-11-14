package com.castor.cliente

class TipoPersona {

	String nombre
	String descripcion

    static constraints = {
    	nombre minSize: 5, maxSize: 50
		descripcion minSize: 3, maxSize: 255
    }
		static mapping = {
			version false
		}
}
