<%@ page import="com.castor.cliente.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bitacora.label', default: 'Bitacora')}" />        
        <title><g:message code="Lista sucursales." /></title>
    </head>
<body class="sign-in-up">
    <div id="page-wrapper">
        <div class="graphs">
           <h3>Resultados</h3>
            <div class="xs tabls">
                <div class="bs-example4" data-example-id="contextual-table">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nombre Sucursal.</th>
                                <th>Tipo sucursal.</th>
                                <th>Telefono.</th>
                                <th>Estatus.</th>
                                <th>Opciones.</th>
                            </tr>
                        </thead> 
                        <tbody>                       
                            <g:each in="${listaSucursales}">     
                                <tr>
                                    <td>${it.nombre}</td>                                    
                                    <td>${it?.tipoSucursal?.nombre}</td>  
                                    <td>${it?.telefono}</td>    
                                    <td>
                                        <g:if test="${true == it?.estatus}"> 
                                            Activado
                                        </g:if>             
                                        <g:elseif test="${false == it?.estatus}">                        
                                            Desactivado
                                        </g:elseif>    
                                    </td>                                    
                                    <td>
                                        <g:form resource="${this.sucursal}" method="DELETE">
                                            <div class="btn-group" >
                                                <g:set var="identificador" value="${it.id}" /> 
                                                <g:hiddenField name="id" value="${it.id}" />
                                                <g:link controller="sucursal" action="desactivar" class="btn btn-default" title="Activar/Desactivar." value="${it.id}" resource="${this.sucursal}">
                                                    <i class="fa fa-user-times fa-fl" aria-hidden="true"></i>
                                                </g:link>
                                                <g:link controller="sucursal" action="show" class="btn btn-default" title="Visualizar/Mostrar." value="${it?.id}" url="/sucursal/show/${identificador}" resource="${this.sucursal}">
                                                    <i class="fa fa-list fa-fl" aria-hidden="true"></i>
                                                </g:link>
                                                <g:link controller="sucursal" action="edit" class="btn btn-primary" title="Modificar/Editar." value="${it.id}" url="/sucursal/edit/${identificador}" resource="${this.sucursal}">
                                                    <i class="fa fa-pencil fa-fl" aria-hidden="true"></i>
                                                </g:link>                                                
                                            </div>                                        
                                        </g:form>
                                    </td>
                                </tr>
                            </g:each>     
                        </tbody>
                    </table>
                    <div class="pagination">
                        <g:paginate total="${listaSucursales}" />
                    </div>
               </div>
            </div>   
        </div> 
    </div>   
</body>
</html>			