package com.castor.bitacora

class Tags {

    String nombre	

	static hasMany = [bitacora : Bitacora]

    static constraints = {
    	nombre minSize: 5, maxSize: 50    
    }

    static mapping = {
		version false
	}
}