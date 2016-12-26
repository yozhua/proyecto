%@ page import="com.castor.cliente.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sucursal.label', default: 'Sucursal')}" />
        <title><g:message code="Visualizar sucursal." /></title>
    </head>
    <body>
        <div id="show-sucursal" class="content scaffold-show" role="main">
            <g:if test="${flash.message}">
                    <script>
                    $( document ).ready(
                        function() {
                            var delay = alertify.get('notifier','delay');
                            alertify.set('notifier','delay', 13);
                            alertify.success("${flash.message}");
                            alertify.set('notifier','delay', delay);
                        }
                    );
                </script>
            </g:if>                        
            <br>
            <h1 align="center">Visualizar sucursal.</h1><br>
            <div class="panel-body panel-body-inputin">                            
                <g:hiddenField name="version" value="${this.sucursal?.version}" />
                    <div class="bs-example5">
                    <legend><h4>Información general.</h4></legend>  
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre Cliente:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <p>${sucursal?.cliente?.nombreComercial}</p>
                                </div>
                            </div>                              
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre Sucursal:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <p>${sucursal?.nombre}</p>
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Tipo de sucursal:</b></label>
                            <div class="col-md-3">
                                    <p>${sucursal?.tipoSucursal?.nombre}</p>
                            </div>                     
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Teléfono:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <p>${sucursal?.telefono}</p>
                                </div>
                            </div>       
                            <label class="col-md-2 control-label"><b>Calle:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                <p>${sucursal?.calle}</p>
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>                            
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Número exterior:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <p>${sucursal?.numeroExterior}</p>
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Número interior:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <p>${sucursal?.numeroInterior}</p>
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Colonia:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <p>${sucursal?.colonia}</p>
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Ciudad:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <p>${sucursal?.ciudad}</p>
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div> 
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Municipio:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <p>${sucursal?.municipio}</p>
                                </div>
                            </div> 
                            <label class="col-md-2 control-label"><b>Estado:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <p>${sucursal?.estado}</p>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>                          
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Pais:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <p>${sucursal?.pais}</p>                                                               
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b>Codigo postal:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">
                                    <p>${sucursal?.pais}</p>                                                               
                                </div>
                            </div>                            
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Referencias:</b></label>
                            <div class="col-md-8">
                                <div class="input-group input-group1">
                                    <p>${sucursal?.referencias}</p>                                                               
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
