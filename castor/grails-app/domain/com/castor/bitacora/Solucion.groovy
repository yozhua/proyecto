package com.castor.bitacora

class Solucion {
 
	String descripcion	

	static hasMany = [bitacora : Bitacora]

    static constraints = {
 	   	descripcion minSize: 5, maxSize: 255    	
    }

    static mapping = {
		version false
	}
}    
