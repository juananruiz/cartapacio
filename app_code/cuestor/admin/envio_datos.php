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
//if ($permiso->load("id_aplicacion = 4 AND id_persona = $usuario->id AND id_rol = 1"))
$permisos = $permiso->find("id_aplicacion = 4 AND id_persona = $usuario->id ORDER BY id_rol ASC");
if (count($permisos) > 0)
{
	$id_rol = $permisos[0]->id_rol;
	$id_cuestionario = sanitize($_REQUEST["id_cuestionario"],INT);
	$id_envio = sanitize($_REQUEST["id_envio"],INT);

	$respuesta = new cuestor_respuesta();
	$respuestas = $respuesta->find("id_cuestionario = $id_cuestionario AND id_envio = $id_envio");
	//print_r($respuestas);

	$smarty->assign('respuestas',$respuestas);
	$smarty->assign('_nombre_pagina','Consultar los datos del envio '.$id_envio);
	$plantilla = "cuestor/admin/envio_datos.tpl";
}
else
{
	$mensaje = "No tiene permiso para esta acción.";
	$mensaje_tipo = "Error";
	header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
