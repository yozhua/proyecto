<html>
<head>
    <meta name="layout" content="main_not_auth" />
    <title>Cambia tu contraseña</title>
</head>
<body  class="sign-in-up">
    <section>
        <div>
            <g:if test="${errors}">
                <ul class="errors" role="alert">    
                    <g:each in="${errors}" var="error">
                        <li class="error">
                            <g:message code="${error}" default="Error al procesar los datos"/>
                        </li>
                    </g:each>
                </ul>
            </g:if>
        </div>    
        <div class="sign-in-up" align="center" >
            <div id="page-wrapper" class="sign-in-wrapper">
                <div class="graphs">
                    <div class="sign-in-form">                      
                        <div class="signin">
                            <form action="update_pass" method="POST" name="changeForm"  onSubmit="return validarPassword()">    
                                <h3> Cambiar contraseña.</h3>
                                <div class="log-input">                             
                                    <div class="log-input-left">
                                        <span><label for="password">Introduce la nueva contraseña:</label></span><br>
                                        <input type="password" class="lock" value="*****" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"  name="password" id="password" placeholder="Introduzca tu contraseña"  required="required" />
                                    </div><div class="clearfix"> </div>                                 
                                </div>
                                <div class="log-input">
                                    <div class="log-input-left">
                                        <span><label for="passwordConfirm">Repite la contraseña:</label></span><br>
                                        <input type="password" class="lock" value="*****" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"  name="passwordConfirm" id="passwordConfirm"   placeholder="Repite tu contraseña" required="required" />
                                    </div><div class="clearfix"> </div>                                 
                                </div>
                                <g:hiddenField name="token" value="${params.token}"/>                
                                <div class="log-input">                             
                                    <div class="log-input-left">                                                                                            
                                        <input type="submit" id="submit" value="Cambiar" default="Cambiar" />
                                    </div><div class="clearfix"> </div>                                 
                                </div>
                            </form>         
                        </div>  
                    </div>  
                </div>  
            </div>  
        </div>          
    </section>                                 
</body>
</html>