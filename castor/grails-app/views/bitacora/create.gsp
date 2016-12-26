<%@ page import="com.castor.bitacora.TipoAsistencia" %>
<%@ page import="com.castor.bitacora.EstadoBitacora" %>
<%@ page import="com.castor.cliente.Cliente" %>
<%@ page import="com.castor.cliente.Sucursal" %>
<%@ page import="com.castor.encargado.Encargado" %>
<%@ page import="com.castor.empleado.Empleado" %>
<%@ page import="com.castor.seguridad.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:javascript src="reloj.js"/>
        <asset:stylesheet  src="select2.min.css" />
        <asset:javascript  src="select2.min.js" />
        <asset:javascript src="jquery-ui.js"/>     
        <asset:javascript src="jquery-ui.minS.js"/>
        <title><g:message code="Crear bitácora."/></title>
    </head>
<body class="sign-in-up">
    <g:set var="username" value="${sec?.username()}" />
    <g:set var="nombreUser" value="${User.findByUsername(username)?.username}" />
    <g:set var="id" value="${User.findByUsername(username)?.id}" />
    <section>
        <div id="create-bitacora" class="content scaffold-create" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.bitacora}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.bitacora}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors><br>
            <h1 align="center"> Bitacora.</h1><br>
            <div class="panel-body panel-body-inputin">            
                <form role="form" class="form-horizontal">                    
                    <div class="bs-example5">
                    <legend><h4>Información general</h4></legend>
                        <div class="form-group">                                                    
                            <label class="col-md-2 control-label"> Número de folio: </label>                            
                            <label class="control-label"> 34</label>                            
                            <div class="clearfix"></div>   
                            <label for="fecha" class="col-md-2 control-label"> Fecha: </label>
                            <label class="control-label">
                                <script type="text/JavaScript"> 
                                    var fecha= new Date(); 
                                    document.write(fecha.getDate() + "/" + 
                                                  (fecha.getMonth() +1) + "/" + 
                                                   fecha.getFullYear()); 
                                </script>
                            </label>
                            <div class="clearfix"></div>   
                            <label for="hora" class="col-md-2 control-label"> Hora: </label>
                            <label class="control-label"> 
                                <script type="text/JavaScript"> 
                                    var hora = new Date(); 
                                    document.write(hora.getHours() + ":" + 
                                                   hora.getMinutes()); 
                                </script>
                            </label>
                            <div class="clearfix"></div>   
                        </div>                        
                        <div class="form-group">
                            <label class="col-md-2 control-label">Nombre del cliente</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <input type="text" class="form-control1" id="searchCliente" value="" placeholder="Buscar ...">
                                    
                                    <g:hiddenField id="clienteID" name="clienteID" value="" />
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">Sucursal</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                     <input type="text" class="form-control1" id="searchSucursal" value="" placeholder="Buscar ...">
                                    
                                    <g:hiddenField id="sucursalID" name="sucursalID" value="" />
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>    
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Quien autoriza:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" id="searchQuienAutoriza" value="" placeholder="Buscar ...">
                                    <input type="hidden" id="quienAutorizaID" name="quienAutorizaID" value="" />

                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>    
                                </div>
                            </div>
                            <label class="col-md-2 control-label">Quien solicita:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" id="searchQuienSolicita" value="" placeholder="Buscar ...">
                                    <input type="hidden" id="quienSolicitaID" name="quienSolicitaID" value="" />
                                    <span class="input-group-addon"x>
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>                        
                        <div class="form-group">
                            <label class="col-md-2 control-label">Tipo de asistencia:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <g:select 
                                        name="tipoAsistencia"
                                        class="form-control1"
                                        noSelection="${['':'Selecciona']}"
                                        from="${TipoAsistencia.list()}"
                                        value="${com?.castor?.bitacora?.tipoAsistencia?.nombre}"
                                        optionValue="nombre"
                                        optionKey="id" />
                                </div>
                            </div>
                            <label class="col-md-2 control-label"></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <g:link controller='encargador' action='create'>Registrar nuevo encargado.</g:link>
                                </div>         
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>
                    <br>
                    <br>
                    <br>
                    <legend><h4>Información de la bitacora</h4></legend>
                    <div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"> Agente de soporte: </label>
                            <label class="control-label" id="username"> ${username} </label>
                             <label class="control-label">                                
                            </label>
                            <br>                            
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Estado de la bitacora:</label>
                            <div class="col-md-2">
                                <div class="input-group input-group1">                           
                                    <g:select 
                                        name="estadoBitacora"
                                        class="form-control1"
                                        from="${EstadoBitacora.list()}"
                                        value="${com?.castor?.bitacora?.estadoBitacora?.estado}"
                                        optionValue="estado"
                                        optionKey="id" />
                                </div>
                            </div>     
                            <label class="col-md-2 control-label">Tiempo de la bitacora:</label>                            
                            <div class="col-md-1">
                                <div class="input-group input-group1" id="reloj">                           
                                    <label class="control-label" id="Horas">00</label>
                                    <label class="control-label" id="Minutos">:00</label>
                                    <label class="control-label" id="Segundos">:00</label> 
                                </div>
                            </div>
                            <div class="col-md-3">
                                <button type="button" class="btn-default btn" id="continuar" onclick="inicio();"><i class="fa fa-play-circle-o"></i> Iniciar.</button>
                                <button type="button" class="btn-default btn" id="detener" onclick="parar();"><i class="fa fa-stop-circle-o"></i> Detener.</button>
                            </div>
                            <div class="clearfix"> </div>
                        </div><br>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Problema: </label>
                            <div class="col-md-8">
                                <div class="input-group input-group1">                           
                                    <textarea placeholder="describe el problema..."  cols="100" rows="3" required=""></textarea>
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-md-2 control-label">Solución: </label>
                            <div class="col-md-6">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" placeholder="Buscar ...">
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Actividad: </label>
                            <div class="col-md-7">
                                <div class="input-group input-group1">                                                       
                                    <textarea id="nombre_actividad" placeholder="describe las actividades..."  cols="100" rows="2"></textarea>
                                </div>
                                <div class="input-group input-group1">                                                       
                                    <input id="bt_add" type="button" value="Agregar." id="btnAgregaActividad" name="btnAgregaActividad" class="col-md-2 btn-default btn" onSubmit="return validarTexto()" />    
                                </div>                                   
                            </div>   
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"> Lista de actividades: </label>
                            <div class="col-md-6 btn-group">
                                <div class="input-group input-group1">                           
                                    <table  id="tabla" class="table">
                                        <thead >
                                            <tr class="warning">
                                                <th>Num.</th>
                                                <th>Creador</th>
                                                <th>Actividad.</th>
                                                <th>Opciones</th>
                                            </tr>
                                        </thead>
                                        <tbody id="bodyActividadess"> 
                                        </tbody>
                                    </table>                                        
                                </div>
                                <div id="contenedorTabla"></div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>
                        <br>
                        <div class="form-group">
                        <label class="col-md-2 control-label">Tags:</label>                        
                            <div class="col-md-6">
                                <div class="input-group input-group1">                           
                                    <select type="text" id="tags" class="form-control1" name="tags" multiple="multiple" placeholder="Agrega tus tags aqui ..."></select>
                                    <script type="text/JavaScript">                                                        
                                        $('#tags').select2({
                                            data: ["DBMS","Nodrix","Servidores","Conexiones"],
                                            tags: true,
                                            tokenSeparators: [','],
                                            language: "es"
                                        });
                                    </script>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>                         
                        <div class="form-group">
                            <label class="col-md-2 control-label">Observaciones: </label>
                            <div class="col-md-8">
                                <div class="input-group input-group1">                           
                                    <textarea placeholder="describe el problema..."  cols="100" rows="3" required=""></textarea>
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div> 
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-2">
                                <button class="btn-primary btn">Guardar.</button>
                                <button class="btn-danger btn">Cancelar.</button>                                    
                            </div>
                        </div>
                    </div>                    
                    <br>
                </form>    
            </div>                         
        </div>
    </section>
    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ADMINISTRATIVO,ROLE_GERENCIA,ROLE_TECNICO">
    <script type="text/JavaScript">    
        //
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
    </script>
    </sec:ifAnyGranted>                
</body>
</html>
