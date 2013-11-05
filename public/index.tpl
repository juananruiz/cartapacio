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
    <link rel="stylesheet" href="css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
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
    <script src="js/bootstrap.file-input.js"></script>

    <!-- Imágenes para el favicon y para el touch icon de los móviles -->
    <link rel="shortcut icon" href="ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
  </head>

  <body data-spy="scroll" data-target=".bs-docs-sidebar">

    <!-- Barra de menú superior / Varía en función del perfil de usuario-->
    {$rol = $_usuario->id_rol}
    {$menu_rol = "menu_rol_$rol.tpl"}
    {if file_exists("../app_code/$menu_rol")}
      {include file=$menu_rol}
    {else}
      {include file="menu_rol_2.tpl"}
    {/if}

    <div style="height:20px;">
    </div>

    <div class="container-fluid">

      <!-- Mensajes de aviso y error -->
      {if isset($smarty.get.mensaje) AND isset($smarty.get.mensaje_tipo)}
        <div class="alert alert-{$smarty.get.mensaje_tipo} se-desvanece">
          <h4>{$smarty.get.mensaje_tipo}</h4>
          {$smarty.get.mensaje}
        </div>
      {/if}

      <!-- La plantilla secundaria es la que lleva la manteca -->
      {include file="$plantilla"}

    </div>
    
    <footer class="footer">
      <div class="container">
        <h1>Proyecto Anunciación</h1>
        <ul class="footer-links">
          <li><a href="http://cicus.us.es">Centro de Iniciativas Culturales</a></li>
          <li class="muted">&middot;</li>
          <li><a href="http://www.us.es">Universidad de Sevilla</a></li>
        </ul>

        <p>Code licensed under <a href="http://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache License v2.0</a>, documentation under <a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.</p>
        <p><a href="http://glyphicons.com">Glyphicons Free</a> licensed under <a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.</p>
        <ul class="footer-links">
          <li><a href="#">Blog</a></li>
          <li class="muted">&middot;</li>
          <li><a href="#">Issues</a></li>
          <li class="muted">&middot;</li>
          <li><a href="#">Changelog</a></li>
        </ul>
      </div>
    </footer>

    <script>
      $(".se-desvanece").delay(2500).hide(1000,function(){
        $(this).remove();
      });
    </script>
  </body>
</html>
