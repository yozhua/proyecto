<html>
<head>
    <meta name="layout" content="main_not_auth" />
    <title>Reestablecer contraseña</title>
</head>
<body class="sign-in-up">
    <section>
    <div align="center">
        <g:if test="${errors}">
            <div class="errors" role="alert"><label for="error">"El correo no existe o esta mal escrito."</label></div>
        </g:if>  
    </div>        
        <div class="sign-in-up" align="center" >
            <div id="page-wrapper" class="sign-in-wrapper">
                <div class="graphs">
                    <div class="sign-in-form">                      
                        <div class="signin">
                        <h3> Restablecer contraseña.</h3>
                            <g:form action="send_email" method="POST" name="resetForm" onSubmit="return validarEmail()"> 
                                
                                <div class="log-input">                             
                                    <div class="log-input-left">                                                                            
                                        <span><label for="email">Ingresa tu email.</label></span><br>
                                        <input type="text" class="email"  name="email" id="email" value="ejemplo@ejemplo.com" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"  name="${usernameParameter ?: 'username'}" id="username" placeholder="ejemplo@ejemplo.com" required="required" />
                                    </div><div class="clearfix"> </div>                                 
                                </div>    
                                <div class="log-input">                             
                                    <div class="log-input-left">                                                                            
                                        <input class="send" type="submit" value="${message(code: 'default.button.Enviar.label', default: 'Enviar')}" /><br>
                                        <g:link controller='user' action='initial_view'>Iniciar Sesion.</g:link> 
                                    </div><div class="clearfix"> </div>                                 
                                </div>    
                            </g:form>
                        </div>  
                    </div>  
                </div>  
            </div>  
        </div>          
    </section>
</body>
</html>
