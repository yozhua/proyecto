<%@ page import="com.castor.encargado.Encargado" %>
<%@ page import="com.castor.empleado.Empleado" %>
<%@ page import="com.castor.seguridad.*" %>
<%@ page import="grails.plugins.springsecurity.*" %>

<!DOCTYPE HTML>
<html lang="es_MX">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="keywords" content="Easy Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

    
    <title>
        <g:layoutTitle default="CASTOR"/>
    </title>
    <script type="text/javascript">
         var CONTEXT_ROOT = '${request.getContextPath()}';
    </script>

    <asset:javascript src="alertify.js"/>
    <asset:stylesheet src="alertify.min.css"/>

    <asset:javascript src="Chart.js"/>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="style.css"/>
    <asset:stylesheet src="font-awesome.css"/>
    <asset:stylesheet src="icon-font.min.css"/>
    <asset:stylesheet src="animate.css"/>

    <asset:javascript src="validaciones.js"/>


    <asset:javascript src="jquery-2.2.0.min.js"/>

    <asset:javascript src="jquery.flexisel.js"/>
    <asset:javascript src="myjavascript.js"/>

    <asset:javascript src="jquery.flot.min.js"/>
    <asset:javascript src="uisearch.js"/>
    <asset:javascript src="classie.js"/>


    <asset:javascript src="wow.min.js"/>
        <g:javascript>
            new WOW().init();
        </g:javascript>
    <g:layoutHead/>

