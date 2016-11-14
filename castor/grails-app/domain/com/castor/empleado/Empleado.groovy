package com.castor.empleado
import com.castor.encargado.RegistroHistoricoCliente
import com.castor.bitacora.Bitacora
import com.castor.bitacora.Actividad
import com.castor.bitacora.RegistroTiempo
import com.castor.bitacora.HistorialDeBitacora
import com.castor.seguridad.User

class Empleado {

	User user
	String nombre
	String apellidoPaterno
	String apellidoMaterno
	String telefono
	String nombreContacto
	String telefonoContacto
	String relacionContacto
	boolean estatus

	static belongsTo = [user: User]

	static hasMany = [	registroHistoricoCliente : RegistroHistoricoCliente, 
						actividad: Actividad,
						bitacora: Bitacora,
						registroTiempo: RegistroTiempo, 
						historialDeBitacora : HistorialDeBitacora]

    static constraints = {
    	user nullable: false
		nombre minSize: 4, maxSize: 20
		apellidoPaterno minSize: 4, maxSize: 20
		apellidoMaterno minSize: 4, maxSize: 20		
		telefono minSize: 7, maxSize: 8
		nombreContacto minSize: 4, maxSize: 20
		telefonoContacto minSize: 7, maxSize: 8
		relacionContacto minSize: 4, maxSize: 25
		estatus nullable: false
    }
	
	static mapping = {
		version false
	}

    public Empleado(
    	User user,
		String nombre,
		String apellidoPaterno,
		String apellidoMaterno,
		String telefono,
		String nombreContacto,
		String telefonoContacto,
		String relacionContacto,
		boolean estatus){
			this()
			this.user=user
			this.nombre=nombre
			this.apellidoPaterno=apellidoPaterno
			this.apellidoMaterno=apellidoMaterno
			this.telefono=telefono
			this.nombreContacto=nombreContacto
			this.telefonoContacto=telefonoContacto
			this.relacionContacto=relacionContacto
			this.estatus=estatus
	}
}
