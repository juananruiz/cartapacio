<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: unidades_listar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Lista las unidades del sistema. 
//---------------------------------------------------------------------------------------------
$_nombre_pagina = "Estadísticas";
$_breadcrumb = "<a href='index.php?page=evento'>Evento</a> <i class='icon-chevron-right'></i> <a href='index.php?page=evento/admin'>Admin</a> <i class='icon-chevron-right'></i> $_nombre_pagina";

$condicion = "id_persona = $usuario->id AND id_aplicacion = 1 AND id_recurso = 1";
$permiso = new permiso();
if ($permiso->tiene_permiso($condicion))
{
	$unidad = new evento_unidad();
	$unidades = $unidad->estadistica("1");
	$smarty->assign('unidades', $unidades);

	$smarty->assign('_menu', 'admin');
	$smarty->assign('_breadcrumb', $_breadcrumb);
	$smarty->assign('_nombre_pagina', $_nombre_pagina);
	$plantilla = "evento/admin/eventos_estadistica.tpl";
}
else
{
	$mensaje = "No tiene permisos para este área";
  $mensaje_tipo = "Error";
	header("location:index.php?page=evento/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
	$log = new log();
	$log->anotar(1,$usuario->id,0,'Listar unidades',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
}
?>
