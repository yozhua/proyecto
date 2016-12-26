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
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="show-empleado" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:form resource="${this}" method="DELETE" data-parsley-priority-enabled="" class="form">
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
                                    <input type="text" value="${user?.username}" id="username" name="username" class="form-control1" placeholder="Usuario" >
                                    <span class="input-group-addon">
                                      <i class="fa fa-user"></i>
                                    </span>
                                  </div>
                                </div>
                                <label class="col-md-2 control-label">Role:</label>
                                    <div class="col-md-3">
                                        <div class="input-group input-group1">
                                            <input type="text" value="${rol?.authority}" id="rol" name="username" class="form-control1" placeholder="Usuario" >
                                        </div>
                                    </div>
                              </div>
                              <div class="form-group">
                                <label class="col-md-2 control-label">Correo Electronico</label>
                                <div class="col-md-3">
                                  <div class="input-group input-group1">
                                    <input type="email" id="email" value="${this?.user?.email}" name="email" class="form-control1"  placeholder="Correo Electronico"  >
                                    <span class="input-group-addon">
                                      <i class="fa fa-envelope-o"></i>
                                    </span>
                                  </div>
                                </div>
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
                                <input type="text" name="nombre" class="form-control1" value="${empleado?.nombre}" />
                              </div>
                            </div>

                            <div class="form-group">
                              <label class="col-md-2 control-label" for="apellidoPaterno">Apellido Paterno*</label>
                              <div class="col-md-4" >
                                <input type="text" name="apellidoPaterno" class="form-control1" value="${empleado?.apellidoPaterno}" />
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
                                  <input type="text" name="telefono" class="form-control1" value="${empleado?.telefono}" />
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
                                <input type="text" name="nombreContacto" class="form-control1" value="${empleado?.nombreContacto}" placeholder="Nombre(s) y Apellidos"/>
                              </div>
                            </div>

                            <div class="form-group">
                              <label class="col-md-2 control-label" for="telefonoContacto">Telefono*</label>
                              <div class="col-md-4">
                                <div class="input-group input-group1">
                                  <input type="text" name="telefonoContacto" class="form-control1" value="${empleado?.telefonoContacto}" />
                                  <span class="input-group-addon">
                                    <i class="fa fa-phone"></i>
                                  </span>
                                </div>
                              </div>
                            </div>

                            <div class="form-group">
                              <label class="col-md-2 control-label" for="relacionContacto">Relacion*</label>
                              <div class="col-md-4">
                                <input type="text" name="relacionContacto" class="form-control1" value="${empleado?.relacionContacto}" />
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
                              <input type="text" class="form-control1" name="calle" value="${domicilio?.calle}" />
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-2 control-label"for="numeroExterior">Numero Exterior*</label>
                            <div class="col-md-2" >
                              <input type="text" class="form-control1" name="numeroExterior" value="${domicilio?.numeroExterior}" />
                            </div>

                            <label class="col-md-1 control-label"for="numeroInterior">Numero Interior</label>
                            <div class="col-md-2" >
                              <input type="text" class="form-control1" name="numeroInterior" value="${domicilio?.numeroInterior}"/>
                            </div>
                          </div>

                          <div class="form-group">
                            <label class="col-md-2 control-label"for="pais">Pais*</label>
                            <div class="col-md-2" >
                              <input type="text"  class="form-control1" name="pais" value="México" />
                            </div>

                            <label class="col-md-1 control-label"for="estado">Estado*</label>
                            <div class="col-md-2" >
                              <input type="text" class="form-control1" name="estado" value="${domicilio?.estado}" />
                            </div>
                          </div>

                          <div class="form-group">
                            <label class="col-md-2 control-label"for="municipio">Municipio*</label>
                            <div class="col-md-3" >
                              <input type="text" class="form-control1" name="municipio" value="${domicilio?.municipio}" />
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-md-2 control-label"for="ciudad">Ciudad*</label>
                            <div class="col-md-3" >
                              <input type="text" class="form-control1" name="ciudad" value="${domicilio?.ciudad}" />
                            </div>
                          </div>

                          <div class="form-group">
                            <label class="col-md-2 control-label"for="colonia">Colonia*</label>
                            <div class="col-md-3" >
                              <input type="text" class="form-control1" name="colonia" value="${domicilio?.colonia}" />
                            </div>

                            <label class="col-md-1 control-label"for="codigoPostal">Codigo Postal*</label>
                            <div class="col-md-1" >
                              <input type="text"  class="form-control1" name="codigoPostal" value="${domicilio?.codigoPostal}" />
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
                      <span class="clearfix"></span>
                    </div>


                  </div>
                </fieldset>
                <!--<fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.empleado}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>-->
            </g:form>
            <asset:javascript src="parsleyeventos.js" type="text/javascript"/>
            <script type="text/javascript">
            $(function () {
              var $sections = $('.form-section');
              $sections.each(function(index, section) {
                $(section).find(':input').attr('readonly', 'true');
              });
            });
            </script>
        </div>
    </body>
</html>
