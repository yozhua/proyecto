<html>
<head>
 	<meta name="layout" content="main_not_auth" />
	<title><g:message code='springSecurity.login.title' default="Ingresar" /></title>	
</head>
<body>
<div id="login" align="center" >
	<div id="login-block">
		<div align="center" class="header_stats">
			<h2 class="linkedin"><g:message code='springSecurity.login.header'/></h2>
		</div>
		<g:if test='${flash.message}'>
			<div><label for="error">${flash.message}</label></div>
		</g:if>
		<div class="registration-form"> 
			<form action="${postUrl ?: '/login/authenticate'}" method="POST" class="login-form" autocomplete="off" name="loginForm">		
				<p>
					<span><label for="username">Usuario</label></span><br>
					<input type="text"  name="${usernameParameter ?: 'username'}" id="username" align="center" placeholder="Introduzca tu usuario" required="required"/>
				</p><br>

				<p>
					<span><label for="username">Contraseña</label></span><br>
					<input type="password"  name="${passwordParameter ?: 'password'}" id="password" align="center" placeholder="Introduzca tu contraseña" required="required"/>
				</p><br>

				<p id="remember_me_holder">
					<input type="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
					<label for="remember_me"><g:message code='springSecurity.login.remember.me.label' default="Recordarme"/></label>	
				</p>
				<p>					
					<input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"  default="Acceder"  /><span><i class="fa fa-lock" aria-hidden="true"></i></span>										
					<br>
					<g:link controller='user' action='restore_pass'>¿Olvidaste tu contraseña?</g:link>					
				</p>
			</form>			
		</div>
		
	</div>
</div>                     						
	<script>
		(function() {
			document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
		})();
	</script>
</body>
</html>