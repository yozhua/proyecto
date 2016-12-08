<%@ page import="com.castor.cliente.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:javascript src="jquery-2.2.0.min.js"/>
        <asset:javascript src="myjavascript.js"/>
        <asset:javascript src="guardarCliente.js"/>
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="Registrar cliente." args="[entityName]" /></title>
    </head>
    <body>
    <section>
        <div id="create-cliente" class="content scaffold-create" role="main">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.cliente}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.cliente}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <br>
            <h1 align="center"> Registrar cliente.</h1><br>
            <div class="panel-body panel-body-inputin">
                <fieldset class="form">
                <g:form action="save" role="form" class="form-horizontal">
                    <div class="bs-example5">
                    <legend><h4>Información general</h4></legend>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Nombre comercial:</label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="nombreComercial" id="nombreComercial" placeholder="Buscar ..." value="${nombreComercial}" required=""  />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                       <div class="form-group">
                            <label class="col-md-2 control-label">Tipo de cobertura:</label>
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
                            <label class="col-md-2 control-label">Tipo de persona:</label>
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
                                        <g:textField type="text" class="form-control1" name="apellidoPaterno" id="apellidoPaterno" value="${apellidoPaterno}" placeholder="Buscar ..." />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Apellido materno:</label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">
                                       <g:textField type="text" class="form-control1" name="apellidoMaterno" id="apellidoMaterno" value="${apellidoMaterno}" placeholder="Buscar ..." />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label">Nombre(s):</label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">
                                        <g:textField type="text" class="form-control1" name="nombrePersona" id="nombrePersona" value="${nombrePersona}" placeholder="Buscar ..." />
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
                                        <g:textArea placeholder="describe la razón social..."  cols="100" rows="2" name="razonSocial" id="razonSocial" value="${razonSocial}" />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div class="form-group">
                           <label class="col-md-2 control-label">RFC:</label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="rfc" id="rfc" placeholder="Buscar ..." value="${rfc}" required="" onblur="validaRFC(this.value)"/>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Correo electronico:</label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="email" id="email" placeholder="Buscar ..." value="${email}" required="" onblur="validarEmail(this.value)" />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Teléfono fijo:</label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="telefonofijo" id="telefonofijo" placeholder="Buscar ..." value="${telefonofijo}" required="" maxlength="8"/>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">Telélefono movil:</label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="telefonoCelular" id="telefonoCelular" placeholder="Buscar ..." value="${telefonoCelular}" required="" maxlength="10"/>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-2">
                                <button class="btn-primary btn">Guardar.</button>
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
