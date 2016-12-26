<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:javascript src="validaciones.js"/>
        <asset:javascript src="cliente.js"/>
        <g:set var="entityName" value="${message(code: 'encargado.label', default: 'Encargado')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>       
        <div id="create-encargado" class="content scaffold-create" role="main">
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
            <g:hasErrors bean="${this.encargado}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.encargado}" var="error">
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
            <b><h1 align="center"> Registrar encargado.</h1></b><br>
            <div class="panel-body panel-body-inputin">                            
                <fieldset class="form-horizontal">
                <g:form action="save" class="form" onSubmit="return validarEncargado()">
                    <div class="bs-example5">
                    <legend><b><h4>Información usuario.</h4></b></legend>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre usuario:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <input type="text" class="form-control1" name="username" id="username" placeholder="..." value="${username}" required="" onblur="usuarioBuscar(this.value)" />
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>          
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Contraseña:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="password" class="form-control1" name="password1" id="password1"value="${password}" placeholder="..." required="" />
                                </div>
                            </div>                                                        
                            <label class="col-md-2 control-label"><b>Repetir contraseña:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                   <input type="password" class="form-control1" name="password2" id="password2" placeholder="..." required="" onblur= "paswordsIguales()"/>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>    
                    </div>
                    <br>          
                    <div class="bs-example5">
                    <legend><h4>Información del perfil.</h4></legend>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Apellido paterno:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="apellidoPaterno" id="apellidoPaterno"value="${apellidoPaterno}" placeholder="..." required="" />
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Apellido materno:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                   <input type="text" class="form-control1" name="apellidoMaterno" id="apellidoMaterno" value="${apellidoMaterno}" placeholder="..." />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre(s):</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="nombre" id="nombre" value="${nombre}" placeholder="..." required="" />
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Número de Teléfono:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="telefono" id="telefono" placeholder="..." value="${telefono}" required="" minlenght="7" maxlength="10" onChange="validaTelefonoEncargado(this.value)"/>   
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>                                                                                
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Correo electronico:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="email" id="email" placeholder="..." value="${email}" required="" onChange="validarEmailCliente(this.value)" onblur="emailVerificar(this.value)"/>   
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Posee autorizacion:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <g:radioGroup 
                                        required=""
                                        id="autorizacion"
                                        name="autorizacion"
                                        labels="['SI','NO']"
                                        values="[TRUE,FALSE]">
                                        <p>${it.label} ${it.radio}</p>
                                    </g:radioGroup>
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
    </body>
</html>
