<%@ page import="com.castor.cliente.TipoPersona" %>
<%@ page import="com.castor.cliente.TipoCliente" %>
<%@ page import="com.castor.seguridad.*" %>
<%@ page import="com.castor.cliente.Cliente" %>
<%@ page import="com.castor.cliente.Sucursal" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="Visualizar cliente." /></title>
    </head>
    <body>
        <div id="show-cliente" class="content scaffold-show" role="main">           
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <br>
            <h1 align="center"> Datos del cliente.</h1><br>
            <div class="panel-body panel-body-inputin">            
                <fieldset class="form">
                <g:hiddenField name="version" value="${this.cliente?.version}" />
                    <div class="bs-example5">
                    <legend><h4>Información general</h4></legend>
                        <div class="form-group">
                           <label class="col-md-2 control-label"><b>Nombre comercial:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <p>${cliente?.nombreComercial}</p>                                    
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                           <label class="col-md-2 control-label"><b>Tipo poliza:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <p>${cliente?.tipoCliente?.nombre}</p>                                    
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                           <label class="col-md-2 control-label"><b>Tipo persona:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <p>${cliente?.tipoPersona?.nombre}</p>                                    
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>
                        <g:if test="${"Persona física" == cliente?.tipoPersona?.nombre}"> 
                            <div class="form-group">
                                <label class="col-md-2 control-label"><b>Apellido paterno:</b></label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">                           
                                        <p>${cliente?.apellidoPaterno}</p>                                        
                                    </div>
                                </div>                                
                                <div class="clearfix"> </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label"><b>Apellido materno:</b></label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">                           
                                        <p>${cliente?.apellidoMaterno}</p>                                          
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>                        
                            <div class="form-group">
                                <label class="col-md-2 control-label"><b>Nombre(s):</b></label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">  
                                        <p>${cliente?.nombrePersona}</p>                                        
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </g:if>             
                        <g:else>                        
                            <div class="form-group">
                                <label class="col-md-2 control-label"><b>Razón social:</b></label>
                                <div class="col-md-8">
                                    <div class="input-group input-group1">
                                        <p>${cliente?.razonSocial}</p>
                                    </div>
                                </div>                            
                                <div class="clearfix"> </div>
                            </div>  
                        </g:else>
                        <div class="form-group">
                           <label class="col-md-2 control-label"><b>RFC:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <p>${cliente?.rfc}</p>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>                                
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Correo electronico:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                           
                                    <p>${cliente?.email}</p>                                    
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Teléfono fijo:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1"> 
                                    <p>${cliente?.telefonofijo}</p>                                    
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Telélefono movil:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                    
                                    <p>${cliente?.telefonoCelular}</p>                                           
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>                        
                    </div>               
            </div>
        </div>
    </section>        
    </body>
</html>

          