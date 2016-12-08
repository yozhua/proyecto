<%@ page import="com.castor.cliente.TipoPersona" %>
<%@ page import="com.castor.cliente.TipoCliente" %>
<%@ page import="com.castor.seguridad.*" %>
<%@ page import="com.castor.cliente.Cliente" %>
<%@ page import="com.castor.cliente.Sucursal" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bitacora.label', default: 'Bitacora')}" />        
        <title><g:message code="Buscar empleado." /></title>
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
            </g:hasErrors><br><br>
            <h1 align="center"> Busqueda de empleado.</h1><br>
            <div class="panel-body panel-body-inputin">            
                <form role="form" class="form-horizontal">                    
                    <div class="bs-example5">
                    <legend><h4>Criterios de busqueda.</h4></legend>                              
                        <div class="form-group">
                            <label class="col-md-2 control-label">Apellido paterno:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" id="searchApellidoPaterno" value="" placeholder="Buscar ...">
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>    
                                </div>
                            </div>
                            <label class="col-md-2 control-label">Apellido materno:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" id="searchApellidoMaterno" value="" placeholder="Buscar ...">
                                    <span class="input-group-addon"x>
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>                        
                        <div class="form-group">
                            <label class="col-md-2 control-label">Nombre(s):</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" id="searchNombre" value="" placeholder="Buscar ...">
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>    
                                </div>
                            </div>
                            <label class="col-md-2 control-label">Estatus:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <select name="cliente"
                                        class="form-control1">
                                        <option value="null">Selecciona</option>
                                        <option value="true">Activo</option>
                                        <option value="false">Desactivado</option>                                        
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Autorización:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <select name="autorizacion"
                                        class="form-control1">
                                        <option value="null">Selecciona</option>
                                        <option value="true">Autorización</option>
                                        <option value="false">Sin autorización</option>                                        
                                    </select>
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
                    <br>
                    </div>                                        
                </form>                
            </div>     
        </div>
    </section>
</body>
</html>
