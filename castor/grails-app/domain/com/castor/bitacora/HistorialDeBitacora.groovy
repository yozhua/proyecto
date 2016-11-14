package com.castor.bitacora
import com.castor.empleado.Empleado

class HistorialDeBitacora {

	Bitacora bitacora
	Empleado empleado
	String estado
	Date fecha

	static belongsTo = [bitacora: Bitacora,empleado: Empleado]

    static constraints = {
    	bitacora nullable: false
    	empleado nullable: false
    	estado minSize: 3, maxSize: 50
    	fecha nullable: false
    }

    static mapping = {
		version false
	}
}
