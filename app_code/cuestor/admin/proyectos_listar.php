<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet - Cuestor
// Archivo: inicio.php
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

$permiso = new permiso();
if ($permiso->load("id_aplicacion = 4 AND id_persona = $usuario->id"))
{

	$cuestionario = new cuestor_cuestionario();
	$cuestionarios = $cuestionario->find("1");
	$smarty->assign("cuestionarios",$cuestionarios);
	$plantilla = "cuestor/admin/proyectos_listar.tpl";
	$smarty->assign('_nombre_pagina','Listado de Proyectos.');
}
else
{
	$mensaje = "No tiene permiso para esta acción.";
	$mensaje_tipo = "Error";
	header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
