package com.castor.bitacora

class TipoAsistencia {

    String nombre
	String descripcion	

	static constraints = {
    	nombre minSize: 5, maxSize: 50, unique: true
 	   	descripcion minSize: 5, maxSize: 255    	
    }

    static mapping = {
		version false
	}
}    
