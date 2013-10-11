<?php
//---------------------------------------------------------------------------------------------
// Aplicación: Comunica / Intranet
//---------------------------------------------------------------------------------------------
// Archivo: evento_leer.php
//---------------------------------------------------------------------------------------------
// Descripcion: Muestra un evento padre con sus subeventos o un evento hijo con enlace al padre
//---------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
$mensaje; // mensaje de error o aviso
$mensaje_tipo; // determina si el mensaje es de error o aviso
$id; // identificador del evento actual
$evento; // objeto que apunta al evento actual
$subeventos; // array de subeventos, si los hay
$evento_padre; // objeto que apunta al padre del actual ¿hace falta o va dentro de $evento?


if (!empty($_REQUEST["id"]))
{
	$id= sanitize($_REQUEST["id"],2);
	$evento = new evento_evento();
	if ($evento->load_joined("id = $id"))
	{
    if ($evento->id_padre > 0)
    {
      // Es un evento hijo, cargo también el padre
      $evento_padre = new evento_evento();
      $evento_padre->load("id = $evento->id_padre");
      $smarty->assign("evento_padre", $evento_padre);
		}
    $smarty->assign("evento", $evento);
    $smarty->assign('_nombre_pagina', $evento->nombre_corto);
    $plantilla = "evento_leer.tpl";
	}
	else
	{
		$mensaje = "No encontramos la información que ha solicitado";
		$mensaje_tipo = "Error";
		header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
	}
}
else
{
	$mensaje = "No se ha especificado la información que desea consultar";
	$mensaje_tipo = "Error";
	header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>

