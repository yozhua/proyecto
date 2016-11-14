package com.castor.empleado

class DomicilioEmpleado {
	Empleado empleado
	String calle
	String numeroExterior
	String numeroInterior
	String colonia
	String ciudad
	String municipio
	String estado
	String pais
	Integer codigoPostal
	String referencias

	static belongsTo = [empleado: Empleado]

    static constraints = {
    	empleado nullable: false
    	calle minSize: 3, maxSize: 50
		numeroExterior minSize: 3, maxSize: 50
		numeroInterior nullable: true
		colonia minSize: 3, maxSize: 50
		ciudad minSize: 3, maxSize: 50
		municipio minSize: 3, maxSize: 50
		estado minSize: 3, maxSize: 50
		pais minSize: 3, maxSize: 50
		codigoPostal minSize: 5, maxSize: 5
		referencias nullable: true
    }
	
	static mapping = {
		version false
	}
}
