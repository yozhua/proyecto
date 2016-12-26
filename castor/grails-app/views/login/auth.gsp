<html>
<head>
 	<meta name="layout" content="main" />
	<title><g:message code="Iniciar sesion." /></title>	
</head>
<body class="sign-in-up">
	<section>		
		<div class="sign-in-up" align="center" >
			<div id="page-wrapper" class="sign-in-wrapper">
				<div class="graphs">
					<div class="sign-in-form">						
						<div class="signin">
							<form action="${postUrl ?: '/login/authenticate'}" method="POST"  autocomplete="off" name="loginForm">
								<h3> Iniciar sesion</h3>
								<div class="log-input">								
									<div class="log-input-left">
										<span><label for="username">Usuario</label></span><br>
									   	<input type="text" class="user" value="Usuario" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}"  name="${usernameParameter ?: 'username'}" id="username" placeholder="Introduzca tu usuario" required="required" />
									</div><div class="clearfix"> </div>									
								</div>
								<div class="log-input">
									<div class="log-input-left">
										<span><label for="username">Contraseña</label></span><br>									
									   	<input type="password" class="lock" value="****" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}" name="${passwordParameter ?: 'password'}" id="password" placeholder="Introduzca tu contraseña" required="required" />										
									</div><div class="clearfix"> </div>									
								</div>
								<div class="signin-rit">	
									<span class="checkbox1">
										<label class="checkbox" for="remember_me">
											<input align="center" type="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
											<g:message code='springSecurity.login.remember.me.label' default="Recordarme"/>
										</label>
									</span><div class="clearfix"> </div>
								</div>	
								<g:if test='${flash.message}'>
									<g:javascript>
						                $( document ).ready(
						                    function() {
						                        var delay = alertify.get('notifier','delay');
						                        alertify.set('notifier','delay', 13);
						                        alertify.error("${flash.message}");
						                        alertify.set('notifier','delay', delay);
						                    }
						                );
                					</g:javascript>
								</g:if>			
								<div class="log-input">                             
                                    <div class="log-input-left">                                                				
										<input type="submit" value="Acceder." /><br>							
										<g:link controller='user' action='restore_pass'>¿Olvidaste tu contraseña?</g:link>
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