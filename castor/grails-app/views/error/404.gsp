<!doctype html>
<html>
    <head>
        <title>Pagina no encontrada :(</title>
        <meta name="layout" content="main">
        <g:if env="development">
            <asset:stylesheet src="errors.css"/>
        </g:if>
    </head>
    <body>
        <div id="page-wrapper">
            <div class="graphs">
                <div class="error-main">
                    <h3><i class="fa fa-exclamation-triangle"></i> <span>404</span></h3>
                <div class="col-xs-7 error-main-left">
                    <span>Oops!</span>
                    <p>La página que estás buscando no se pudo encontrar :(</p>
                    <div class="error-btn">
                        <a href="index.html">Regresar.</a>
                    </div>
                </div>
                <div class="col-xs-5 error-main-right">
                    <g:img dir="images" file="error.png" alt=" " class="img-responsive" />
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </body>
</html>
