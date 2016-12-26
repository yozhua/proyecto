<%@ page import="com.castor.cliente.Cliente" %>
<%@ page import="com.castor.cliente.Sucursal" %>
<%@ page import="com.castor.cliente.TipoSucursal" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:javascript src="myjavascript.js"/>        
        <asset:javascript src="jquery-ui.js"/>     
        <asset:javascript src="jquery-ui.minS.js"/>
        <asset:javascript src="skycons.js"/>
        <asset:javascript src="parsley.js"/>       
        <asset:javascript src="sucursal.js"/>
        <g:set var="entityName" value="${message(code: 'sucursal.label', default: 'Sucursal')}" />
        <title><g:message code="Editar sucursal." /></title>
    </head>
    <body>  
    <section>
        <div id="edit-sucursal" class="content scaffold-edit" role="main">
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
            <g:hasErrors bean="${this.sucursal}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.sucursal}" var="error">
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
            <h1 align="center">Editar sucursal.</h1><br>
            <div class="panel-body panel-body-inputin">                                            
                <g:form resource="${this.sucursal}" method="PUT" class="form-horizontal" onSubmit="return validarSucursal()">
                    <g:hiddenField name="version" value="${this.sucursal?.version}" />
                    <div class="bs-example5">
                    <legend><h4>Información general.</h4></legend>  
                        
                       <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre Sucursal:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <input type="text" class="form-control1" name="nombre" id="nombre" placeholder="..." value="${sucursal?.nombre}" required="" />                                    
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Tipo de sucursal:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <g:select 
                                        id="tipo"
                                        name="tipoSucursal"
                                        required=""
                                        class="form-control1"
                                        noSelection="${['':'Selecciona']}"
                                        from="${TipoSucursal.list()}"
                                        value ="${sucursal?.tipoSucursal?.id}"
                                        optionValue="nombre"
                                        optionKey="id" />
                                </div>                                 
                            </div>                     
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Teléfono:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="telefono" id="telefono" value="${sucursal?.telefono}" placeholder="..." maxlength="7" onChange="validaTelefonoFijo(this.value);"/>    
                                </div>
                            </div>       
                            <label class="col-md-2 control-label"><b>Calle:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                   <input type="text" class="form-control1" name="calle" id="calle" value="${sucursal?.calle}" placeholder="..." required="" />
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>                            
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Número exterior:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="numeroExterior" id="numeroExterior" value="${sucursal?.numeroExterior}" placeholder="..." required="" />
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Número interior:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                   <input type="text" class="form-control1" name="numeroInterior" id="numeroInterior" value="${sucursal?.numeroInterior}" placeholder="..." />
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Colonia:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="colonia" id="colonia" value="${sucursal?.colonia}" placeholder="..." required="" />
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Ciudad:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                   <input type="text" class="form-control1" name="ciudad" id="ciudad" value="${sucursal?.ciudad}" placeholder="..." required="" />
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>   
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Municipio:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="municipio" id="municipio" value="${sucursal?.municipio}" placeholder="..." required="" />
                                </div>
                            </div> 
                            <label class="col-md-2 control-label"><b>Estado:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="estado" id="estado" value="${sucursal?.estado}" placeholder="..." required="" />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>                          
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Pais:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="pais" id="pais" value="${sucursal?.pais}" placeholder="..." required="" />
                                </div>
                            </div> 
                            <label class="col-md-2 control-label"><b>Codigo postal:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="codigoPostal" id="codigoPostal" value="${sucursal?.codigoPostal}" =" ..." required="" maxlength="5" onChange="validarCodigoPostal(this.value);"/>
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Referencias:</b></label>
                            <div class="col-md-8">
                                <div class="input-group input-group1">                           
                                    <g:textArea placeholder="describe la razón social..." class="form-control1" cols="100" rows="3" name="referencias" id="referencias" value="${sucursal?.referencias}" />
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
