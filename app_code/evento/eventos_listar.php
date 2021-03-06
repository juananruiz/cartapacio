<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: eventos_listar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Lista todos los eventos si eres Administrador o los autorizados para un usuairo.
//---------------------------------------------------------------------------------------------
$_nombre_pagina = "Mis eventos";
$_breadcrumb = "<a href='index.php?page=evento'>Evento</a> <i class='icon-chevron-right'></i>  $_nombre_pagina";

$condicion = "id_persona = $usuario->id AND id_aplicacion = 1";
$permiso = new permiso();
if ($permiso->tiene_permiso($condicion))
{
	$evento = new evento_evento();
	$condicion = "SELECT e.nombre_corto AS titulo, e.* FROM EVENTO_eventos e WHERE e.id_padre = 0
								AND (e.id_estado = 1 OR e.id_estado = 2) AND (e.id_autor = $usuario->id 
								OR e.id_recurso IN (SELECT id_recurso FROM `AA_permisos` WHERE id_persona = $usuario->id 
								AND id_recurso IS NOT NULL AND id_aplicacion = 1)) ORDER BY e.fecha_entrada ASC";
	$eventos = $evento->eventos_de_un_usuario($condicion);

	$smarty->assign('eventos', $eventos);
	
	//$smarty->assign('retorno',$_REQUEST["retorno"])//;
	$smarty->assign('_menu', 'editor');
	$smarty->assign('_breadcrumb', $_breadcrumb);
	$smarty->assign('_nombre_pagina', $_nombre_pagina);
	$plantilla = "evento/eventos_listar.tpl";
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
