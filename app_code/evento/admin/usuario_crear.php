<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: usuario_buscar_ajax.php
//---------------------------------------------------------------------------------------------
// Descripcion: Filtra a los usuarios por ajax desde usuario_listar.
//---------------------------------------------------------------------------------------------

$_nombre_pagina = "Listar usuarios";
$_breadcrumb = "<a href='index.php?page=evento'>Evento</a> <i class='icon-chevron-right'></i> <a href='index.php?page=evento/admin'>Admin</a> <i class='icon-chevron-right'></i> $_nombre_pagina";

$condicion = "id_persona = $usuario->id AND id_aplicacion = 1 AND id_recurso = 1";
$permiso = new permiso();
if ($permiso->tiene_permiso($condicion))
{
	$id_usuario = sanitize($_REQUEST["id"],INT);
	$usuario = new usuario();
	$usuario->load("id = $id_usuario");
	$smarty->assign('usuario', $usuario);

	$unidad = new evento_unidad();
	$unidades = $unidad->unidades_recursos_usuario($usuario->id);
	$smarty->assign('unidades', $unidades);
//print_r($unidades);
	$smarty->assign('_menu', 'admin');
	$smarty->assign('_breadcrumb', $_breadcrumb);
	$smarty->assign('_nombre_pagina', $_nombre_pagina);
	$plantilla = "evento/admin/usuario_crear.tpl";
}
else
{
  $mensaje = "No tiene permisos para buscar usuarios";
  $mensaje_tipo = "Error";
	$log = new log();
	$log->anotar($id_app,$usuario->id,0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
}
?>
