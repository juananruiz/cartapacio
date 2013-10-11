<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet - Cuestor
// Archivo: inicio.php
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
ini_set('memory_limit', '-1');
$permiso = new permiso();
if ($permiso->load("id_aplicacion = 4 AND id_persona = $usuario->id"))
{
	$id_cuestionario = sanitize($_REQUEST["id"],INT);
	$cuestionario = new cuestor_cuestionario();
	$cuestionario->load("id = $id_cuestionario");
	$smarty->assign('cuestionario',$cuestionario);

	$envio = new cuestor_envio();
	$condicion = "id_cuestionario = $id_cuestionario";

	$envios = $envio->find($condicion);
	$total_envios = count($envios);
	$total_envios_finalizados = count($envio->find($condicion . " AND fecha_fin IS NOT NULL"));
	$smarty->assign('total_envios_finalizados',$total_envios_finalizados);
	$smarty->assign('total_envios',$total_envios);

	$plantilla = "cuestor/admin/resultados_envio.tpl";
	$smarty->assign('_nombre_pagina','Resultados del cuestionario');
}
else
{
	$mensaje = "No tiene permiso para esta acción.";
	$mensaje_tipo = "Error";
	header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
