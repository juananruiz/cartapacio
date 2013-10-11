<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet 
// Archivo: inicio.php
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
$_nombre_pagina = "Visor";
$_breadcrumb = "<a href='index.php?page=inicio'>Intranet</a> <i class='icon-chevron-right'></i>  $_nombre_pagina";

if (!empty($_REQUEST["id"]))
{
	$id = sanitize($_REQUEST["id"],INT);
	$condicion = "id = $id";
	$evento = new evento_evento();
	if ($evento->load_joined($condicion))
	{
//		print_r($evento);
		$smarty->assign('evento',$evento);
		$smarty->assign('_breadcrumb', $_breadcrumb);
		$smarty->assign('_nombre_pagina', $_nombre_pagina);
		$plantilla = "visor_evento.tpl";
	}
	else
	{
		$mensaje = "No existe el identificador.";
		$mensaje_tipo = "Error";
		header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
	}
}
else
{
	$mensaje = "Faltan parámetros.";
	$mensaje_tipo = "Error";
	header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
