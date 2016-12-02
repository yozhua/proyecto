<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'domicilioEmpleado.label', default: 'DomicilioEmpleado')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-domicilioEmpleado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-domicilioEmpleado" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.domicilioEmpleado}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.domicilioEmpleado}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <form id="form" data-parsley-priority-enabled="">
                <fieldset class="form-horizontal">
                  <div class="panel-body panel-body-inputin">
                    <div class="bs-example5">

                        <h3 class ="blank1">Domicilio</h3>
                      <div class="form-group">
                        <label class="col-md-2 control-label"for="calle">Calle*</label>
                        <div class="col-md-4" >
                          <input type="text" value="${domicilio?.calle}" required/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-2 control-label"for="numeroExterior">Numero Exterior*</label>
                        <div class="col-md-4" >
                          <input type="text" value="${domicilio?.numeroExterior}" required/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-2 control-label"for="numeroInterior">Numero Interior</label>
                        <div class="col-md-4" >
                          <input type="text" value="${domicilio?.numeroInterior}"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-2 control-label"for="pais">Pais*</label>
                        <div class="col-md-4" >
                          <input type="text"  value="México" required/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-2 control-label"for="estado">Estado*</label>
                        <div class="col-md-4" >
                          <input type="text" value="${domicilio?.estado}" required/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-2 control-label"for="municipio">Municipio*</label>
                        <div class="col-md-4" >
                          <input type="text" value="${domicilio?.municipio}" required/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-2 control-label"for="ciudad">Ciudad*</label>
                        <div class="col-md-4" >
                          <input type="text" value="${domicilio?.ciudad}" required/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-2 control-label"for="colonia">Colonia*</label>
                        <div class="col-md-4" >
                          <input type="text" value="${domicilio?.colonia}" required/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-2 control-label"for="codigoPostal">Codigo Postal*</label>
                        <div class="col-md-4" >
                          <input type="text"  value="${domicilio?.codigoPostal}" required/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-md-2 control-label"for="referencias">Referencias</label>
                        <g:textArea name="referencias" value="${domicilio?.referencias}"rows="5" cols="40"/>
                      </div>
                    </div>
                  </div>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </form>
        </div>
    </body>
</html>
