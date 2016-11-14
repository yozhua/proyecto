<html>
<head>
    <meta name="layout" content="main_not_auth" />
    <title>Cambia tu contraseña</title>
</head>
<body>
<div id="change" align="center" >
    <div id="change-block">
        <div align="center">
            <h2 class="linkedin"><g:message code='Cambiar contraseña'/></h2>
        </div>
        <div class="registration-form"> 
            <form action="update_pass" method="POST" name="changeForm" class="login-form" onSubmit="return validarPassword()">    
                <p>
                    <span><label for="username">Introduce la nueva contraseña:</label></span><br>
                    <input type="password"  name="password" id="password" align="center" required="required"/>
                </p><br>
                <p>
                    <span><label for="username">Repite la contraseña:</label></span><br>
                    <input type="password"  name="passwordConfirm" id="passwordConfirm" align="center" required="required"/>
                </p><br>
                <g:hiddenField name="token" value="${params.token}"/>                
                <p>                 
                    <input type="submit" id="submit" value="Cambiar" default="Cambiar" />
                </p>
            </form> 
        </div>
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
</div>                                
</body>
</html>