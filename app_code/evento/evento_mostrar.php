<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: evento_mostrar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Muestra un evento con sus ficheros y eventos y ficheros.
//---------------------------------------------------------------------------------------------
$_nombre_pagina = "Mis eventos";
$_breadcrumb = "<a href='index.php?page=evento'>Evento</a> <i class='icon-chevron-right'></i>  $_nombre_pagina";

if (!empty($_REQUEST["id"]))
{
	$id_evento= sanitize($_REQUEST["id"],2);
	$evento = new evento_evento();
	$evento->load_joined("id = $id_evento");

	$condicion = ($evento->id_recurso == NULL) ? "id_persona = $usuario->id AND id_aplicacion = 1":"id_persona = $usuario->id AND id_aplicacion = 1 AND id_recurso = $evento->id_recurso";
	$permiso = new permiso();
	if ($permiso->tiene_permiso($condicion))
	{
		//ficheros del evento
		$fichero = new evento_fichero();
		$ficheros = $fichero->find_joined("id_evento = $id_evento"); 
		$smarty->assign('ficheros',$ficheros);
		//listado de subeventos y sus ficheros
		$subeventos = $evento->find("id_padre = $id_evento");
		foreach($subeventos as & $subevento)
		{
			//$ficheros = $fichero->ficheros_directorio($subevento->id);
			$ficheros = $fichero->find_joined("id_evento = $subevento->id");
			$subevento->ficheros = $ficheros;
		}
		$smarty->assign('subeventos',$subeventos);
		
		$smarty->assign('evento', $evento);
		$smarty->assign('_menu', 'editor');
		$smarty->assign('_breadcrumb', $_breadcrumb);
		$smarty->assign('_nombre_pagina', $_nombre_pagina);
		$plantilla = "evento/evento_mostrar.tpl";
	}
	else
	{
		$mensaje = "No tiene permisos para esta aplicación";
		$mensaje_tipo = "Error";
		header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
		$log = new log();
		$log->anotar(1,$usuario->id,0,'Listar unidades',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
	}
}
else
{
	$mensaje = "Faltan parámetros para mostrar el evento";
	$mensaje_tipo = "Error";
	header("location:index.php?page=evento/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
