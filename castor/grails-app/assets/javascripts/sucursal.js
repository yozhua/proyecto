function Sucursal(){}
var sucursal = new Sucursal();

function obtenerParametrosSucursal(){
  var formData = new FormData();
  sucursal.cliente = document.getElementsByName("cliente")[0].value;
  sucursal.nombre = document.getElementsByName("nombre")[0].value;
  sucursal.tipoSucursal = document.getElementsByName("tipoSucursal")[0].value;
  sucursal.telefono = document.getElementsByName("telefono")[0].value;
  sucursal.calle = document.getElementsByName("calle")[0].value;
  sucursal.numeroExterior = document.getElementsByName("numeroExterior")[0].value;
  sucursal.numeroInterior = document.getElementsByName("numeroInterior")[0].value;
  sucursal.colonia = document.getElementsByName("colonia")[0].value;
  sucursal.ciudad = document.getElementsByName("ciudad")[0].value;
  sucursal.municipio = document.getElementsByName("municipio")[0].value;
  sucursal.estado = document.getElementsByName("estado")[0].value;
  sucursal.pais = document.getElementsByName("pais")[0].value;
  sucursal.codigoPostal = document.getElementByName("codigoPostal")[0].value;
  sucursal.referencias = document.getElementByName("referencias")[0].value;
  console.log(cliente);
  guardarSucursal();
}


function guardarSucursal(){
  var formData = new FormData();
  formData.append('sucursal',JSON.stringify(sucursal));
  uri = CONTEXT_ROOT+"/sucursal/save"
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