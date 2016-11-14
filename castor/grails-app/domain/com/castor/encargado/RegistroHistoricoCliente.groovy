package com.castor.encargado
import com.castor.empleado.Empleado

class RegistroHistoricoCliente {
	Empleado empleado
	Encargado encargado
	Date fechaRegistro

	static belongsTo = [empleado: Empleado, encargado:Encargado]

    static constraints = {
    	empleado nullable: false
		encargado nullable: false
		fechaRegistro nullable: false
    }
	
	static mapping = {
		version false
	}
}
