<!DOCTYPE HTML>
<html>
<head>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>
        <g:message code="springSecurity.login.title" default="Ingresar" />
    </title>

    <asset:javascript src="alertify.js"/>
    <asset:stylesheet src="alertify.min.css"/>
    
    <asset:javascript src="Chart.js"/>
    <asset:stylesheet src="bootstrap.min.css"/>   
    <asset:stylesheet src="style.css"/>  
    <asset:stylesheet src="font-awesome.css"/> 
    <asset:stylesheet src="icon-font.min.css"/>
    <asset:stylesheet src="animate.css"/>   
    

    
    
    <asset:javascript src="jquery-2.2.0.min.js"/> 
    
    <asset:javascript src="jquery.flexisel.js"/>
    <asset:javascript src="myjavascript.js"/>
    <asset:javascript src="wow.min.js"/>
    <asset:javascript src="jquery.flot.min.js"/>
    <asset:javascript src="uisearch.js"/>
    <asset:javascript src="classie.js"/>       

    <asset:javascript src="skycons.js"/>        
    <asset:javascript src="wow.min.js"/>
        <g:javascript>
            new WOW().init();
        </g:javascript>    
        
	<g:layoutHead/>
</head>    
<sec:ifNotLoggedIn>
<body>       
    <g:layoutBody/>
        <footer>
            <div>
                <p><i class="fa fa-thumbs-o-down" aria-hidden="true"></i>Residencia.</p>
                <br>
                <i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
                <i class="lnr lnr-power-switch"></i>
            </div>
        </footer>                
    <asset:javascript src="jquery.nicescroll.js"/>
    <asset:javascript src="scripts.js"/>
    <asset:javascript src="bootstrap.js"/>   
</body>
</sec:ifNotLoggedIn>    						
</html>
