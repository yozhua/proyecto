package com.castor.cliente

class TipoCliente {

	String nombre
	String descripcion
	double tiempoRespuesta
	boolean notificacion	

    static constraints = {
    	nombre minSize: 5, maxSize: 40
		descripcion minSize: 3, maxSize: 255
		tiempoRespuesta nullable: false
		notificacion  nullable: false
    }
		static mapping = {
			version false
		}
}
