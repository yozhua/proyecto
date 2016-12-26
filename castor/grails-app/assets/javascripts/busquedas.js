function Empleado(){}
function DomicilioEmpleado(){}
function User(){}
function UserRole(){}

var empleado = new Empleado();
var domicilioEmpleado = new DomicilioEmpleado();
var user = new User();
var userrole = new UserRole();
var lineascont=1;

function busqueda(){
  empleado.nombre = document.getElementsByName("nombre")[0].value;
  empleado.apellidoPaterno = document.getElementsByName("apellidoPaterno")[0].value;
  empleado.apellidoMaterno = document.getElementsByName("apellidoMaterno")[0].value;
  empleado.estatus = document.getElementsByName("estatus")[0].value;
  var formData = new FormData();

  formData.append('empleado',JSON.stringify(empleado));
  uri =CONTEXT_ROOT+"/empleado/busca"
  $.ajax({
      url: uri,
      data: formData,
      processData: false,
      contentType: false,
      type: 'POST',
      success: function (data) {
        datosTabla(data);
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

//datos de la tabla
function datosTabla(data){
  console.log(data);
  var table =document.getElementById("tabla-resultados");
  var linea,columna1,columna2,columna3,columna4,botones;

  for (var i = 0; i < data.length; i++) {
    linea = table.insertRow(lineascont);
    columna1 = linea.insertCell(0);
    columna2 = linea.insertCell(1);
    columna3 = linea.insertCell(2);
    columna4 = linea.insertCell(3);

    columna1.innerHTML = data[i].id;
    columna2.innerHTML = data[i].nombre;
    if(data[i].estatus){
      columna3.innerHTML = "Activado";
    }else {
      columna3.innerHTML = " ";
    }
    console.log(empleado);
    //empleado = Empleado.parse(data[i]);
    console.log(empleado);
    botones='<a href="/empleado/edit/'+data[i].id+'"><intup id="bt_edit" type="button" value="Editar" class="btn btn-primary" aria-label="Editar"><i class="fa fa-pencil-square-o fa-fl" aria-hidden="true"></i></intup></g:link>'
    botones +=" "+'<a href="/empleado/show/'+data[i].id+'"><intup id="bt_view" type="button" value="Vizualizar" class="btn btn-primary" aria-label="Vizualizar"><i class="fa fa-eye fa-fl" aria-hidden="true"></i></intup></a>'
    columna4.innerHTML = botones;
    lineascont +=1;
  }

}
