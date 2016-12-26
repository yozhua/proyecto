<%@ page import="com.castor.cliente.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:javascript src="jquery-ui.js"/>     
        <asset:javascript src="jquery-ui.minS.js"/>
        <asset:javascript src="skycons.js"/>
        <asset:javascript src="parsley.js"/>       
        <asset:javascript src="sucursal.js"/>
        <g:set var="entityName" value="${message(code: 'sucursal.label', default: 'Sucursal')}" />
        <title><g:message code="Registrar sucursal." /></title>
    </head>
    <body>
        <div id="create-sucursal" class="content scaffold-create" role="main" id="form">          
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
            <h1 align="center"> Registrar sucursal.</h1><br>
            <div class="panel-body panel-body-inputin">                                                            
                <fieldset class="form-horizontal">
                <g:form action="save" class="form" onSubmit="return validarSucursal()">
                    <div class="bs-example5">
                    <legend><h4>Ingresa los siguientes datos.</h4></legend>  
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre Cliente:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <input type="text" class="form-control1" name="searchCliente" id="searchCliente" placeholder=" ..." required="" />                                    
                                    <g:hiddenField  name="cliente" id="cliente" value="${cliente}"/>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre Sucursal:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <input type="text" class="form-control1" name="nombre" id="nombre" placeholder=" ..." value="${nombre}" required="" />                                    
                                </div>
                            </div>
                             <label class="col-md-2 control-label"><b>Tipo de sucursal:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <g:select 
                                        required=""
                                        id="tipoSucursal"
                                        name="tipoSucursal"
                                        class="form-control1"
                                        noSelection="${['':'Selecciona']}"
                                        from="${TipoSucursal.list()}"
                                        value="${com?.castor?.cliente?.tipoSucursal?.nombre}"
                                        optionValue="nombre"
                                        optionKey="id" />
                                </div>                                 
                            </div>  
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Teléfono Fijo:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="telefono" id="telefono" value="${telefono}" placeholder=" ..." required="" maxlength="7" onChange="validaTelefonoFijo(this.value);"/>    
                                </div>
                            </div>                                                     
                            <label class="col-md-2 control-label"><b>Calle:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                   <input type="text" class="form-control1" name="calle" id="calle" value="${calle}" placeholder=" ..." required="" />
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>                            
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Número exterior:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="numeroExterior" id="numeroExterior" value="${numeroExterior}" placeholder=" ..." required="" />
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Número interior:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                   <input type="text" class="form-control1" name="numeroInterior" id="numeroInterior" value="${numeroInterior}" placeholder=" ..." />
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Colonia:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="colonia" id="colonia" value="${colonia}" placeholder="Colonia Centro" required="" />
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Ciudad:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                   <input type="text" class="form-control1" name="ciudad" id="ciudad" value="${ciudad}" placeholder="Oaxaca de Júarez" required="" />
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>     
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Municipio:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="municipio" id="municipio" value="${municipio}" placeholder="Oaxaca de Júarez" required="" />
                                </div>
                            </div> 
                            <label class="col-md-2 control-label"><b>Estado:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="estado" id="estado" value="${estado}" placeholder="Oaxaca" required="" />
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>                          
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Pais:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="pais" id="pais" value="${pais}" placeholder="México" required="" />
                                </div>
                            </div> 
                            <label class="col-md-2 control-label"><b>Codigo postal:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" name="codigoPostal" id="codigoPostal" value="${codigoPostal}" placeholder="70989" required="" maxlength="5" onChange="validarCodigoPostal(this.value);"/>
                                </div>
                            </div>
                            
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Referencias:</b></label>
                            <div class="col-md-8">
                                <div class="input-group input-group1">                           
                                    <g:textArea placeholder="Escribe las referencias..." class="form-control1" cols="100" rows="2" name="referencias" id="referencias" value="${referencias}" />
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

    <script type="text/JavaScript">    
        //
        $(document).ready(function() {
            $.ajax({
                type: "GET",
                url: "/cliente/getAllClientes",
                dataType: "json",
                success : function(response) {
                    //Creo un mapa con el nombre de la empresa y su ID
                    var data =
                        $.map(response, function(item){
                          console.log("id: " + item.id);
                          console.log("name: " + item.nombreComercial);
                            return{
                                id: item.id,
                                value: item.nombreComercial
                            }
                        });
                    $("#searchCliente").autocomplete({
                        source: data,
                        select: function (event, ui){
                            console.log("ID seleccionado:" + ui.item.id);
                            console.log("Nombre:" + ui.item.value);
                            $('#cliente').val(ui.item.id);
                        }
                    });
                }
            }); 
        });       
    </script>
    </body>
</html>
