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
	  	alertify.error("Los campos de la password no pueden quedar vacio.s");
	  	return false;
	}

	if (password != passwordConfirm) {		
	  	alertify.error("Las contraseñas deben coincidir.");
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