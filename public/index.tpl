<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>{if isset($_nombre_pagina)}{$_nombre_pagina} - {/if}Cartapacio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Catalogación y consulta de recursos patrimoniales">
    <meta name="author" content="Juan Antonio Ruiz Rivas">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-responsive.css">
    <link rel="stylesheet" href="css/jquery.dataTables.css">
    <link rel="stylesheet" href="css/bootstrap-wysihtml5.css">
    <link rel="stylesheet" href="css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="freeow/style/freeow/freeow.css">
    <!--<link rel="stylesheet" href="css/dropzone.css">-->
    <link rel="stylesheet" href="css/anunciacion.css">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Cuando sea posible deben estar al final para que la carga sea más rápida -->
    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/jquery.dataTables.js"></script>
    <script src="js/DT_bootstrap.js"></script>
    <script src="js/wysihtml5.js"></script>
    <script src="js/bootstrap-wysihtml5.js"></script>
    <script src="freeow/jquery.freeow.min.js"></script>
    <script src="js/cartapacio.js"></script>

    <!-- 4dic2013 <script src="js/bootstrap.file-input.js"></script> -->

    <!-- Imágenes para el favicon y para el touch icon de los móviles -->
    <link rel="shortcut icon" href="ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
  </head>

  <body data-spy="scroll" data-target=".bs-docs-sidebar">

    <!-- Ventana modal multiuso -->
    <div id="modalGlobal" class="modal hide fade">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3></h3>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <a href="#" class="btn close" data-dismiss="modal" aria-hidden="true">Close</a>
        <a href="#" class="btn btn-primary">Grabar</a>
      </div>
    </div>

    <!-- Barra de menú superior / Varía en función del perfil de usuario-->
    {$rol = $_usuario->id_rol}
    {$menu_rol = "menu_rol_$rol.tpl"}
    {include file=$menu_rol}

    <div id="jumbo-space"></div>

    <div class="container-fluid">

      <!-- Mensajes de aviso y error -->
      <div id="freeow" class="freeow freeow-top-right"></div>
      <script>
        {if isset($aviso)}
          $("#freeow").freeow("Información", "{$aviso}", {
            classes: ["smokey"],
            autoHide: true,
            autoHideDelay: 6000,
            hideStyle: { opacity: 0, left: "400px" },
            showStyle: { opacity: 1, left: "1px" },
            showDuration: 900,
            });
        {else if isset($error)}
          $("#freeow").freeow("Error", "{$error}", {
            classes: ["smokey", "error"],
            autoHide: false,
            hideStyle: { opacity: 0, left: "400px" },
            showStyle: { opacity: 1, left: "1px" },
            showDuration: 900,
            });
        {/if}
      </script>

      <!-- La plantilla secundaria es la que lleva la manteca -->
      {include file="$plantilla"}

    </div>
    
    <footer class="footer">
      <div class="container">
        <div class="span5">
        <h1>Proyecto Anunciación</h1>
        <ul class="footer-links">
          <li><a href="#">Acerca del Proyecto</a></li>
          <li class="muted">&middot;</li>
          <li><a href="index.php?page=historia">Historia</a></li>
          <li class="muted">&middot;</li>
          <li><a href="index.php?page=visita">Visita Virtual</a></li>
          <li class="muted">&middot;</li>
          <li><a href="index.php?page=contacto">Contactar</a></li>
        </ul>
        
        <p>
          <img src="img/logo_us_200.png" alt="logo us" width="120px" style="margin:10px;"> 
          <img src="img/logo_cicus.png" alt="logo cicus" style="margin:10px;">
        </p>

        <ul class="footer-links">
          <li><a href="http://www.us.es">Universidad de Sevilla</a></li>
          <li class="muted">&middot;</li>
          <li><a href="http://cicus.us.es">Centro de Iniciativas Culturales</a></li>
        </ul>
      </div>
      <div class="span4" style="padding:15px;">
        <p><i class="fa fa-list-alt"></i> {$_usuario->nombre} {$_usuario->apellidos}
        <br>Perfil: {$_usuario->rol->nombre}
        <br>Inicio de sesión: {$_usuario->inicio_sesion}
        </p>
        {if $_usuario->id_rol != 5}
          <p><a href="index.php?page=login_out"><i class="fa fa-key"></i> Cerrar sesión</a></p>
        {/if}
      </div>
      </div>
    </footer>

  </body>
</html>
