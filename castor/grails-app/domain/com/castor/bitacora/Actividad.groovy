package com.castor.bitacora
import com.castor.empleado.Empleado


class Actividad {

	Bitacora bitacora
	Empleado empleado
	String actividad

	static belongsTo = [empleado: Empleado, bitacora: Bitacora]

    static constraints = {
    	bitacora nullable: false  
    	empleado nullable: false  
    	actividad nullable: false
    }

    static mapping = {
		actividad (type:'text')		
		version false	
	}
}
