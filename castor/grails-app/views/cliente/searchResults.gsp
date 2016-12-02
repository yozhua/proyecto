<%@ page import="com.castor.seguridad.*" %>
<%@ page import="com.castor.cliente.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bitacora.label', default: 'Bitacora')}" />        
        <title><g:message code="Lista clientes." /></title>
    </head>
<body class="sign-in-up">
    <g:set var="username" value="${sec?.username()}" />
    <g:set var="nombreUser" value="${User.findByUsername(username)?.username}" />
    <g:set var="id" value="${User.findByUsername(username)?.id}" />    
    <div id="page-wrapper">
        <div class="graphs">
           <h3>Resultados</h3>
            <div class="xs tabls">
                <div class="bs-example4" data-example-id="contextual-table">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Nombre comercial.</th>
                                <th>RFC.</th>
                                <th>Tipo persona.</th>
                                <th>Nombre / Razón social.</th>
                                <th>Estatus.</th>
                                <th>Opciones.</th>
                            </tr>
                        </thead> 
                        <tbody>                       
                            <g:each in="${listaClientes}">     
                                <tr>
                                    <td>${it.nombreComercial}</td>
                                    <td>${it.rfc}</td>
                                    <td>${it?.tipoPersona?.nombre}</td>  
                                    <td>
                                        <g:if test="${"Persona física" == it?.tipoPersona?.nombre}"> 
                                            ${it.apellidoPaterno+" "+it.apellidoMaterno +" "+it.nombrePersona}
                                        </g:if>             
                                        <g:else>                        
                                            ${it.razonSocial}
                                        </g:else>                                    
                                    <td>
                                        <g:if test="${true == it.estatus}"> 
                                            Activado
                                        </g:if>             
                                        <g:elseif test="${false == it.estatus}">                        
                                            Desactivado
                                        </g:elseif>    
                                    </td>                                    
                                    <td>
                                        <g:form resource="${this.cliente}" method="DELETE">
                                            <div class="btn-group" >
                                                <g:set var="identificador" value="${it.id}" /> 
                                                <g:hiddenField name="id" value="${it.id}" />
                                                <g:link controller="cliente" action="desactivar" class="btn btn-default" title="Activar/Desactivar." value="${it.id}" resource="${this.cliente}">
                                                    <i class="fa fa-user-times fa-fl" aria-hidden="true"></i>
                                                </g:link>
                                                <g:link controller="cliente" action="show" class="btn btn-default" title="Visualizar/Mostrar." value="${it?.id}" url="/cliente/show/${identificador}" resource="${this.cliente}">
                                                    <i class="fa fa-list fa-fl" aria-hidden="true"></i>
                                                </g:link>
                                                <g:link controller="cliente" action="edit" class="btn btn-primary" title="Modificar/Editar." value="${it.id}" url="/cliente/edit/${identificador}" resource="${this.cliente}">
                                                    <i class="fa fa-pencil fa-fl" aria-hidden="true"></i>
                                                </g:link>
                                                <g:link class="btn btn-danger" title="Borrar/Eliminar." value="${it.id}" resource="${this.cliente}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                                    <i class="fa fa-trash-o fa-fl" aria-hidden="true"></i>
                                                </g:link>                                                
                                            </div>                                        
                                        </g:form>
                                    </td>
                                </tr>
                            </g:each>     
                        </tbody>
                    </table>
                    <div class="pagination">
                        <g:paginate total="${listaClientesCount ?: 0}" />
                    </div>
               </div>
            </div>   
        </div> 
    </div>   
</body>
</html>			
