<%@ page import="com.castor.bitacora.TipoAsistencia" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bitacora.label', default: 'Bitacora')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
<body class="sign-in-up">
    <section>
        <div id="create-bitacora" class="content scaffold-create" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.bitacora}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.bitacora}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <div id="page-wrapper" class="sign-in-wrapper">
                <div class="graphs">
                    <div class="sign-up">
                        <h3>Bitacora</h3>
                        <legend><h5>Encabezado de bitacora</h5></legend>
                        <div class="sign-u">
                            <div class="sign-up1">
                                <label for="folio"> Número de folio: </label>
                            </div>
                            <div class="sign-up2">
                                <form>
                                    <input type="text" placeholder=" " required=" "/>
                                </form>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="sign-u">
                            <div class="sign-up1">
                                <h4>Last Name* :</h4>
                            </div>
                            <div class="sign-up2">
                                <form>
                                    <input type="text" placeholder=" " required=" "/>
                                </form>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="sign-u">
                            <div class="sign-up1">
                                <h4>Email Address* :</h4>
                            </div>
                            <div class="sign-up2">
                                <form>
                                    <input type="text" placeholder=" " required=" "/>
                                </form>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
        
                
            <g:form action="save" aling="center">
                <fieldset class="form">
                    Informacion general
                    <div class="bloque-1">
                        <div>
                            <label for="folio"> Número de folio: </label>
                            <label for="numero-folio"> 12 </label>
                            <label for="fecha"> Fecha: </label>
                            <label for="fehca-actual"> ${date} </label>
                            <label for="hora"> Hora: </label>
                            <label for="hora-actual"> ${date} </label>
                        </div>
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'cliente', 'error')} required">
                            <label for="cliente"> Cliente: </label>
                            <span class="required-indicator">*</span>
                            <g:textField name="cliente" value="${bitacora?.cliente}" required=""  /><br>
                        </div>
                        
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'sucursal', 'error')} required">
                            <label for="sucursal"> Sucursal: </label>
                            <span class="required-indicator">*</span>
                            <g:textField name="sucursal" value="${bitacora?.sucursal}" required=""  /><br>
                        </div>
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'encargado', 'error')} required">
                             <label for="encargado"> Encargado: </label>
                        <span class="required-indicator">*</span>
                        <g:textField name="encargado" value="${bitacora?.encargado}" required=""  /><br>
                        </div>
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'quienReporta', 'error')} required">
                            <label for="quienReporta"> Quien reporta:</label>
                            <span class="required-indicator">*</span>
                            <g:textField name="quienReporta" value="${bitacora?.quienReporta}" required=""  /><br> 
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'tipoAsistencia', 'error')} required">
                            <label for="tipoAsistencia"> Tipo asistencia:</label>
                            <span class="required-indicator">*</span>
                            <g:select name="tipoAsistencia"
                                noSelection="${['null':'Selecciona']}"
                                from="${TipoAsistencia.list()}"
                                value="${com?.castor?.bitacora?.tipoAsistencia?.nombre}"
                                optionValue="nombre"
                                optionKey="id" />                                                        
                        </div>
                        <div>
                            <label for="folio"> Registrar encargado </label>
                        </div>
                    </div>
                    
                    Informacion de bitacora <br>      
                    <div>
                        <div>
                            <label for="empleado"> Agente de soporte: </label>
                            <label for="numero-folio"> Eduardo Hernandes Faku </label>
                            <label for="fecha"> reloj </label>
                            <label for="fehca-actual"> 00:00 </label>
                            <label for="hora"> pausar  </label>
                            <label for="hora-actual"> continuar </label>
                        </div>
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'problema', 'error')} required">
                            <label for="problema"> Problema: </label>
                            <span class="required-indicator">*</span>
                            <g:textArea name="problema" value="${bitacora?.problema}" required=""  /><br>
                        </div>
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'solucion', 'error')} required">
                             <label for="solucion"> Solucion: </label>
                            <span class="required-indicator">*</span>
                            <g:textField name="solucion" value="${bitacora?.solucion}" required=""  /><br>
                        </div>
                        <div>
                            <label for="actividad"> actividad:</label>
                            <span class="required-indicator">*</span>
                            <g:textField name="actividad" required=""  /><br> 
                            <input type="submit" id="agregarActividad" />
                        </div>                        
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'observaciones', 'error')} required">
                            <label for="observaciones"> Observaciones: </label>
                            <span class="required-indicator">*</span>
                            <g:textArea name="observaciones" value="${bitacora?.observaciones}" required=""  /><br>
                        </div>                        
                        <div class="fieldcontain ${hasErrors(bean: bitacoraInstance, field: 'tags', 'error')} required">
                            <label for="tags"> Tags:</label>
                            <span class="required-indicator">*</span>
                            <g:textField name="tags" value="${bitacora?.tags}" required=""  /><br> 
                        </div>                        
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </section>
</body>
</html>
