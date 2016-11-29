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


//Función que autocompleta los posibles resultados para la búsqueda de un ciente
$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "/cliente/getAllClientes",
        dataType: "json",
        success : function(response) {
            //Creo un mapa con el nombre de la empresa y su ID
            var data =
                $.map(response, function(item){
                  console.log("id: " + item.id);
                  console.log("name: " + item.nombreComercial);
                    return{
                        id: item.id,
                        value: item.nombreComercial
                    }
                });
            $("#searchCliente").autocomplete({
                source: data,
                select: function (event, ui){
                console.log("ID seleccionado:" + ui.item.id);
                    console.log("Nombre:" + ui.item.value);
                    $('#clienteID').val(ui.item.id);
                }
            });
        }
    }); 
});

//Función que autocompleta los posibles resultados para la búsqueda de una sucursal
$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "/sucursal/getAllSucursales",
        dataType: "json",
        success : function(response) {
            //Creo un mapa con el nombre de la empresa y su ID
            var data =
                $.map(response, function(item){
                  console.log("id: " + item.id);
                  console.log("name: " + item.nombre);
                    return{
                        id: item.id,
                        value: item.nombre
                    }
                }); 
            $("#searchSucursal").autocomplete({
                source: data,
                select: function (event, ui){
                    console.log("ID seleccionado:" + ui.item.id);
                    console.log("Nombre:" + ui.item.value);
                    $('#sucursalID').val(ui.item.id);
                }
            }); 
        }
    }); 
});

//Función que autocompleta los posibles resultados para la búsqueda de un encargado con autorizacion
$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "/encargado/getAllQuienAutoriza",
        dataType: "json",
        success : function(response) {
            //Creo un mapa con el nombre de la empresa y su ID
            var data =
                $.map(response, function(item){
                  console.log("ID: " + item.id);
                  console.log("nombre: " + item.nombre);
                  console.log("apMaterno: " + item.apellidoMaterno);
                  console.log("apPaterno: " + item.apellidoPaterno);
                  console.log("completo: " + item.apellidoPaterno+" "+item.apellidoMaterno +" "+item.nombre);
                    return{
                        id: item.id,
                        value: item.apellidoPaterno +" "+ item.apellidoMaterno +" "+ item.nombre
                    }
                }); 
            $("#searchQuienAutoriza").autocomplete({
                source: data,
                select: function (event, ui){
                    console.log("ID seleccionado:" + ui.item.id);
                    console.log("Nombre:" + ui.item.value);
                    $('#quienAutorizaID').val(ui.item.id);
                }
            }); 
        }
    }); 
});


//Función que autocompleta los posibles resultados para la búsqueda de un encargado sin autorizacion
$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: "/encargado/getAllEncargado",
        dataType: "json",
        success : function(response) {
            //Creo un mapa con el nombre de la empresa y su ID
            var data =
                $.map(response, function(item){                
                  console.log("ID: " + item.id);
                  console.log("nombre: " + item.nombre);
                  console.log("apMaterno: " + item.apellidoMaterno);
                  console.log("apPaterno: " + item.apellidoPaterno);
                  console.log("completo: " + item.apellidoPaterno+" "+item.apellidoMaterno +" "+item.nombre);
                    return{
                        id: item.id,
                        value: item.apellidoPaterno +" "+ item.apellidoMaterno +" "+ item.nombre
                    }
                }); 
            $("#searchQuienSolicita").autocomplete({
                source: data,
                select: function (event, ui){
                    console.log("ID seleccionado:" + ui.item.id);
                    console.log("Nombre:" + ui.item.value);
                    $('#quienSolicitaID').val(ui.item.id);
                }
            }); 
        }
    }); 
});

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
