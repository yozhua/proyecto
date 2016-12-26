<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main" />
    <title>Restablecer su contraseña</title>
</head>
<body>
    <h1>Has solicitado restablecer tu contraseña.</h1>
    <p>Escuchamos que has perdido tu contraseña para acceder al sistema, ¡pero no te preocupes!, puedes utilizar el siguiente enlace para restablecer su contraseña:</p>    
    <a href="${ createLink(action: "change_pass", controller: "user", params: [token:token], base:"http://localhost:8080") }">Da click aqui</a>    
    <p>Para obtener un nuevo enlace de restablecimiento de contraseña, visite https://nombredeldominio.com/restore_pass y si tienes alguna pregunta sobre el sistema, no dudes en contactarnos en cualquier momento a support@bluit.com.</p>		
	<label for="">Gracias.</label>
	<label for="">Tus amigos de BLUIT.</label>
</body>
</html>