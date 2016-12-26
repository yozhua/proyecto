<%@ page import="com.castor.cliente.TipoPersona" %>
<%@ page import="com.castor.cliente.TipoCliente" %>
<%@ page import="com.castor.seguridad.*" %>
<%@ page import="com.castor.cliente.Cliente" %>
<%@ page import="com.castor.cliente.Sucursal" %>
<%@ page import="com.castor.cliente.TipoSucursal" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bitacora.label', default: 'Bitacora')}" />        
        <title><g:message code="Buscar sucursal." /></title>
    </head>
<body class="sign-in-up">
    <section>    
            <h2 align="center"> Busqueda de sucursales.</h2>
            <div class="panel-body panel-body-inputin">            
                <g:form resource="${this.sucursal}" action='busquedaSucursal' class="form-horizontal">
                    <div class="bs-example5">
                    <legend><h4>Criterios de busqueda.</h4></legend>                              
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre empresa:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" id="cliente" value="" placeholder="Buscar ...">
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>    
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label"><b>Nombre sucursal:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" id="nombre" value="" placeholder="Buscar ...">
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>    
                                </div>
                            </div>
                            
                            <label class="col-md-2 control-label"><b>Tipo sucursal:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <g:select name="tipoSucursal"
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
                            <label class="col-md-2 control-label"><b>Telefono:</b></label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <input type="text" class="form-control1" id="telefono" value="" placeholder="Buscar ...">
                                    <span class="input-group-addon">
                                        <i class="fa fa-search"></i>
                                    </span>    
                                </div>
                            </div>
                            <label class="col-md-2 control-label"><b><b>Estatus:</b></b></label>
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
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-2">
                                <button class="btn-primary btn" type="submit">Buscar.</button>
                                <button class="btn-danger btn"  type="button" onclick=cancelar()>Cancelar</button>
                            </div>
                        </div>
                    <br>
                    </div>                                        
                </g:form>                
            </div>     
        </div>
    </section>
</body>
</html>
