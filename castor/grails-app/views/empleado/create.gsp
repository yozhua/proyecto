
<%@ page import="com.castor.seguridad.User"%>
<%@ page import="com.castor.seguridad.Role"%>
<%@ page import="com.castor.seguridad.UserRole"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:javascript src="skycons.js"/>        
        <asset:javascript src="parsley.js"/>
        <g:set var="entityName" value="${message(code: 'empleado.label', default: 'Empleado')}" />
        <title><g:message code="Crear empleado." /></title>
    </head>
    <body>
        <div id="create-empleado" class="content scaffold-create" role="main">            
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.empleado}">
              <ul class="errors" role="alert">
                  <g:eachError bean="${this.empleado}" var="error">
                  <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                  </g:eachError>
              </ul>
            </g:hasErrors><br><br>
            <h1 align="center">Registrar empleado.</h1><br>            
            <form id="form" data-parsley-priority-enabled="">
                <fieldset class="form-horizontal">
                  <div class="panel-body panel-body-inputin">
                    <div class="bs-example5">

                        <h3 class ="blank1"><g:message code="Usuario" /></h3>
                        <br>

                      <div class="form-group">
                				<label class="col-md-2 control-label">Usuario</label>
                				<div class="col-md-3">
                					<div class="input-group input-group1">
                						<input type="text" id="username" name="username" class="form-control1" placeholder="Usuario" onblur="usuarioBuscar(this.value)" required>
                            <span class="input-group-addon">
                							<i class="fa fa-user"></i>                              
                						</span>
                					</div>
                				</div>
                        <label class="col-md-2 control-label">Role:</label>
                            <div class="col-md-3">
                                <div class="input-group input-group1">                           
                                    <g:select 
                                              name="role" value=""
                                              class="form-control1"
                                              noSelection="${['null':'Selecciona...']}"
                                              from="${Role.where{authority!='ROLE_CLIENTE'}.list()}"
                                              optionValue="authority"
                                              optionKey="id"   
                                              required=""
                                              />
                                </div>
                            </div>
                        </div>
                      <div class="form-group">
                				<label class="col-md-2 control-label">Correo Electronico</label>
                				<div class="col-md-3">
                					<div class="input-group input-group1">
                						<input type="email" id="email" name="email" class="form-control1"  placeholder="Correo Electronico" onblur="emailVerificar(this.value)" required>
                            <span class="input-group-addon">
                							<i class="fa fa-envelope-o"></i>
                						</span>
                					</div>
                				</div>

                			</div>

                      <div class="form-group">
                				<label class="col-md-2 control-label">Contraseña</label>
                				<div class="col-md-3">
                					<div class="input-group input-group1">
                						<input type="password" id="password1" name="password" class="form-control1" placeholder="Contraseña" required>
                            <span class="input-group-addon">
                							<i class="fa fa-lock"></i>
                						</span>
                					</div>
                				</div>
                				<div class="clearfix"> </div>
                			</div>

                      <div class="form-group">
                				<label class="col-md-2 control-label">Confirme Contraseña</label>
                				<div class="col-md-3">
                					<div class="input-group input-group1">
                						<input type="password" id="password2" class="form-control1" placeholder="Confirme Contraseña" onblur= paswordsIguales() required>
                            <span class="input-group-addon">
                							<i class="fa fa-lock"></i>
                						</span>
                					</div>
                				</div>
                				<div class="clearfix"> </div>
                			</div>

                    </div>
                  </div>

                  <div class="panel-body panel-body-inputin">
                    <div class="bs-example5">
                      <h3 class = "blank1">Datos Empleado</h3>

                      <div class="form-group">
                        <label class="col-md-2 control-label" for="nombre">Nombre*</label>
                        <div class="col-md-4" >
                          <input type="text" name="nombre" class="form-control1" value="${empleado?.nombre}" required/>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-md-2 control-label" for="apellidoPaterno">Apellido Paterno*</label>
                        <div class="col-md-4" >
                          <input type="text" name="apellidoPaterno" class="form-control1" value="${empleado?.apellidoPaterno}" required/>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-md-2 control-label" for="apellido_materno">Apellido Materno</label>
                        <div class="col-md-4" >
                          <input type="text" name="apellidoMaterno" class="form-control1" value="${empleado?.apellidoMaterno}"/>
                        </div>

                      </div>

                      <div class="form-group">
                        <label class="col-md-2 control-label" for="telefono">Telefono*</label>
                        <div class="col-md-4">
                          <div class="input-group input-group1">
                            <input type="text" name="telefono" class="form-control1" value="${empleado?.telefono}" required/>
                            <span class="input-group-addon">
                							<i class="fa fa-phone"></i>
                						</span>
                          </div>
                        </div>
                      </div>

                    </div>
                  </div>

                  <div class="panel-body panel-body-inputin">
                    <div class="bs-example5">
                      <h3 class = "blank1">Contacto</h2>

                      <div class="form-group">
                        <label class="col-md-2 control-label" for="nombreContacto">Nombre*</label>
                        <div class="col-md-4">
                          <input type="text" name="nombreContacto" class="form-control1" value="${empleado?.nombreContacto}" placeholder="Nombre(s) y Apellidos"required/>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-md-2 control-label" for="telefonoContacto">Telefono*</label>
                        <div class="col-md-4">
                          <div class="input-group input-group1">
                            <input type="text" name="telefonoContacto" class="form-control1" value="${empleado?.telefonoContacto}" required/>
                            <span class="input-group-addon">
                							<i class="fa fa-phone"></i>
                						</span>
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-md-2 control-label" for="relacionContacto">Relacion*</label>
                        <div class="col-md-4">
                          <input type="text" name="relacionContacto" class="form-control1" value="${empleado?.relacionContacto}" required/>
                        </div>
                      </div>
                    </div>
                  </div>


                </fieldset>
                <fieldset class="buttons">
                  <label class="col-md-2"></label>
                  <g:link controller="domicilioEmpleado" action="create">
                  <input type="submit"
                    class="btn btn_5 btn-lg btn-primary validate"
                    onmouseover="this.value='Domicilio';
                    "onmouseout="this.value='Continuar';"
                    value="Continuar"
                    href="domicilioEmpleado/create"></input></g:link>

                    <br>
                    <br><br>
                    <br>
                </fieldset>
            </form>
            <script type="text/javascript">
            $(function () {
              $('#form').parsley().on('form:validated', function(formInstance) {
                if(formInstance.isValid()){
                  guardar();
                }
              })
              .on('form:submit', function() {
                return false;
              });
            });
            </script>
        </div>
    </body>
</html>
