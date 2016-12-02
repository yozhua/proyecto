function Empleado(){}
function User(){}
function UserRole(){}

var empleado = new Empleado();
var user = new User();
var userrole = new UserRole();

function usuarioBuscar(usuario){
  if(usuario !== null){
    var formData = new FormData();

    var uri=CONTEXT_ROOT+"/user/getUser";
    formData.append('username',usuario);
    $.ajax({
        url: uri,
        data: formData,
        processData: false,
        contentType: false,
        type: 'POST',
        success: function (data) {
          if (!data.disponible) {
            alertify.error('usuario no disponible');
            document.getElementById("username").focus();
          }
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
}

function emailVerificar(email){
  if(email !== null){
    var formData = new FormData();

    var uri=CONTEXT_ROOT+"/user/getEmail";
    formData.append('email',email);
    $.ajax({
        url: uri,
        data: formData,
        processData: false,
        contentType: false,
        type: 'POST',
        success: function (data) {
          if (data.disponible) {
            alertify.error('Email ya registrado');
            document.getElementById("email").focus();
          }
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
}
function paswordsIguales(){
  var pass1 = document.getElementById("password1").value;
  var pass2 = document.getElementById("password2").value;

  if (pass1 !== pass2) {
    alertify.error('Las Contraseñas NO Coinciden');
    document.getElementById("password1").value = "";
    document.getElementById("password1").focus();
    document.getElementById("password2").value = "";
  }else if (pass2 == "") {

  }else {
    alertify.success('Las Contraseñas Coinciden')
  }

}

function guardar(){
  var formData = new FormData();
  console.log(user);

  user.username = document.getElementsByName("username")[0].value;
  user.email = document.getElementsByName("email")[0].value;
  user.password = document.getElementsByName("password")[0].value;
  console.log(user);

  empleado.nombre = document.getElementsByName("nombre")[0].value;
  empleado.apellidoPaterno = document.getElementsByName("apellidoPaterno")[0].value;
  empleado.apellidoMaterno = document.getElementsByName("apellidoMaterno")[0].value;
  empleado.telefono = document.getElementsByName("telefono")[0].value;
  empleado.nombreContacto = document.getElementsByName("nombreContacto")[0].value;
  empleado.telefonoContacto = document.getElementsByName("telefonoContacto")[0].value;
  empleado.relacionContacto = document.getElementsByName("relacionContacto")[0].value;
  console.log(empleado);

  userrole.role = document.getElementsByName("role")[0].value;
  console.log(userrole);

  guardarUser();

}
function empleadoG(){
  var formData = new FormData();
  uri=CONTEXT_ROOT+"/user/numeroUser"
  $.ajax({
      url: uri,
      data: formData,
      processData: false,
      contentType: false,
      type: 'POST',
      success: function (data) {
        empleado.user =data.id;
        userrole.user = data.id;
        console.log(empleado);
        console.log(userrole);
        rol();
        guardarEmpleado();

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

function rol(){
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
        guardarUserRole();
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

function guardarUser(){
  var formData = new FormData();

  formData.append('user',JSON.stringify(user));
  uri =CONTEXT_ROOT+"/user/save"
  $.ajax({
      url: uri,
      data: formData,
      processData: false,
      contentType: false,
      type: 'POST',
      success: function () {
        //console.log(data);
        console.log("datos guardados");
        empleadoG();
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
function guardarEmpleado(){
  var formData = new FormData();

  formData.append('empleado',JSON.stringify(empleado));
  uri =CONTEXT_ROOT+"/empleado/save"
  $.ajax({
      url: uri,
      data: formData,
      processData: false,
      contentType: false,
      type: 'POST',
      success: function () {
        //console.log(data);
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
function guardarUserRole(){
  var formData = new FormData();
  console.log(userrole);

  formData.append('userrole',JSON.stringify(userrole));
  uri =CONTEXT_ROOT+"/userRole/save"
  $.ajax({
      url: uri,
      data: formData,
      processData: false,
      contentType: false,
      type: 'POST',
      success: function () {
        //console.log(data);
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
