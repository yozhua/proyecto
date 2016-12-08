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
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div id="edit-cliente" class="content scaffold-edit" role="main">
            <g:hasErrors bean="${this.cliente}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.cliente}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <br>
            <h1 align="center"> Actualizar cliente.</h1><br>
            <div class="panel-body panel-body-inputin">
                <fieldset class="form">
                <g:form resource="${this.cliente}" method="PUT" class="form-horizontal">
                <g:hiddenField name="version" value="${this.cliente?.version}" />
                    <div class="bs-example5">
                    <legend><h4>Información general</h4></legend>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Nombre comercial:</label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="nombreComercial" id="nombreComercial" placeholder="Buscar ..." value="${cliente?.nombreComercial}" required=""  />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                       <div class="form-group">
                            <label class="col-md-2 control-label">Tipo cliente:</label>
                            <div class="col-md-4">
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
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Tipo persona:</label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:javascript type="text/JavaScript">
                                        $(function() {
                                            $('#personaFisica').hide();
                                            $('#personaMoral').hide();
                                            $('#tipoPersona').change(function(){
                                                if($('#tipoPersona').val() == 1) {
                                                    $('#personaFisica').show();
                                                    $('#personaMoral').hide();
                                                }
                                                if($('#tipoPersona').val() == 2) {
                                                    $('#personaMoral').show();
                                                    $('#personaFisica').hide();
                                                }
                                                if($('#tipoPersona').val() == 'null') {
                                                    $('#personaFisica').hide();
                                                    $('#personaMoral').hide();
                                                }
                                            });
                                        });
                                    </g:javascript>
                                    <g:select
                                        id="tipoPersona"
                                        name="tipoPersona"
                                        class="form-control1"
                                        noSelection="${['null':'Selecciona']}"
                                        from="${TipoPersona.list()}"
                                        value="${com?.castor?.cliente?.tipoPersona?.nombre}"
                                        optionValue="nombre"
                                        optionKey="id"
                                        onChange="tipoPersona(this)"/>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div id="personaFisica" style="display:;">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Apellido paterno:</label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">
                                        <g:textField type="text" class="form-control1" name="apellidoPaterno" id="apellidoPaterno" value="${cliente?.apellidoPaterno}" placeholder="Buscar ..." />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Apellido materno:</label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">
                                       <g:textField type="text" class="form-control1" name="apellidoMaterno" id="apellidoMaterno" value="${cliente?.apellidoMaterno}" placeholder="Buscar ..." />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Nombre(s):</label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">
                                        <g:textField type="text" class="form-control1" name="nombrePersona" id="nombrePersona" value="${cliente?.nombrePersona}" placeholder="Buscar ..." />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div id="personaMoral" style="display:;">
                            <div class="form-group">
                                <label class="col-md-2 control-label">Razón social:: </label>
                                <div class="col-md-8">
                                    <div class="input-group input-group1">
                                        <g:textArea placeholder="describe la razón social..."  cols="100" rows="2" name="razonSocial" id="razonSocial" value="${cliente?.razonSocial}" />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div class="form-group">
                           <label class="col-md-2 control-label">RFC:</label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="rfc" id="rfc" placeholder="Buscar ..." value="${cliente?.rfc}" required="" onblur="validaRFC(this.value)"/>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Correo electronico:</label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="email" id="email" placeholder="Buscar ..." value="${cliente?.email}" required="" onblur="validarEmail(this.value)" />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Teléfono fijo:</label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="telefonofijo" id="telefonofijo" placeholder="Buscar ..." value="${cliente?.telefonofijo}" required="" maxlength="8"/>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Telélefono movil:</label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="telefonoCelular" id="telefonoCelular" placeholder="Buscar ..." value="${cliente?.telefonoCelular}" required="" maxlength="10"/>
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
                    </div>
                </g:form>
            </div>
        </div>
    </section>
    </body>
</html>
