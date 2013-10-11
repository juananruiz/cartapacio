<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: eventos_listar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Lista todos los eventos si eres Administrador o los autorizados para un usuairo.
//---------------------------------------------------------------------------------------------
$_nombre_pagina = "Mis recursos";
$_breadcrumb = "<a href='index.php?page=evento'>Evento</a> <i class='icon-chevron-right'></i>  $_nombre_pagina";

$condicion = "id_persona = $usuario->id AND id_aplicacion = 1";
$permiso = new permiso();
if ($permiso->tiene_permiso($condicion))
{
	$condicion = "SELECT eu.nombre AS unidad,eu.id AS id_unidad FROM `AA_permisos` p 
	LEFT JOIN EVENTO_recursos er ON p.id_recurso = er.id
	LEFT JOIN EVENTO_unidades eu ON er.id_unidad = eu.id
	WHERE p.id_aplicacion = 1 AND id_persona = $usuario->id GROUP BY eu.id";

	$permiso = new permiso();
	$permisos = $permiso->arbol_permisos_usuario($condicion);
	//print_r($permisos);
	$smarty->assign('permisos', $permisos);

	$smarty->assign('_menu', 'editor');
	$smarty->assign('_breadcrumb', $_breadcrumb);
	$smarty->assign('_nombre_pagina', $_nombre_pagina);
	$plantilla = "evento/usuario_permisos.tpl";
}
else
{
	$mensaje = "No tiene permisos para esta aplicación";
  $mensaje_tipo = "Error";
	header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
	$log = new log();
	$log->anotar(1,$usuario->id,0,'Listar unidades',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
}
?>
