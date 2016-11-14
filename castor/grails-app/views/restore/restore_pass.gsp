<html>
<head>
    <meta name="layout" content="main_not_auth" />
    <title>Reestablecer contraseña</title>
</head>
<body>
<div id="reset" align="center" >
    <div id="reset-block">
        <div align="center">
            <h2 class="linkedin">Reestablecer contraseña.</h2>
        </div>   
        <g:if test="${errors}">
            <div class="errors" role="alert"><label for="error">"El correo no existe o esta mal escrito."</label></div>
        </g:if>            
        <div class="registration-form"> 
            <g:form action="send_email" method="POST" name="resetForm" class="login-form" onSubmit="return validarEmail()"> 
                <p>
                    <span><label for="email">Ingresa tu email.</label></span><br>
                    <g:field type="text" name="email" id="email" align="center" placeholder="ejemplo@ejemplo.com" required="required"/><br> 
                </p>   
                <p>                                          
                    <input class="send" type="submit" value="${message(code: 'default.button.Enviar.label', default: 'Enviar')}" />
                    <br>
                    <g:link controller='user' action='initial_view'>Iniciar Sesion.</g:link>  
                </p>   
            </g:form>            
        </div>
        
    </div>    
</div>    
</body>
</html>
