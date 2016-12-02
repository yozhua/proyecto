<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="layout" content="main_not_auth" />
    <title>Recuperar tu contraseña</title>
</head>

<body>
    <p>Solicitaste restablecer tu contraseña,</p>
    <p>para recuperar tu contraseña haz click</p>
    <a href="${ createLink(action: "change_pass", controller: "user", params: [token:token], base:"http://localhost:8080") }">aqui</a>
</body>
</html>