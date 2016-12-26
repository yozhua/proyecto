function Cliente(){}
var cliente = new Cliente();

function obtenerParametros(){
  var formData = new FormData();
  cliente.nombreComercial = document.getElementsByName("nombreComercial")[0].value;
  cliente.tipoPersona = document.getElementsByName("tipoPersona")[0].value;
  cliente.tipoCliente = document.getElementsByName("tipoCliente")[0].value;
  cliente.nombrePersona = document.getElementsByName("nombrePersona")[0].value;
  cliente.apellidoPaterno = document.getElementsByName("apellidoPaterno")[0].value;
  cliente.apellidoMaterno = document.getElementsByName("apellidoMaterno")[0].value;
  cliente.razonSocial = document.getElementsByName("razonSocial")[0].value;
  cliente.rfc = document.getElementsByName("rfc")[0].value;
  cliente.email = document.getElementsByName("email")[0].value;
  cliente.telefonofijo = document.getElementsByName("telefonofijo")[0].value;
  cliente.telefonoCelular = document.getElementsByName("telefonoCelular")[0].value;
  console.log(cliente);
  guardarCliente();
}

function guardarCliente(){
  var formData = new FormData();
  formData.append('cliente',JSON.stringify(cliente));
  uri = CONTEXT_ROOT+"/cliente/save"
  $.ajax({
      url: uri,
      data: formData,
      processData: false,
      contentType: false,
      type: 'POST',
      success: function () {
        console.log("datos guardados");        
      },
      error: function(data,textStatus,errorThrown){
        if(data.responseJSON.message===undefined){
          console.error("Hubo un error.");
        }else{
          console.error(data.responseJSON.message);
        }
        return false;
      }
  });
}
