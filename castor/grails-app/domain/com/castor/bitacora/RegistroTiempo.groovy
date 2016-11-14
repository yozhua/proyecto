package com.castor.bitacora
import com.castor.empleado.Empleado

class RegistroTiempo {

	Bitacora bitacora
    Empleado empleado
	double tiempoInicio
	double duracion
	double tiempoFinal

	static belongsTo = [bitacora: Bitacora,empleado: Empleado]

    static constraints = {
    	bitacora nullable: false
    	empleado nullable: false
    	tiempoInicio nullable: false
		duracion nullable: false
		tiempoFinal nullable: false
    }

    static mapping = {
		version false
	}
}