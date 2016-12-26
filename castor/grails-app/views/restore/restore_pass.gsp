<html>
<head>
    <meta name="layout" content="main" />
    <title><g:message code="Restablecer contraseña." /></title>
</head>
<body class="sign-in-up">
    <section>       
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
                                        <input type="text" class="email"  name="email" id="email" value="ejemplo@ejemplo.com" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"  name="${usernameParameter ?: 'username'}" id="username" placeholder="ejemplo@ejemplo.com" required="" />
                                    </div><div class="clearfix"> </div>                                 
                                </div>    
                                <div class="log-input">                             
                                    <div class="log-input-left">
                                        <input class="send" type="submit" value="${message(code: 'default.button.Enviar.label', default: 'Enviar')}" /><br>
                                        <g:link controller='user' action='initial_view'>Iniciar Sesion.</g:link> 
                                        <g:if test="${errors}">
                                            <g:javascript>
                                                $( document ).ready(
                                                    function() {
                                                        var delay = alertify.get('notifier','delay');
                                                        alertify.set('notifier','delay', 13);
                                                        alertify.error(El correo no existe o esta mal escrito.);
                                                        alertify.set('notifier','delay', delay);
                                                    }
                                                );
                                            </g:javascript>
                                        </g:if>         
                                    </div><div class="clearfix"> </div>                                 
                                </div>    
                            </g:form>
                        </div>  
                    </div>  
                </div>  
            </div>  
        </section>
    </body>
</html>