</head>
<body class="sticky-header left-side-collapsed" >

   
    <!-- Obtener el usuario actual -->
    <g:set var="username" value="${sec?.username()}" />
    <g:set var="nombre" value="${User.findByUsername(username)?.username}" />    
    <g:set var="inicio" value="nombre" />
    <g:set var="mailUser" value="${User.findByUsername(username)?.email}" />    
    <g:set var="hashMail" value="${g.createLink(absolute:true, uri:"/gravatar/getHash?correo=$mailUser")}"/>
    
    <section>
    <!-- left side start-->       
        <div class="left-side sticky-left-side">
            <!--logo and iconic logo start-->
            <div class="logo">
                <h1><span>BLUIT</span></h1>
            </div>
            <div class="logo-icon text-center">
                <a href="index.html"><i class="lnr lnr-home"></i> </a>
            </div>

            <!--logo and iconic logo end-->
            <div class="left-side-inner">

                  <!--sidebar nav start-->
                    <ul class="nav nav-pills nav-stacked custom-nav">
                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ADMINISTRATIVO,ROLE_GERENCIA,ROLE_TECNICO,ROLE_CLIENTE"> 
                            <li class="active"><g:link action="index"><i class="lnr lnr-power-switch"></i><span>Inicio</span></g:link></li>
                        </sec:ifAnyGranted>
                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ADMINISTRATIVO,ROLE_GERENCIA">
                            <li class="menu-list">
                                <a href="#"><i class="fa fa-building-o" aria-hidden="true"></i>
                                    <span>Cliente</span></a>
                                    <ul class="sub-menu-list">                                      
                                        <li><g:link controller="cliente" action="create"><i class="fa fa-users" aria-hidden="true"></i>Registrar.</g:link></li>
                                        <li><g:link controller="cliente" action="busqueda"><i class="fa fa-search" aria-hidden="true"></i>Buscar.</g:link></li>
                                    </ul>
                            </li>
                        </sec:ifAnyGranted>
                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ADMINISTRATIVO,ROLE_GERENCIA">
                            <li class="menu-list">
                                <a href="#"><i class="fa fa-shopping-cart"></i>
                                    <span>Sucursales</span></a>
                                    <ul class="sub-menu-list">
                                        <li><a href="grids.html"><i class="fa fa-search"></i>Regitrar</a> </li>
                                        <li><g:link controller="sucursal" action="busqueda"><i class="fa fa-search" aria-hidden="true"></i>Buscar.</g:link></li>
                                    </ul>
                            </li>
                        </sec:ifAnyGranted>
                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ADMINISTRATIVO,ROLE_GERENCIA,ROLE_TECNICO">
                            <li class="menu-list">
                                <a href="#"><i class="fa fa-users" aria-hidden="true"></i>
                                    <span>Encargados.</span></a>
                                    <ul class="sub-menu-list">
                                        <li><a href="grids.html"><i class="fa fa-user-plus" aria-hidden="true"></i>Regitrar</a> </li>
                                        <li><g:link controller="encargado" action="busqueda"><i class="fa fa-search" aria-hidden="true"></i>Buscar.</g:link></li>
                                    </ul>
                            </li>    
                        </sec:ifAnyGranted>
                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_GERENCIA">
                            <li class="menu-list">
                                <a href="#"><i class="fa fa-users" aria-hidden="true"></i>
                                    <span>Empleados.</span></a>
                                    <ul class="sub-menu-list">
                                        <li><g:link controller="empleado" action="create"><i class="fa fa-user-plus" aria-hidden="true"></i>Registrar.</g:link></li>
                                        <li><g:link controller="empleado" action="busqueda"><i class="fa fa-search" aria-hidden="true"></i>Buscar.</g:link></li>
                                    </ul>
                            </li>
                        </sec:ifAnyGranted>
                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ADMINISTRATIVO,ROLE_GERENCIA,ROLE_TECNICO">
                            <li class="menu-list">
                                <a href="#"><i class="fa fa-newspaper-o"></i>
                                    <span>Bitacoras.</span></a>
                                    <ul class="sub-menu-list">
                                        <li><g:link controller="bitacora" action="create"><i class="fa fa-address-card-o" aria-hidden="true"></i>Bitacora.</g:link></li>
                                        <li><g:link controller="bitacora" action="busqueda"><i class="fa fa-search" aria-hidden="true"></i>Buscar.</g:link></li>
                                        <li><a href="widgets.html">Listar</a></li>
                                        <li><a href="widgets.html">Base de conocimiento</a></li>
                                    </ul>
                            </li>  
                        </sec:ifAnyGranted>
                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_GERENCIA">
                            <li class="menu-list">
                                <a href="#"><i class="lnr lnr-cog"></i>
                                    <span>Configuraciones.</span></a>
                                    <ul class="sub-menu-list">
                                        <li><a href="grids.html">Estados de bitacora</a> </li>
                                        <li><a href="widgets.html">Tipo cliente</a></li>
                                        <li><a href="widgets.html">Listar</a></li>
                                        <li><a href="widgets.html">Buscar</a></li>
                                    </ul>
                            </li>    
                        </sec:ifAnyGranted>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">                            
                            <li class="menu-list">
                                <a href="#"><i class="lnr lnr-cog"></i>
                                    <span>Roles</span></a>
                                    <ul class="sub-menu-list">
                                        <li><a href="grids.html">Regitrar</a> </li>
                                        <li><a href="widgets.html">Actualizar</a></li>
                                        <li><a href="widgets.html">Listar</a></li>
                                        <li><a href="widgets.html">Buscar</a></li>
                                    </ul>
                            </li>
                        </sec:ifAnyGranted>
                    </ul>
                <!--sidebar nav end-->
            </div>
        </div>
        <!-- left side end-->
        <!-- main content start-->
        <div class="main-content">
            <!-- header-starts -->
            <div class="header-section">

            <!--toggle button start-->
            <a class="toggle-btn  menu-collapsed"><i class="fa fa-bars"></i></a>
            <!--toggle button end-->

            <!--notification menu start -->
            <div class="menu-right">
                <div class="user-panel-top">
                    <div class="profile_details_left">
                    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ADMINISTRATIVO,ROLE_GERENCIA,ROLE_TECNICO">
                        <ul class="nofitications-dropdown">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-envelope"></i><span class="badge">3</span></a>

                                        <ul class="dropdown-menu">
                                            <li>
                                                <div class="notification_header">
                                                    <h3>You have 3 new messages</h3>
                                                </div>
                                            </li>
                                        </ul>
                            </li>                
                        </ul>
                    </sec:ifAnyGranted>     
                    </div>              
                    <div class="profile_details">       
                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ADMINISTRATIVO,ROLE_GERENCIA,ROLE_TECNICO,ROLE_CLIENTE"> 
                            <ul>
                                <li class="dropdown profile_details_drop">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        <div class="profile_img">
                                            <span><img src="${hashMail}" class="img-circle" alt="" id="imguser"/></span>
                                            <div class="user-name">
                                                <p>${nombre}<span id="correo">${mailUser}</span></p>                        
                                            </div> 
                                             <i class="lnr lnr-chevron-down"></i>
                                             <i class="lnr lnr-chevron-up"></i>
                                            <div class="clearfix"></div>    
                                        </div>  
                                    </a>
                                    <ul class="dropdown-menu drp-mnu">                                        
                                        <li> <a href="#"><i class="fa fa-cog"></i> Contacto</a> </li> 
                                        <li> <a href="#"><i class="fa fa-user"></i>Perfil</a> </li> 
                                        <li> <g:link action="index" controller="logout"><i class="fa fa-sign-out"></i>Cerrar sesión</g:link></li>                               
                                    </ul>
                                </li>
                                <div class="clearfix"> </div>
                            </ul>   
                        </sec:ifAnyGranted> 
                    </div>                    
                    <g:if test="${nombre == null}">                           
                        <div class="social_icons">
                            <div class="col-md-4 social_icons-left">
                                <g:link controller='user' action='initial_view'>Iniciar Sesion.</g:link> 
                            </div>                        
                        </div>                                      
                    </g:if>             
                    <g:elseif test="${sec?.username() == null}">                        
                        <div class="social_icons">
                            <div class="col-md-4 social_icons-left">
                                <g:link controller='user' action='initial_view'>Iniciar Sesion.</g:link> 
                            </div>                        
                        </div>                                      
                    </g:elseif>
                </div>
            </div>
        </div>

        <g:layoutBody/>
        <!--footer section start-->
            <footer  align="center" >
               <p>Residencia.</p>
               <i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
               <i class="lnr lnr-power-switch"></i>
            </footer>
        <!--footer section end-->
      <!-- main content end-->
    </section>
    <asset:javascript src="jquery.nicescroll.js"/>
    <asset:javascript src="scripts.js"/>
    <asset:javascript src="bootstrap.js"/>         

    

    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ADMINISTRATIVO,ROLE_GERENCIA,ROLE_TÉCNICO,ROLE_CLIENTE">
    <g:javascript>
        $(document).ready(
            function(){
                $.ajax({
                type: "GET",

                url: '${g.createLink(absolute:true, uri:"/gravatar/getHash?correo=$mailUser")}',
                success: function (data) {
                    var randomIm = Math.random();
                    console.log("url"+data);
                    $('#imguser').attr('src', data);
                },
                error: function(){
                }
                });

            }            
        );
    </g:javascript>
    </sec:ifAnyGranted> 
</body>
</html>

