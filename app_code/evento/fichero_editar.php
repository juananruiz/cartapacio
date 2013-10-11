<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: eventos_listar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Lista todos los eventos si eres Administrador o los autorizados para un usuairo.
//---------------------------------------------------------------------------------------------
if (!empty($_REQUEST['id_fichero']))
{
	$_nombre_pagina = "Evento editar";
	$_breadcrumb = "<a href='index.php?page=evento'>Evento</a> <i class='icon-chevron-right'></i>  $_nombre_pagina";

	$id_fichero = sanitize($_REQUEST["id_fichero"],INT);
	$retorno = sanitize($_REQUEST["retorno"],SQL);
	

	$fichero = new evento_fichero();
	$fichero->load("id = $id_fichero");

	$evento = new evento_evento();
	$evento->load("id = $fichero->id_evento");

	switch($retorno)
	{
		case 'evento/evento_editar':
			$id = $evento->id;
			$t = 'ficheros';
			break;
		case 'evento/evento_mostrar':
			$id = ($evento->id_padre == 0) ? $evento->id:$evento->id_padre;
			$t = '';
			break;
		case 'evento/subevento_editar':
			$id = $evento->id;
			$t = 'ficheros';
			break;
	}
	$retorno = $retorno.'&id='.$id."&t=".$t;

	$id_recurso = (!empty($evento->id_recurso)) ? $evento->id_recurso:NULL;
	$condicion = ($id_recurso == NULL)? "id_persona = $usuario->id AND id_aplicacion = 1":"id_persona = $usuario->id AND id_aplicacion = 1 AND id_recurso = $id_recurso";

	$permiso = new permiso();
	if ($permiso->tiene_permiso($condicion))
	{
		//estados
		$estado = new evento_estado();
		$estados = $estado->find("1");
		$smarty->assign('estados', $estados);
		$smarty->assign('retorno',$retorno);
		$smarty->assign('evento',$evento);
		$smarty->assign('fichero',$fichero);
		$smarty->assign('_menu', 'editor');
		$smarty->assign('_breadcrumb', $_breadcrumb);
		$smarty->assign('_nombre_pagina', $_nombre_pagina);
		$plantilla = "evento/fichero_editar.tpl";
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
	$mensaje = "Faltan parámetros para editar el evento.";
	$mensaje_tipo = "Error";
	header("location:index.php?page=evento/eventos_listar&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
