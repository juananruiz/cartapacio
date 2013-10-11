<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet - Cuestor
// Archivo: inicio.php
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

if (!empty($_REQUEST["id"]))
{
	$id_cuestionario = sanitize($_REQUEST["id"],INT);

	$cuestionario = new cuestor_cuestionario();
	if ($cuestionario->load_joined($id_cuestionario))
	{
		$condicion = "id_usuario = $usuario->id AND id_cuestionario = $id_cuestionario";
		$envio = new cuestor_envio();
		if ($envio->load_joined_indexado($condicion) == true)
		{
			$_breadcrumb = "<a href='index.php?page=cuestor'>Participación</a> <i class='icon-chevron-right'></i> Mostrar envio de $cuestionario->nombre_largo";
			$smarty->assign('_breadcrumb', $_breadcrumb);
			$smarty->assign('envio',$envio);
			$smarty->assign('cuestionario',$cuestionario);
			$smarty->assign('_nombre_pagina', $cuestionario->nombre_largo);
			$plantilla = 'cuestor/'.$cuestionario->nombre_corto.'_mostrar.tpl';
		}
		else
		{
			$mensaje = "No existe envio de este proyecto.";
			$mensaje_tipo = "Error";
			header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
		}
	}
	else
	{
		$mensaje = "No existe este proyecto.";
		$mensaje_tipo = "Error";
		header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
	}
}
else
{
	$mensaje = "Faltan parámetros para realizar esta acción";
	$mensaje_tipo = "Error";
	header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
