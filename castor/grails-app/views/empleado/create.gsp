
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
            <form id="form" data-parsley-priority-enabled="" class="form">
                <fieldset class="form-horizontal">

                  <div class= "form-section show">
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
                                                  noSelection="${['':'Selecciona un ROL']}"
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
                    </div>

                    <div class= "form-section hidden">

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
                    </div>


                    <div class= "form-section hidden">
                    <div class="panel-body panel-body-inputin">
                      <div class="bs-example5">

                          <h3 class ="blank1">Domicilio</h3>
                        <div class="form-group">
                          <label class="col-md-2 control-label"for="calle">Calle*</label>
                          <div class="col-md-3" >
                            <input type="text" class="form-control1" name="calle" value="${domicilio?.calle}" required/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-md-2 control-label"for="numeroExterior">Numero Exterior*</label>
                          <div class="col-md-2" >
                            <input type="text" class="form-control1" name="numeroExterior" value="${domicilio?.numeroExterior}" required/>
                          </div>

                          <label class="col-md-1 control-label"for="numeroInterior">Numero Interior</label>
                          <div class="col-md-2" >
                            <input type="text" class="form-control1" name="numeroInterior" value="${domicilio?.numeroInterior}"/>
                          </div>
                        </div>

                        <div class="form-group">
                          <label class="col-md-2 control-label"for="pais">Pais*</label>
                          <div class="col-md-2" >
                            <input type="text"  class="form-control1" name="pais" value="México" required/>
                          </div>

                          <label class="col-md-1 control-label"for="estado">Estado*</label>
                          <div class="col-md-2" >
                            <input type="text" class="form-control1" name="estado" value="${domicilio?.estado}" required/>
                          </div>
                        </div>

                        <div class="form-group">
                          <label class="col-md-2 control-label"for="municipio">Municipio*</label>
                          <div class="col-md-3" >
                            <input type="text" class="form-control1" name="municipio" value="${domicilio?.municipio}" required/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-md-2 control-label"for="ciudad">Ciudad*</label>
                          <div class="col-md-3" >
                            <input type="text" class="form-control1" name="ciudad" value="${domicilio?.ciudad}" required/>
                          </div>
                        </div>

                        <div class="form-group">
                          <label class="col-md-2 control-label"for="colonia">Colonia*</label>
                          <div class="col-md-3" >
                            <input type="text" class="form-control1" name="colonia" value="${domicilio?.colonia}" required/>
                          </div>

                          <label class="col-md-1 control-label"for="codigoPostal">Codigo Postal*</label>
                          <div class="col-md-1" >
                            <input type="text"  class="form-control1" name="codigoPostal" value="${domicilio?.codigoPostal}" data-parsley-length="[, 5]" required/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="col-md-2 control-label"for="referencias">Referencias</label>
                          <g:textArea name="referencias" value="${domicilio?.referencias}"rows="5" cols="40"/>
                        </div>
                      </div>
                    </div>
                    </div>

                    <div class="form-navigation">
                      <label class="col-md-1"></label>
                      <button type="button" class="previous btn btn_5 btn-lg btn-info ">&lt; Anterior</button>
                      <button type="button" class="cancelar btn btn btn_5 btn-lg btn-danger " onclick=cancelar()>Cancelar</button>
                      <button type="button" class="next btn btn btn_5 btn-lg btn-info pull-right">Siguiente &gt;</button>
                      <input class="btn btn_5 btn-lg btn-danger pull-right" id ="terminar"type="submit">
                      <span class="clearfix"></span>
                    </div>


                  </div>
                </fieldset>
            </form>
            <asset:javascript src="parsleyeventos.js" type="text/javascript"/>
            <script type="text/javascript">
            $(function () {
              $('#form').parsley().on('form:validated', function(formInstance) {
                if(formInstance.isValid()){

                }
              })
              .on('form:success',function() {

              })
              .on('form:submit', function() {
                guardar();
                alertify.success('LOS DATOS SE HAN GUARDADO CORRECTAMENTE');
                //formInstance.reset();
                return false;
              });
            });
            </script>
        </div>
    </body>
</html>
