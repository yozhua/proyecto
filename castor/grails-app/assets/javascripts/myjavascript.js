function validarPassword(){
	var password = document.getElementById("password").value;
	var passwordConfirm = document.getElementById("passwordConfirm").value;
	var espaciosEnBlanco = false;
	var contador = 0;

	while (!espaciosEnBlanco && (contador < password.length)) {
		if (password.charAt(contador) == " ")
		espaciosEnBlanco = true;
		contador++;
	}

	if (espaciosEnBlanco) {
		alertify.error("La contraseña no puede contener espacios en blanco.");
		return false;
	}

	if (password.length == 0 || passwordConfirm.length == 0) {		
	  	alertify.error("Los campos de la password no pueden quedar vacios.");        
	  	return false;
	}

	if (password != passwordConfirm) {
	  	alertify.error("Las contraseñas deben coincidir.");
        document.getElementById("password").focus();
	  	return false;
	} else {
	  	alertify.success("Ahora puedes iniciar sesion.");
	  	return true;
	}
}

function validarEmail(){
	email = document.getElementById("email").value;
	expresion = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if ( !expresion.test(email) ){
		alertify.error("El email no es correcto.");	        
	  	return false;
	}
}

function obtener_fecha() {
    var fecha_actual = new Date()
    var dia = fecha_actual.getDate()
    var mes = fecha_actual.getMonth() + 1
    var año = fecha_actual.getFullYear()

    if (mes < 10)
        mes = '0' + mes

    if (dia < 10)
        dia = '0' + dia
    return (dia + "/" + mes + "/" + año)
}

function mostrar_Fecha() {
   document.write(fecha_actual.value = obtener_fecha());
}

function validarTexto(){
	var nombre_actividad = document.getElementById("nombre_actividad").value;
	var espaciosEnBlanco = false;
	if (nombre_actividad.length == 0) {
	  	alertify.error("El campo de la actividad no pueden quedar vacio");
	  	return false;
	} else {
		agregar();
	}
}

$(document).ready(function(){
	$('#bt_add').click(function(){
		validarTexto();
	});
	$('#bt_edit').click(function(){
		eliminar(id_fila_selected);
	});
	$('#bt_delall').click(function(){
		eliminarTodasFilas();
	});
});


var cont=0;
var id_fila_selected=[];

function agregar(){
	nombre_actividad = document.getElementById("nombre_actividad").value;			 
	username = document.getElementById("username").value;					
	cont++;
	var fila='<tr class="selected" id="fila'+cont+
	'" onclick="seleccionar(this.id);"><td>'+cont+
					   					   '</td><td>'+username+
										   '</td><td>'+nombre_actividad+
										   '</td><td><intup id="bt_edit" type="button" value="Editar." class="btn btn-primary" aria-label="Edit"><i class="fa fa-pencil fa-fl" aria-hidden="true"></i></intup>'+""+
										   '<intup id="bt_delall" type="button" value="Eliminar." class="btn btn-danger" aria-label="Delete"><i class="fa fa-trash-o fa-fl" aria-hidden="true"></i></intup></td></tr>';

	$('#tabla').append(fila);
	reordenar();
	document.getElementById('nombre_actividad').value="";
}

function seleccionar(id_fila){
		if($('#'+id_fila).hasClass('seleccionada')){
			$('#'+id_fila).removeClass('seleccionada');
		}
		else{
			$('#'+id_fila).addClass('seleccionada');
		}
		id_fila_selected=id_fila;
	}

function eliminar(id_fila){
	$('#'+id_fila).remove();
	reordenar();
}

function reordenar(){
	var num=1;
	$('#tabla tbody tr').each(function(){
		$(this).find('td').eq(0).text(num);
		num++;
	});
}

function validaRFC(rfc) {
    var rfcCorrecto;
    rfcCorrecto = rfc;
    if (rfc.length == 13){
        var rfcValido = '^(([A-Z]|[a-z]|\s){1})(([A-Z]|[a-z]){3})([0-9]{6})((([A-Z]|[a-z]|[0-9]){3}))';
    } else{
        var rfcValido = '^(([A-Z]|[a-z]){3})([0-9]{6})((([A-Z]|[a-z]|[0-9]){3}))';
    }
    var validRfc = new RegExp(rfcValido);
    var matchArray = rfcCorrecto.match(validRfc);
    if (matchArray == null) {
        alertify.error('RFC incorrecto verifica tus datos.');
        return false;
    }
    else{
        alertify.success('RFC correcto:' + rfcCorrecto);
        return true;
    }
}


