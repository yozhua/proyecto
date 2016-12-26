function Empleado(){}
function DomicilioEmpleado(){}
function User(){}
function UserRole(){}

var empleado = new Empleado();
var domicilioEmpleado = new DomicilioEmpleado();
var user = new User();
var userrole = new UserRole();

function guardarDatos(){
  var formData = new FormData();
  console.log(user);

  user.username = document.getElementsByName("username")[0].value;
  user.email = document.getElementsByName("email")[0].value;
  //user.password = document.getElementsByName("password")[0].value;
  //empleado = document.getElementsByName("empleados")[0].value;
  console.log(empleado);

  empleado.nombre = document.getElementsByName("nombre")[0].value;
  empleado.apellidoPaterno = document.getElementsByName("apellidoPaterno")[0].value;
  empleado.apellidoMaterno = document.getElementsByName("apellidoMaterno")[0].value;
  empleado.telefono = document.getElementsByName("telefono")[0].value;
  empleado.nombreContacto = document.getElementsByName("nombreContacto")[0].value;
  empleado.telefonoContacto = document.getElementsByName("telefonoContacto")[0].value;
  empleado.relacionContacto = document.getElementsByName("relacionContacto")[0].value;
  console.log(empleado);

  domicilioEmpleado.calle = document.getElementsByName("calle")[0].value;
  domicilioEmpleado.numeroExterior =  document.getElementsByName("numeroExterior")[0].value;
  domicilioEmpleado.numeroInterior =  document.getElementsByName("numeroInterior")[0].value;
  domicilioEmpleado.pais =  document.getElementsByName("pais")[0].value;
  domicilioEmpleado.estado =  document.getElementsByName("estado")[0].value;
  domicilioEmpleado.municipio =  document.getElementsByName("municipio")[0].value;
  domicilioEmpleado.ciudad =  document.getElementsByName("ciudad")[0].value;
  domicilioEmpleado.colonia =  document.getElementsByName("colonia")[0].value;
  domicilioEmpleado.codigoPostal =  document.getElementsByName("codigoPostal")[0].value;
  domicilioEmpleado.referencias =  document.getElementsByName("referencias")[0].value;
  console.log(domicilioEmpleado);

  userrole.role = document.getElementsByName("role")[0].value;
  console.log(userrole);

  roles();
  actualizarDomicilio();
  actualizarEmp();
  actualizarUser();
}

function roles(){
  var formData = new FormData();
  formData.append('rol',userrole.role);
  uri=CONTEXT_ROOT+"/user/numeroRole"
  $.ajax({
      url: uri,
      data: formData,
      processData: false,
      contentType: false,
      type: 'POST',
      success: function (data) {
        userrole.role = data.id;
        console.log(userrole);
        actualizarUserRole();
      },

      error: function(data,textStatus,errorThrown){
        if(data.responseJSON.message===undefined){
          console.error("Hubo un error.");
          alertify.error("Hubo un error.");
        }else{
          console.error(data.responseJSON.message);
          alertify.error(data.responseJSON.message);
        }
        return false;
      }
  });
}

function actualizarUser(){
  var formData = new FormData();

  formData.append('user',JSON.stringify(user));
  uri =CONTEXT_ROOT+"/user/update"
  $.ajax({
      url: uri,
      data: formData,
      processData: false,
      contentType: false,
      type: 'PUT',
      success: function () {
        //console.log(data);
        console.log("datos guardados");
        //empleadoG();
      },

      error: function(data,textStatus,errorThrown){
        if(data.responseJSON.message===undefined){
          console.error("Hubo un error.");
          alertify.error("Hubo un error.");
        }else{
          console.error(data.responseJSON.message);
          alertify.error(data.responseJSON.message);
        }
        return false;
      }
  });
}
function actualizarEmp(){
  var formData = new FormData();

  formData.append('empleado',JSON.stringify(empleado));
  uri =CONTEXT_ROOT+"/empleado/update"
  $.ajax({
      url: uri,
      data: formData,
      processData: false,
      contentType: false,
      type: 'PUT',
      success: function () {
        //console.log(data);
        console.log("datos guardados");

      },

      error: function(data,textStatus,errorThrown){
        if(data.responseJSON.message===undefined){
          console.error("Hubo un error.");
          alertify.error("Hubo un error.");
        }else{
          console.error(data.responseJSON.message);
          alertify.error(data.responseJSON.message);
        }
        return false;
      }
  });
}
function actualizarUserRole(){
  var formData = new FormData();
  console.log(userrole);

  formData.append('userrole',JSON.stringify(userrole));
  uri =CONTEXT_ROOT+"/userRole/update"
  $.ajax({
      url: uri,
      data: formData,
      processData: false,
      contentType: false,
      type: 'PUT',
      success: function () {
        //console.log(data);
        console.log("datos guardados");
      },

      error: function(data,textStatus,errorThrown){
        if(data.responseJSON.message===undefined){
          console.error("Hubo un error.");
          alertify.error("Hubo un error.");
        }else{
          console.error(data.responseJSON.message);
          alertify.error(data.responseJSON.message);
        }
        return false;
      }
  });
}

function actualizarDomicilio(){
  var formData = new FormData();
  console.log(domicilioEmpleado);

  formData.append('domicilioEmpleado',JSON.stringify(domicilioEmpleado));
  uri =CONTEXT_ROOT+"/domicilioEmpleado/update"
  $.ajax({
      url: uri,
      data: formData,
      processData: false,
      contentType: false,
      type: 'PUT',
      success: function () {
        //console.log(data);
        console.log("datos guardados");
      },

      error: function(data,textStatus,errorThrown){
        if(data.responseJSON.message===undefined){
          console.error("Hubo un error.");
          alertify.error("Hubo un error.");
        }else{
          console.error(data.responseJSON.message);
          alertify.error(data.responseJSON.message);
        }
        return false;
      }
  });
}
