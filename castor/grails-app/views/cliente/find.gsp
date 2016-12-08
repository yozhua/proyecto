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
    <g:set var="username" value="${sec?.username()}" />
    <g:set var="nombreUser" value="${User.findByUsername(username)?.username}" />
    <g:set var="id" value="${User.findByUsername(username)?.id}" />
    <section>
            <h1 align="center"> Busqueda de clientes.</h1>
            <div class="panel-body panel-body-inputin">
                <g:form method="POST" controller='cliente' action='busquedaCliente' role="form" class="form-horizontal">
                    <div class="bs-example5">
                    <legend><h4>Criterios de busqueda.</h4></legend>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Nombre comercial:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="nombreComercial" id="nombreComercial" placeholder="Buscar ..." value="${nombreComercial}" />
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">RFC:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="rfc" id="rfc" placeholder="Buscar ..." value="${rfc}" />
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Tipo cliente:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <g:select name="tipoCliente"
                                        class="form-control1"
                                        noSelection="${['null':'Selecciona']}"
                                        from="${TipoCliente.list()}"
                                        value="${com?.castor?.cliente?.tipoCliente?.nombre}"
                                        optionValue="nombre"
                                        optionKey="id" />
                                </div>
                            </div>
                            <label class="col-md-2 control-label">Tipo persona:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <g:select name="tipoPersona"
                                        class="form-control1"
                                        noSelection="${['null':'Selecciona']}"
                                        from="${TipoPersona.list()}"
                                        value="${com?.castor?.cliente?.tipoPersona?.nombre}"
                                        optionValue="nombre"
                                        optionKey="id" />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Apellido paterno:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="apellidoPaterno" id="apellidoPaterno" value="${apellidoPaterno}" placeholder="Buscar ..." />
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">Apellido materno:</label>
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
                            <label class="col-md-2 control-label">Nombre(s):</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="nombrePersona" id="nombrePersona" value="${nombrePersona}" placeholder="Buscar ..." />
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <label class="col-md-2 control-label">Estatus:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <select class="form-control1" name="estatus" id="estatus">
                                        <option value="TRUE">Activos</option>
                                        <option value="FALSE">Desactivados</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Razón social:: </label>
                            <div class="col-md-8">
                                <div class="input-group input-group1">
                                    <g:textArea placeholder="describe la razón social..."  cols="100" rows="2" name="razonSocial" id="razonSocial" value="${razonSocial}"/>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-2">
                                <button class="btn-primary btn">Buscar.</button>
                                <button type="button" class="cancelar btn btn btn_5 btn-lg btn-danger " onclick=cancelar()>Cancelar</button>
                            </div>
                        </div>
                    <br>
                    </div>
                </g:form>
                <br>
                <h3>Resultados</h3>
                <div class="xs tabls">
                    <div class="bs-example4" data-example-id="contextual-table">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Nombre comercial.</th>
                                    <th>RFC.</th>
                                    <th>Tipo persona.</th>
                                    <th>Nombre / Razón social.</th>
                                    <th>Estatus.</th>
                                    <th>Opciones.</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:each  in="${listaClientes}">
                                    <tr>
                                        <td>${it.nombreComercial}</td>
                                        <td>${it.rfc}</td>
                                        <td>${it?.tipoPersona?.nombre}</td>
                                        <td>${it.apellidoPaterno+" "+it.apellidoMaterno +" "+it.nombrePersona}</td>
                                        <td>${it.estatus}</td>
                                        <td>
                                            <g:form resource="${this.cliente}">
                                                <div class="btn-group" >
                                                    <g:hiddenField name="id" value="${it.id}" />
                                                    <g:link controller="cliente" action="show" class="btn btn-default" title="Visualizar/Mostrar." value="${it?.id}" resource="${this.cliente}">
                                                        <i class="fa fa-list fa-fl" aria-hidden="true"></i>
                                                    </g:link>
                                                    <g:link controller="cliente" action="edit" class="btn btn-primary" title="Modificar/Editar." value="${it.id}"url="/cliente/edit" resource="${this.cliente}">
                                                        <i class="fa fa-pencil fa-fl" aria-hidden="true"></i>
                                                    </g:link>
                                                    <g:link controller="cliente" action="delete" class="btn btn-danger" title="Borrar/Eliminar." value="${it.id}" resource="${this.cliente}">
                                                        <i class="fa fa-trash-o fa-fl" aria-hidden="true"></i>
                                                    </g:link>
                                                    <g:link controller="cliente" action="desactivar" class="btn btn-default" title="Activar/Desactivar." value="${it.id}" resource="${this.cliente}">
                                                        <i class="fa fa-user-times fa-fl" aria-hidden="true"></i>
                                                    </g:link>
                                                </div>
                                            </g:form>
                                        </td>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                   </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
