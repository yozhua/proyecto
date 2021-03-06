<%@ page import="com.castor.cliente.TipoPersona" %>
<%@ page import="com.castor.cliente.TipoCliente" %>
<%@ page import="com.castor.seguridad.*" %>
<%@ page import="com.castor.cliente.Cliente" %>
<%@ page import="com.castor.cliente.Sucursal" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:javascript src="jquery-2.2.0.min.js"/>
        <asset:javascript src="myjavascript.js"/>
        <asset:javascript src="guardarCliente.js"/>
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="Editar cliente." /></title>
    </head>
    <body>        
        <div id="edit-cliente" class="content scaffold-edit" role="main">                        
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
            <h1 align="center"> Actualizar cliente.</h1><br>
            <div class="panel-body panel-body-inputin">            
                <g:form resource="${this.cliente}" method="PUT" class="form-horizontal" onSubmit="return validarCliente()"> 
                <g:hiddenField name="version" value="${this.cliente?.version}" />
                    <div class="bs-example5">
                    <legend><h4>Información general</h4></legend>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre comercial:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                    <g:textField type="text" class="form-control1" name="nombreComercial" id="nombreComercial" placeholder="..." value="${cliente?.nombreComercial}" required=""  />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                       <div class="form-group">
                            <label class="col-md-2 control-label"><b>Tipo cliente:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                           
                                    <g:select 
                                        id="tipoCliente"
                                        name="tipoCliente"
                                        required=""
                                        value=""
                                        class="form-control1"
                                        noSelection="${['':'Selecciona']}"
                                        from="${TipoCliente.list()}"
                                        value ="${cliente?.tipoCliente?.id}"
                                        optionValue="nombre"
                                        optionKey="id" />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Tipo persona:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">
                                <g:select 
                                        id="tipoPersona"
                                        name="tipoPersona"
                                        required="" 
                                        value=""
                                        class="form-control1"
                                        noSelection="${['':'Selecciona']}"
                                        from="${TipoPersona.list()}"
                                        value ="${cliente?.tipoPersona?.id}"
                                        optionValue="nombre"
                                        optionKey="id"
                                        onChange="tipoPersona(this)"/>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>                        
                        <g:if test="${"Persona física" == cliente?.tipoPersona?.nombre}"> 
                                    <script type="text/JavaScript"> 
                                        $(function() {                                                     
                                            $('#tipoPersona').change(function(){
                                                if($('#tipoPersona').val() == 1) {
                                                    $('#personaFisica').show(); 
                                                    $('#personaMoral').hide()                                                     
                                                }
                                                if($('#tipoPersona').val() == 2) {
                                                    $('#personaMoral').show(); 
                                                    $('#personaFisica').hide();
                                                }                                            
                                            });
                                        });
                                    </script>
                        <div id="personaFisica" style="display:;">
                            <div class="form-group">
                                <label class="col-md-2 control-label"><b>Apellido paterno:</b></label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">                           
                                        <g:textField type="text" class="form-control1" name="apellidoPaterno" id="apellidoPaterno" value="${cliente?.apellidoPaterno}" placeholder="..." />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label"><b>Apellido materno:</b></label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">                           
                                       <g:textField type="text" class="form-control1" name="apellidoMaterno" id="apellidoMaterno" value="${cliente?.apellidoMaterno}" placeholder="..." />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label"><b>Nombre(s):</b></label>
                                <div class="col-md-4">
                                    <div class="input-group input-group1">                           
                                        <g:textField type="text" class="form-control1" name="nombrePersona" id="nombrePersona" value="${cliente?.nombrePersona}" placeholder="..." />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>                            
                        </div> 

                        </g:if>             
                        <g:else>
                        <div id="personaMoral" style="display:;">
                            <div class="form-group">
                                <label class="col-md-2 control-label"><b>Razón social:</b></label>
                                <div class="col-md-6">
                                    <div class="input-group input-group1">                           
                                        <g:textArea placeholder="describe la razón social..." cols="48" rows="3"  name="razonSocial" id="razonSocial" value="${razonSocial}" />
                                    </div>
                                </div>
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                        </g:else>
                        <div class="form-group">
                           <label class="col-md-2 control-label"><b>RFC:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                           
                                    <g:textField type="text" class="form-control1" name="rfc" id="rfc" placeholder="..." value="${cliente?.rfc}" required="" style="text-transform:uppercase;" onChange="validaRFC(this.value)" maxlength="13"/>   
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Correo electronico:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                           
                                    <g:textField type="text" class="form-control1" name="email" id="email" placeholder="..." value="${cliente?.email}" required="" onChange="validarEmailCliente(this.value)" />   
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Teléfono fijo:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                           
                                    <g:textField type="text" class="form-control1" name="telefonofijo" id="telefonofijo" placeholder="..." value="${cliente?.telefonofijo}" required="" maxlength="7" onChange="validaTelefonoFijo(this.value)"/>   
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Telélefono movil:</b></label>
                            <div class="col-md-4">
                                <div class="input-group input-group1">                           
                                    <g:textField type="text" class="form-control1" name="telefonoCelular" id="telefonoCelular" placeholder="..." value="${cliente?.telefonoCelular}" required="" maxlength="10" onChange="validaTelefonoMovil(this.value)"/>   
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
            </div>
        </div>
    </section>
    </body>
</html>
