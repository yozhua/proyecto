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
        <title><g:message code="Buscar cliente." /></title>
    </head>
<body class="sign-in-up">
    <section>        
            <b><h1 align="center"> Busqueda de clientes.</h1></b>
            <div class="panel-body panel-body-inputin">                            
                <g:form resource="${this.cliente}" action='busquedaCliente' class="form-horizontal">
                    <div class="bs-example5">
                    <legend><h4>Criterios de busqueda.</h4></legend>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre comercial:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="nombreComercial" id="nombreComercial" placeholder="Buscar ..." value="${nombreComercial}" />
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>RFC:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <g:textField type="text" class="form-control1" name="rfc" id="rfc" placeholder="Buscar ..." value="${rfc}" style="text-transform:uppercase;"  onChange="validaRFC(this.value)"/>
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Tipo cliente:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <g:select name="tipoCliente"
                                        class="form-control1"
                                        noSelection="${['':'Selecciona']}"
                                        from="${TipoCliente.list()}"
                                        value="${com?.castor?.cliente?.tipoCliente?.nombre}"
                                        optionValue="nombre"
                                        optionKey="id" />
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Tipo persona:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <g:select name="tipoPersona"
                                        class="form-control1"
                                        noSelection="${['':'Selecciona']}"
                                        from="${TipoPersona.list()}"
                                        value="${com?.castor?.cliente?.tipoPersona?.nombre}"
                                        optionValue="nombre"
                                        optionKey="id" />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Apellido paterno:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="apellidoPaterno" id="apellidoPaterno" value="${apellidoPaterno}" placeholder="Buscar ..." />
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Apellido materno:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                   <g:textField type="text" class="form-control1" name="apellidoMaterno" id="apellidoMaterno" value="${apellidoMaterno}" placeholder="Buscar ..." />
                                    <span class="input-group-addon"x>
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre(s):</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="nombrePersona" id="nombrePersona" value="${nombrePersona}" placeholder="Buscar ..." />
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Estatus:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <select class="form-control1" name="estatus" id="estatus" >
                                        <option value="TRUE">Activos</option>
                                        <option value="FALSE">Desactivados</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Razón social:</b></label>
                            <div class="col-md-8">
                                <div class="input-group input-group1">
                                    <g:textArea placeholder="describe la razón social..."  cols="100" rows="2" name="razonSocial" id="razonSocial" value="${razonSocial}"/>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-2">
                                <button class="btn-primary btn "type="submit">Buscar.</button>
                                <button class="btn-danger btn"  type="button" onclick=cancelar()>Cancelar</button>
                            </div>
                        </div>
                    </div>                                        
                </g:form> 
            </div>     
        </div>
    </section>  
    </body>
</html>
