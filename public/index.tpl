<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title>{if isset($_nombre_pagina)}{$_nombre_pagina} - {/if}Universidad de Sevilla</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Intranet de Recursos Humanos de la Universidad de Sevilla">
    <meta name="author" content="Unidad Técnica Recursos Humanos">

    <!-- Le styles -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/comunica.css" rel="stylesheet">
    <link href="css/comunica-responsive.css" rel="stylesheet">
    <link href="css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap-wysihtml5.css" rel="stylesheet">
    <link href="css/faq.css" rel="stylesheet">
    <link href="css/evento.css" rel="stylesheet">
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
    <script src="js/jquery-1.8.0.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/jquery.dataTables.js"></script>
    <script src="js/DT_bootstrap.js"></script>
    <script src="js/wysihtml5.js"></script>
    <script src="js/bootstrap-wysihtml5.js"></script>
    <script src="js/bootstrap.file-input.js"></script>
    <script src="js/bootstrap-popover.js"></script>
    <script src="js/bootstrap-tooltip.js"></script>
    <script src="js/evento.js"></script>

    <!-- Imágenes para el favicon y para el touch icon de los móviles -->
    <!-- Pendiente Yvan -->
    <link rel="shortcut icon" href="ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
  </head>

  <body>

    {$sector = $_usuario->id_sector}
    {$menu_sector = "menu_sector_$sector.tpl"}
    {if file_exists("../app_code/$menu_sector")}
      {include file=$menu_sector}
    {else}
      {include file="menu_sector_0.tpl"}
    {/if}

    <div class="container-fluid">
			<ul class="breadcrumb">
				<li><a href="index.php?page=inicio">Intranet <i class="icon-chevron-right"></i></a></li>
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
              <p align="right" class="pull-right"><strong>Direcci&oacute;n de Recursos Humanos de la Universidad de Sevilla</strong><br>
              <a href="#">recursoshumanos.us.es</a><br>
              C/ San Fernando s/n, 41001 Sevilla, España</br>
          <small>
          <span id="designed_by">Desarrollado y diseñado en la Universidad de Sevilla.<br>
          Colabora: <a href="http://yvanpinto.com">Yvan Pinto Sierralta</a></span> |
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
