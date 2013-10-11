<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet - Cuestor
// Archivo: inicio.php
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

$_nombre_pagina = "Listar proyectos";
$_breadcrumb = "<a href='index.php?page=cuestor'>Participación</a> <i class='icon-chevron-right'></i> $_nombre_pagina";

$cuestionario = new cuestor_cuestionario();
$cuestionarios = $cuestionario->find_joined($usuario->id);

$smarty->assign('_breadcrumb', $_breadcrumb);
$smarty->assign('cuestionarios',$cuestionarios);
$smarty->assign('_nombre_pagina', $_nombre_pagina);
?>
