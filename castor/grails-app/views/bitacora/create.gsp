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
                                <g:javascript type="text/JavaScript"> 
                                    var fecha= new Date(); 
                                    document.write(fecha.getDate() + "/" + 
                                                  (fecha.getMonth() +1) + "/" + 
                                                   fecha.getFullYear()); 
                                </g:javascript>
                            </label>
                            <div class="clearfix"></div>   
                            <label for="hora" class="col-md-2 control-label"> Hora: </label>
                            <label class="control-label"> 
                                <g:javascript type="text/JavaScript"> 
                                    var hora = new Date(); 
                                    document.write(hora.getHours() + ":" + 
                                                   hora.getMinutes()); 
                                </g:javascript>
                            </label>
                            <div class="clearfix"></div>   
                        </div>                        
                        <div class="form-group">
                            <label class="col-md-2 control-label">Nombre del cliente</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <input type="text" class="form-control1" id="searchCliente" value="" placeholder="Buscar ...">
                                    <input type="hidden" id="clienteID" name="clienteID" value="" />
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">Sucursal</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                     <input type="text" class="form-control1" id="searchSucursal" value="" placeholder="Buscar ...">
                                    <input type="hidden" id="sucursalID" name="sucursalID" value="" />
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
                                        noSelection="${['null':'Selecciona']}"
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
                                <g:javascript type="text/JavaScript"> 
                                    
                                </g:javascript>
                            </label>

                            <br>                            
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Estado de la bitacora:</label>
                            <div class="col-md-2">
                                <div class="input-group input-group1">                           
                                    <g:select name="estadoBitacora"
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
                            <div class="col-md-8">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" placeholder="Buscar ...">
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Actividad: </label>
                            <div class="col-md-6">
                                <div class="input-group input-group1">                                                       
                                    <textarea id="nombre_actividad" placeholder="describe las actividades..."  cols="100" rows="2" required=""></textarea>
                                </div>
                                <div class="input-group input-group1">                                                       
                                    <input id="bt_add" type="button" value="Agregar." class="col-md-2 btn-default btn" onSubmit="return validarTexto()" />    
                                </div>                                   
                            </div>   
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"> Lista de actividades: </label>

                            <div class="col-md-8 btn-group">
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
                            <div class="col-md-8">
                                <div class="input-group input-group1">                           
                                    <textarea type="text" class="form-control1" placeholder="Buscar ..."></textarea>
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
            
            <br>
            <br>
            <br>
            <br>
            <br>
            <a class="btn btn-primary" href="#navigation-main" aria-label="Skip to main navigation">
              <i class="fa fa-pencil" aria-hidden="true"></i>
            </a>

            <a class="btn btn-danger" href="path/to/settings" aria-label="Delete">
              <i class="fa fa-trash-o" aria-hidden="true"></i>
            </a>


            <g:form action="save" aling="center" class="bs-example5">
                <fieldset class="form">
                    Informacion general
                    <div class="bloque-1">
                        
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'cliente', 'error')} required">
                            <label for="cliente"> Cliente: </label>
                            <span class="required-indicator">*</span>
                            <g:textField name="cliente" value="${bitacora?.cliente}" required=""  /><br>
                        </div>
                        
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'sucursal', 'error')} required">
                            <label for="sucursal"> Sucursal: </label>
                            <span class="required-indicator">*</span>
                            <g:textField name="sucursal" value="${bitacora?.sucursal}" required=""  /><br>
                        </div>
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'encargado', 'error')} required">
                             <label for="encargado"> Encargado: </label>
                        <span class="required-indicator">*</span>
                        <g:textField name="encargado" value="${bitacora?.encargado}" required=""  /><br>
                        </div>
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'quienReporta', 'error')} required">
                            <label for="quienReporta"> Quien reporta:</label>
                            <span class="required-indicator">*</span>
                            <g:textField name="quienReporta" value="${bitacora?.quienReporta}" required=""  /><br> 
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'tipoAsistencia', 'error')} required">
                            <label for="tipoAsistencia"> Tipo asistencia:</label>
                            <span class="required-indicator">*</span>
                            <g:select name="tipoAsistencia"
                                noSelection="${['null':'Selecciona']}"
                                from="${TipoAsistencia.list()}"
                                value="${com?.castor?.bitacora?.tipoAsistencia?.nombre}"
                                optionValue="nombre"
                                optionKey="id" />
                        </div>
                        <div>
                            <label for="folio"> Registrar encargado </label>
                        </div>
                    </div>
                    
                    Informacion de bitacora <br>      
                    <div>    
                        <div id="reloj">
                            <b><label for="empleado"> Agente de soporte: </label></b>
                            <label for="numero-folio"> Eduardo Hernandes Faku </label>
                            <b><label for="tiempo"> Tiempo de duracion: </label></b>
                            <div id="reloj">
                            <label id="Horas">00</label>
                            <label id="Minutos">:00</label>
                            <label id="Segundos">:00</label>        
                            <input type="button" class="boton" id="continuar" value="Continuar  &#9658;" onclick="inicio();">
                            <input type="button" class="boton" id="detener" value="Detener &#8718;" onclick="parar();">             
                        </div>              
                        </div>
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'problema', 'error')} required">
                            <label for="problema"> Problema: </label>
                            <span class="required-indicator">*</span>
                            <g:textArea name="problema" value="${bitacora?.problema}" required=""  /><br>
                        </div>
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'solucion', 'error')} required">
                             <label for="solucion"> Solucion: </label>
                            <span class="required-indicator">*</span>
                            <g:textField name="solucion" value="${bitacora?.solucion}" required=""  /><br>
                        </div>
                        <div>
                            <label for="actividad"> actividad:</label>
                            <span class="required-indicator">*</span>
                            <g:textField name="actividad" required=""  /><br> 
                            <input type="submit" id="agregarActividad" />
                        </div>                        
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'observaciones', 'error')} required">
                            <label for="observaciones"> Observaciones: </label>
                            <span class="required-indicator">*</span>
                            <g:textArea name="observaciones" value="${bitacora?.observaciones}" required=""  /><br>
                        </div>                        
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'tags', 'error')} required">
                            <label for="tags"> Tags:</label>
                            <span class="required-indicator">*</span>
                            <g:textField name="tags" value="${bitacora?.tags}" required=""  /><br> 
                        </div>                        
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>  
        </div>
    </section>
</body>
</html>