function validaTelefonoFijo(telefonoFijo) {
    var numeroTelefono;
    numeroTelefono= telefonoFijo;
  	var expresionRegular1=/^([0-9]+){7}$/;//<--- con esto vamos a validar el numero
  	var expresionRegular2=/\s/;//<--- con esto vamos a validar que no tenga espacios en blanco
 
  	if(numeroTelefono=='')
     	alertify.error('Campo es obligatorio.');
  	else if(expresionRegular2.test(numeroTelefono))
    	alertify.error('Error: el telefono fijo no debe tener espacios en blanco.');
    else if(!expresionRegular1.test(numeroTelefono))
        alertify.error('Error: el telefono fijo debe se compone de 7 números sin caracteres.');
    else
    	alertify.success("El número es correcto.");	
}

function validaTelefonoMovil(telefonoMovil) {
    var numeroTelefono;
    numeroTelefono= telefonoMovil;
  	var expresionRegular1=/^([0-9]+){10}$/;//<--- con esto vamos a validar el numero
  	var expresionRegular2=/\s/;//<--- con esto vamos a validar que no tenga espacios en blanco 
  	if(numeroTelefono=='')
     	alertify.error('Campo es obligatorio.');
  	else if(expresionRegular2.test(numeroTelefono))
      alertify.error('Error: el telefono movil no debe tener espacios en blanco.');
    else if(!expresionRegular1.test(numeroTelefono))
        alertify.error('Error: el telefono movil debe se compone de 10 números sin caracteres.');
    else
    	alertify.success("El número es correcto.");	
}

function validarEmailCliente(correo){ 	
	var email = correo;
	expresion = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if ( !expresion.test(email) ){
		alertify.error("El email no es correcto.");	
	  	return false;
	}
	else{
		alertify.success("El email es correcto.");	
	}
}

function validarCodigoPostal(codigoPostal) {
    var codigoPostalValido;
    codigoPostalValido= codigoPostal;
    var expresionRegular1=/^([0-9]+){5}$/;//<--- con esto vamos a validar el numero
    var expresionRegular2=/\s/;//<--- con esto vamos a validar que no tenga espacios en blanco 
    if(codigoPostalValido==''){
        alertify.error('Campo es obligatorio.');
    }
    else if(expresionRegular2.test(codigoPostalValido)){
      alertify.error('Error: el codigo postal no debe tener espacios en blanco.');
    }
    else if(!expresionRegular1.test(codigoPostalValido)){
        alertify.error('Error: el codigo postal se compone de 5 números sin caracteres.');
    }
    else{
        alertify.success("El codigo postal  es correcto."); 
    }
}

function validaTelefonoEncargado(telefono) {
    var numeroTelefono;
    numeroTelefono= telefono;
    var expresionRegular1=/^([0-9]+){7,10}$/;//<--- con esto vamos a validar el numero
    
    var expresionRegular2=/\s/;//<--- con esto vamos a validar que no tenga espacios en blanco
 
    if(numeroTelefono=='')
        alertify.error('Campo es obligatorio.');
    else if(expresionRegular2.test(numeroTelefono))
        alertify.error('Error: el telefono fijo no debe tener espacios en blanco.');
    else if(!expresionRegular1.test(numeroTelefono))
        alertify.error('Error: el telefono tiene un minimo de 7 y un maximo de 10 numeros sin caracteres.');    
    else
        alertify.success("El número es correcto."); 
}

function validarCliente(){
    var rfc = document.getElementById("rfc").value;    
    var rfcCorrecto;
    rfcCorrecto = rfc;   
    if (rfc.length == 13){
        var rfcValido = '^(([A-Z]|[a-z]|\s){1})(([A-Z]|[a-z]){3})([0-9]{6})((([A-Z]|[a-z]|[0-9]){3}))';
    } else{
        var rfcValido = '^(([A-Z]|[a-z]){3})([0-9]{6})((([A-Z]|[a-z]|[0-9]){3}))';
    }
    var validRfc = new RegExp(rfcValido);
    var matchArray = rfcCorrecto.match(validRfc);
    if (matchArray == null) {
        alertify.error('RFC incorrecto verifica tus datos.');
        return false;
    }      

    var email = document.getElementById("email").value;
    var emailCorrecto;
    emailCorrecto = email;
    expresion = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!expresion.test(emailCorrecto) ){
		alertify.error("El email no es correcto.");	
	  	return false;
	}

    var numeroTelefonoFijo = document.getElementById("telefonofijo").value;
    var numeroTelefonoFijoCorrecto;
    numeroTelefonoFijoCorrecto  = numeroTelefonoFijo;
    var expresionRegular1=/^([0-9]+){7}$/;//<--- con esto vamos a validar el numero
    var expresionRegular2=/\s/;//<--- con esto vamos a validar que no tenga espacios en blanco
 
    if(numeroTelefonoFijoCorrecto==''){
        alertify.error('Campo es obligatorio.');
        return false        
    }
    else if(expresionRegular2.test(numeroTelefonoFijoCorrecto)){
        alertify.error('Error: el telefono fijo no debe tener espacios en blanco.');
        return false        
    }
    else if(!expresionRegular1.test(numeroTelefonoFijoCorrecto)){        
        alertify.error('Error: el telefono fijo debe se compone de 7 números sin caracteres.');      
        return false
    }

    var numeroTelefonoMovil = document.getElementById("telefonoCelular").value;
    var numeroTelefonoMovilCorrecto;
    numeroTelefonoMovilCorrecto = numeroTelefonoMovil;
    var expresionRegular3=/^([0-9]+){10}$/;//<--- con esto vamos a validar el numero
    var expresionRegular4=/\s/;//<--- con esto vamos a validar que no tenga espacios en blanco 
    if(numeroTelefonoMovil==''){
        alertify.error('Campo es obligatorio.');
        return false        
    }
    else if(expresionRegular4.test(numeroTelefonoMovilCorrecto)){
        alertify.error('Error: el telefono movil no debe tener espacios en blanco.');
        return false        
    }
    else if(!expresionRegular3.test(numeroTelefonoMovilCorrecto)){
        alertify.error('Error: el telefono movil debe se compone de 10 números sin caracteres.');
        return false        
    }
        
}

