<%@ page import="com.castor.cliente.TipoPersona" %>
<%@ page import="com.castor.cliente.TipoCliente" %>
<%@ page import="com.castor.seguridad.*" %>
<%@ page import="com.castor.cliente.Cliente" %>
<%@ page import="com.castor.cliente.Sucursal" %>
<%@ page import="com.castor.bitacora.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:stylesheet src="jquery-ui.css"/>    
        <asset:javascript src="jquery-ui.js"/>
        <asset:javascript src="jquery-ui.min.js"/>
        <g:set var="entityName" value="${message(code: 'bitacora.label', default: 'Bitacora')}" />        
        <title><g:message code="Buscar cliente." /></title>
    </head>
<body class="sign-in-up">
    <g:set var="username" value="${sec?.username()}" />
    <g:set var="nombreUser" value="${User.findByUsername(username)?.username}" />
    <g:set var="id" value="${User.findByUsername(username)?.id}" />
    <g:set var="id_parseado" value="${id.toLong()}" />
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
            <h1 align="center"> Busqueda de clientes.</h1><br>
            <div class="panel-body panel-body-inputin">            
                <form role="form" class="form-horizontal">                    
                    <div class="bs-example5">
                    <legend><h4>Criterios de busqueda.</h4></legend>                              
                        <div class="form-group">
                            <label class="col-md-2 control-label">Folio:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <input type="text" class="form-control1" id="searchNombreComercial" value="" placeholder="Buscar ...">
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">Cliente:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" id="searchCliente" value="" placeholder="Buscar ...">
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>    
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Agente de soporte:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" id="searchAgenteSoporte" value="" placeholder="Buscar ...">
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>    
                                </div>
                            </div>
                             <label class="col-md-2 control-label">Estado de la bitacora:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <g:select name="estadoBitacora"
                                        class="form-control1"
                                        from="${EstadoBitacora.list()}"
                                        value="${com?.castor?.bitacora?.estadoBitacora?.estado}"
                                        optionValue="estado"
                                        optionKey="id" />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Fecha inicial:</label>
                            <div class="col-md-3">
                                <g:javascript type="text/JavaScript"> 
                                    $( function() {
                                        $( "#fechaInicial" ).datepicker({
                                            changeMonth: true,
                                            changeYear: true
                                        });
                                    } );
                                </g:javascript>
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" id="fechaInicial">
                                    <span class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </span>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">Fecha final:</label>
                            <div class="col-md-3">
                                <g:javascript type="text/JavaScript"> 
                                    $( function() {
                                        $( "#fechaFinal" ).datepicker({
                                            changeMonth: true,
                                            changeYear: true
                                        });
                                    } );
                                </g:javascript>
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" id="fechaFinal">
                                    <span class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>                                                
                        <div class="form-group">
                            <label class="col-md-2 control-label">Problema: </label>
                            <div class="col-md-8">
                                <div class="input-group input-group1">                           
                                    <textarea placeholder="describe la razón social..."  cols="100" rows="2" required=""></textarea>
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-md-2 control-label">Solució:: </label>
                            <div class="col-md-8">
                                <div class="input-group input-group1">                           
                                    <textarea placeholder="describe la razón social..."  cols="100" rows="2" required=""></textarea>
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-md-2 control-label">Tags: </label>
                            <div class="col-md-8">
                                <div class="input-group input-group1">                           
                                    <textarea placeholder="describe la razón social..."  cols="100" rows="2" required=""></textarea>
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div> <br>                
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-2">
                                <button class="btn-primary btn">Guardar.</button>
                                <button class="btn-danger btn">Cancelar.</button>                                    
                            </div>
                        </div>                        
                    </div>                                        
                </form>                
            </div>     
        </div>
    </section>
</body>
</html>
