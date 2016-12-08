package castor
import com.castor.seguridad.*
import com.castor.empleado.*
import com.castor.cliente.*
import com.castor.encargado.*

class BootStrap {

    def init = { servletContext ->
    	
    	  Role admin_Role = new Role('ROLE_ADMIN').save()
        Role administrativo_Role = new Role('ROLE_ADMINISTRATIVO').save()
        Role cliente_Role = new Role('ROLE_CLIENTE').save()
        Role tecnico_Role = new Role('ROLE_TECNICO').save()
        Role gerencia_Role = new Role('ROLE_GERENCIA').save()

      	
        User usuario = new User('admin', 'admin','dark_magician_21@hotmail.com').save()
        User usuario2 = new User('cliente','cliente', 'draculkarl@gmail.com').save()

      	UserRole rolUsuario=new UserRole(usuario, admin_Role, true).save()
        UserRole rolUsuario2=new UserRole(usuario2, cliente_Role, true).save()
      	
        TipoSucursal tipoSucursal= new TipoSucursal(
        nombre: 'Bodega',
        descripcion: 'Lugar donde se almacena papeles o servidores'
        ).save() 

        TipoPersona tipoPersona = new TipoPersona(
        nombre: 'Persona Fisica',
        descripcion: 'Persona Fisica registrada en el SAT'
        ).save() 

        TipoCliente  tipoCliente= new TipoCliente(
        nombre: 'Persona Fisica',
        descripcion: 'Persona Fisica registrada en el SAT',
        tiempoRespuesta: 4.0,
        notificacion: true
        ).save() 

        Cliente cliente = new Cliente(
        nombreComercial: 'Quemen',
        tipoPersona: 7,
        tipoCliente: 8,
        nombrePersona: 'Hasiel',
        apellidoPaterno: 'Hasiel',
        apellidoMaterno: 'Hasiel',
        razonSocial: '',
        rfc: 'dark_magician',
        email: 'draculkarl@gmail.com',  
        telefonofijo: '2321220',
        telefonoCelular: '2123321220',
        estatus: true
        ).save() 


        Sucursal sucursal= new Sucursal(
        cliente: 9,
        tipoSucursal: 6,
        nombre: 'Quemen Santa Rosa',
        telefono: '5667890',
        calle: 'Mexico',
        numeroExterior:'num. 8',
        numeroInterior: '',
        colonia: 'linda vista',
        ciudad: 'Oaxaca de Juarez',
        municipio: 'Oaxaca de Juarez',
        estado: 'Oaxaca',
        pais: 'Oaxaca',
        codigoPostal: 70989,
        referencias: '').save() 

        Encargado encargado = new Encargado(         
          user: 5,
          sucursal: 10,
          nombre: 'Yozhua', 
          apellidoPaterno: 'Palma', 
          apellidoMaterno: 'Flores',           
          telefono: '2321220',
          autorizacion: true,
          estatus: true 
          ).save() 


		    Empleado empleado = new Empleado(      		
      		user: 4,
      		nombre: 'Yozhua', 
      		apellidoPaterno: 'Palma', 
      		apellidoMaterno: 'Flores',       		
      		telefono: '2321220',
      		nombreContacto: 'Maria del rayo', 
      		telefonoContacto: '2321220',
      		relacionContacto:'Esposa', 
      		estatus: true 
      		).save()      	
      	
      	DomicilioEmpleado domicilio = new DomicilioEmpleado(
	    	empleado: 1,
	    	calle: 'Mexico',
  			numeroExterior:'num. 8',
  			numeroInterior: '',
  			colonia: 'linda vista',
  			ciudad: 'Oaxaca de Juarez',
  			municipio: 'Oaxaca de Juarez',
  			estado: 'Oaxaca',
        pais: 'Oaxaca',
  			codigoPostal: 70989,
  			referencias: '').save() 
      	
//      	assert User.count() == 1
  //    	assert Role.count() == 2
      	//assert UserRole.count() == 1
		   
    }	
	
	def destroy = {
    }
}
