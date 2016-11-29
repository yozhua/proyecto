package com.castor.bitacora
import com.castor.cliente.Sucursal
import com.castor.cliente.Cliente
import com.castor.bitacora.EstadoBitacora
import com.castor.empleado.Empleado
import com.castor.encargado.Encargado

class Bitacora {

	Cliente cliente
	Empleado empleado
	Encargado encargado
	Sucursal sucursal
	EstadoBitacora estadoBitacora
	TipoAsistencia tipoAsistencia
	Solucion solucion
	Integer folio
	String quienReporta
	Date fechaCreacion
	String tiempoDuracion
	Date fechaTerminacion
	Tags tags
	String problema
	String observaciones	
	Integer asignarEmpleado

	static belongsTo = [sucursal: Sucursal,empleado: Empleado, 
						encargado: Encargado, cliente: Cliente, 
						estadoBitacora: EstadoBitacora,
						tipoAsistencia: TipoAsistencia]

	static hasMany = [	historialDeBitacora : HistorialDeBitacora,
						actividad: Actividad,
						registroTiempo: RegistroTiempo,
						tags: Tags,
						solucion: Solucion]

    static constraints = {
    	folio nullable: false
    	asignarEmpleado nullable: false
    	quienReporta minSize:6,  maxSize: 40
    	estadoBitacora nullable: false
		empleado nullable: false
		cliente nullable: false
		sucursal nullable: false
		encargado nullable: false
		tipoAsistencia nullable: false
		fechaCreacion nullable: false
		tiempoDuracion nullable: false
		fechaTerminacion nullable: false
		problema nullable: false
		observaciones nullable: false
		solucion nullable: false		
		tags nullable: false		
    }

    static mapping = {
		version false
		problema (type:'text')		
		observaciones (type:'text')
	}
}
