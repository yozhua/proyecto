package com.castor.bitacora

class EstadoBitacora {

	String estado
	Integer indice
	Boolean visible

	static hasMany = [bitacora : Bitacora]

    static constraints = {
    	estado minSize: 5, maxSize: 50
    	indice minSize: 1, maxSize: 20
    	visible nullable: false
    }
		static mapping = {
			version false
		}
}
