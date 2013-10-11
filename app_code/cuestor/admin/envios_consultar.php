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

	$id_cuestionario = sanitize($_REQUEST["id"],INT);
	$cuestionario = new cuestor_cuestionario();
	$cuestionario->load("id = $id_cuestionario");
	$smarty->assign('cuestionario',$cuestionario);

	$envio = new cuestor_envio();
	if (isset($_REQUEST["ajax"]) AND $_REQUEST["ajax"] == "true")
	{
		$cadena = sanitize($_REQUEST["cadena"],SQL);

		if ($id_rol == 1)
		{
			$condicion = "id_cuestionario = $id_cuestionario AND 
			(ap.uvus LIKE '%$cadena%' OR ap.nif LIKE '%$cadena%' OR ce.id LIKE '%$cadena%')";
		}
		else
		{
			$condicion = "id_cuestionario = $id_cuestionario AND ce.id LIKE '%$cadena%'";
		}
		if ($cadena != "")
		{
			$envios = $envio->find_envio($condicion);
			$smarty->assign('plantilla_vacia','false');
			$smarty->assign('envios',$envios);
		}
		else
		{
			$smarty->assign('plantilla_vacia','true');
		}
		$plantilla = "cuestor/admin/envios_consultar_ajax.tpl";
	}
	$smarty->assign('id_rol',$id_rol);
	$smarty->assign('_nombre_pagina','Consultar los datos del '.$cuestionario->nombre_largo);
}
else
{
	$mensaje = "No tiene permiso para esta acción.";
	$mensaje_tipo = "Error";
	header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
