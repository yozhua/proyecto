<%@ page import="com.castor.cliente.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:javascript src="jquery-2.2.0.min.js"/>
        <asset:javascript src="myjavascript.js"/>
        <asset:javascript src="clienteliente.js"/>
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="Registrar cliente." /></title>
    </head>
    <body>
    <section>
        <div id="create-cliente" class="content scaffold-create" role="main">
            <g:if test="${flash.message}">
               <g:javascript>
                    $( document ).ready(
                        function() {
                            var delay = alertify.get('notifier','delay');
                            alertify.set('notifier','delay', 13);
                            alertify.success("${flash.message}");
                            alertify.set('notifier','delay', delay);
                        }
                    );
                </g:javascript>
            </g:if>
            <g:if test="${flash.error}">
                <g:javascript>
                    $( document ).ready(
                        function() {
                            var delay = alertify.get('notifier','delay');
                            alertify.set('notifier','delay', 13);
                            alertify.error("${flash.error}");
                            alertify.set('notifier','delay', delay);
                        }
                    );
                </g:javascript>
            </g:if>                
            <g:hasErrors bean="${this.cliente}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.cliente}" var="error">
                        <g:javascript>
                            $( document ).ready(
                                function() {
                                    var delay = alertify.get('notifier','delay');
                                    alertify.set('notifier','delay', 13);
                                    alertify.error("${error}");
                                    alertify.set('notifier','delay', delay);
                                }
                            );
                        </g:javascript>
                    </g:eachError>
                </ul>
            </g:hasErrors>            
            <br>
            <b><h1 align="center"> Registrar cliente.</h1></b><br>
            <div class="panel-body panel-body-inputin">                            
                <fieldset class="form-horizontal">
                <g:form action="save" class="form" onSubmit="return validarCliente()">                 
                    <div class="bs-example5">
                    <legend> <b><h4>Información general</h4></b></legend>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre comercial:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="nombreComercial" id="nombreComercial" placeholder="..." value="${nombreComercial}" required=""  />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                       <div class="form-group">
                            <label class="col-md-2 control-label"><b>Tipo de cobertura:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                           
                                    <g:select
                                        noSelection="${['':'Selecciona']}"
                                        name="tipoCliente"
                                        required=""
                                        class="form-control1"
                                        from="${TipoCliente.list()}"
                                        value="${com?.castor?.cliente?.tipoCliente?.nombre}"
                                        optionValue="nombre"
                                        optionKey="id" />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Tipo de persona:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                           
                                    <script type="text/javascript">
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
                                    </script>
                                    <g:select
                                        required=""
                                        id="tipoPersona"
                                        name="tipoPersona"
                                        class="form-control1"
                                        noSelection="${['':'Selecciona']}"
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
                                <label class="col-md-2 control-label"><b>Apellido paterno:</b></label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">                           
                                        <g:textField type="text" class="form-control1" name="apellidoPaterno" id="apellidoPaterno" value="${apellidoPaterno}" placeholder="..." />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label"><b>Apellido materno:</b></label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">                           
                                       <g:textField type="text" class="form-control1" name="apellidoMaterno" id="apellidoMaterno" value="${apellidoMaterno}" placeholder="..." />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label"><b>Nombre(s):</b></label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">                           
                                        <g:textField type="text" class="form-control1" name="nombrePersona" id="nombrePersona" value="${nombrePersona}" placeholder="..." />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div id="personaMoral" style="display:;">
                            <div class="form-group">
                                <label class="col-md-2 control-label"><b>Razón social:</b></label>
                                <div class="col-md-6">
                                    <div class="input-group input-group1">                           
                                        <g:textArea placeholder="describe la razón social..." cols="55" rows="3"  name="razonSocial" id="razonSocial" value="${razonSocial}" />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        <div class="form-group">
                           <label class="col-md-2 control-label"><b>RFC:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                           
                                    <g:textField type="text" class="form-control1" name="rfc" id="rfc" placeholder="..." value="${rfc}" required="" style="text-transform:uppercase;" onChange="validaRFC(this.value)" maxlength="13"/>   
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Correo electronico:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                           
                                    <g:textField type="text" class="form-control1" name="email" id="email" placeholder="..." value="${email}" required="" onChange="validarEmailCliente(this.value)" />   
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Teléfono fijo:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                           
                                    <g:textField type="text" class="form-control1" name="telefonofijo" id="telefonofijo" placeholder="..." value="${telefonofijo}" required="" maxlength="7" onChange="validaTelefonoFijo(this.value)"/>   
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Telélefono movil:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                           
                                    <g:textField type="text" class="form-control1" name="telefonoCelular" id="telefonoCelular" placeholder="..." value="${telefonoCelular}" required="" maxlength="10" onChange="validaTelefonoMovil(this.value)"/>   
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-2">
                                <button class="btn-primary btn" type="submit">Guardar.</button>
                                <button class="btn-danger btn"  type="button" onclick=cancelar()>Cancelar</button>
                            </div>
                        </div>
                    </div>
                </g:form>
                </fieldset>                
            </div>
        </div>
    </section>
    </body>
</html>          