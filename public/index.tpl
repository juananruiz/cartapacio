<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>{if isset($_nombre_pagina)}{$_nombre_pagina} - {/if}Cartapacio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Administración y consulta de recursos patrimoniales">
    <meta name="author" content="Juan Antonio Ruiz Rivas">

    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/cartapacio.css" rel="stylesheet">
    <link href="css/comunica-responsive.css" rel="stylesheet">
    <link href="css/dataTables.bootstrap.css" rel="stylesheet">
    <style>
      body {
        padding-top: 60px; /* 60px hacen que el contenido nunca pise la barra de navegación superior */
      }
    </style>
    <link href="css/bootstrap-responsive.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Librerías javascript
    <script src="js/jquery-ui-1.9.2.min.js"></script>
    ================================================== -->
    <!-- Deberían estar al final para que la carga sea más rápida -->
    <script src="js/jquery-1.10.2.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/jquery.dataTables.js"></script>
    <script src="js/DT_bootstrap.js"></script>
    <script src="js/bootstrap.file-input.js"></script>
    <script src="js/bootstrap-popover.js"></script>
    <script src="js/bootstrap-tooltip.js"></script>

    <!-- Imágenes para el favicon y para el touch icon de los móviles -->
    <link rel="shortcut icon" href="ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
  </head>

  <body>

    {$rol = $_usuario->id_rol}
    {$menu_rol = "menu_rol_$rol.tpl"}
    {if file_exists("../app_code/$menu_rol")}
      {include file=$menu_rol}
    {else}
      {include file="menu_rol_4.tpl"}
    {/if}

    <div class="container-fluid">
			<ul class="breadcrumb">
				<li><a href="index.php?page=inicio">Cartapacio <i class="icon-chevron-right"></i></a></li>
				{$_breadcrumb}	
			</ul>

      {if isset($smarty.get.mensaje) AND isset($smarty.get.mensaje_tipo)}
        <div class="alert alert-{$smarty.get.mensaje_tipo} se-desvanece">
          <h4>{$smarty.get.mensaje_tipo}</h4>
          {$smarty.get.mensaje}
        </div>
      {/if}

      {if $auto_menu}
        {include file="$auto_menu"}
      {else}
        {include file="$plantilla"}
      {/if}
    </div>

    <footer class="footer">
      <img class="pull-left" src="img/logo-US-footer.png" alt="logo-US-footer" width="120" height="100" />
            <div>
              <p align="right" class="pull-right"><strong>Centro de Iniciativas Culturales Universidad de Sevilla</strong><br>
              C/ San Fernando s/n, 41001 Sevilla, España</br>
          <small>
              <a href="#">Créditos</a> |
              <a href="#">Condiciones</a> |
              <a href="index.php?page=contactar">Contactar</a>
          </small></p> 
          </div>
    </footer>

    <script>
      $('#usuario-pop').popover();
      $(".se-desvanece").delay(2500).hide(1000,function(){
        $(this).remove();
      });
    </script>
  </body>
</html>