function validarSucursal(){
    var codigoPostalValido = document.getElementById("codigoPostal").value;
    var expresionRegular1=/^([0-9]+){5}$/;//<--- con esto vamos a validar el numero
    var expresionRegular2=/\s/;//<--- con esto vamos a validar que no tenga espacios en blanco 
    if(codigoPostalValido==''){
        alertify.error('Campo es obligatorio.');
        return false
    }
    else if(expresionRegular2.test(codigoPostalValido)){ 
        alertify.error('Error: el codigo postal no debe tener espacios en blanco.');
        return false
    }
    else if(!expresionRegular1.test(codigoPostalValido)){
        alertify.error('Error: el codigo postal se compone de 5 números sin caracteres.');
        return false
    }

    var numeroTelefonoFijo = document.getElementById("telefono").value;
    var expresionRegular1=/^([0-9]+){7}$/;//<--- con esto vamos a validar el numero
    var expresionRegular2=/\s/;//<--- con esto vamos a validar que no tenga espacios en blanco
 
    if(numeroTelefonoFijo==''){        
        alertify.error('Campo es obligatorio.');
        return false
    }
    else if(expresionRegular2.test(numeroTelefonoFijo)){
        alertify.error('Error: el telefono fijo no debe tener espacios en blanco.');
        return false        
    }
    else if(!expresionRegular1.test(numeroTelefonoFijo)){
        alertify.error('Error: el telefono fijo debe se compone de 7 números sin caracteres.');      
        return false        
    }
}

function validarEncargado(){
    var numeroTelefono = document.getElementById("telefono").value;
    var expresionRegular1=/^([0-9]+){7}$/;//<--- con esto vamos a validar el numero
    var expresionRegular2=/\s/;//<--- con esto vamos a validar que no tenga espacios en blanco
 
    if(numeroTelefono==''){        
        alertify.error('Campo es obligatorio.');
        return false
    }
    else if(expresionRegular2.test(numeroTelefono)){
        alertify.error('Error: el telefono fijo no debe tener espacios en blanco.');
        return false        
    }
    else if(!expresionRegular1.test(numeroTelefono)){
        alertify.error('Error: el telefono fijo debe se compone de 7 números sin caracteres.');      
        return false        
    }

    var email = document.getElementById("email").value;
    var emailCorrecto;
    emailCorrecto = email;
    expresion = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!expresion.test(emailCorrecto) ){
        alertify.error("El email no es correcto."); 
        return false;
    }
}

/*
Función que recibe id de riesgo y muestra modal con datos obtenidos del servidor
*/
function showModalRiesgo(idRiesgo){
    var formData = new FormData();
    var uri=CONTEXT_ROOT+"/proyecto/createRiesgo";
    if(idRiesgo!==undefined){
      formData.append('idRiesgo',idRiesgo);
      uri=CONTEXT_ROOT+"/cliente/edit";
    }
    $.ajax({
        url: uri,
        data: formData,
        processData: false,
        contentType: false,
        type: 'POST',        
        success: function (data,textStatus) {
            $("#formRiesgo").html(data);
            $("#modalRiesgo").modal('show');
        },
        error: function(XMLHttpRequest,textStatus,errorThrown){
            if(idRiesgo!==undefined){
              alertify.error("Ocurrió un error durante la actualización de riesgo");
            }else{
              alertify.error("Ocurrió un error durante la creación de riesgo");
            }
        }
    });
}