<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: evento_editar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Muestra el formulario para editar los datos del evento con posibildad de crear
// subeventos.
//---------------------------------------------------------------------------------------------
$_nombre_pagina = "Evento editar";
$_breadcrumb = "<a href='index.php?page=evento'>Evento</a> <i class='icon-chevron-right'></i>  $_nombre_pagina";
$retorno = sanitize($_REQUEST["retorno"],SQL);
if (!empty($_REQUEST['id']))
{
	$id_evento = sanitize($_REQUEST['id'],2);
	$evento = new evento_evento();
	$evento->load_joined("id = $id_evento");

	if ($evento->_saved == 1)
	{
		switch($retorno)
		{
			case 'evento/evento_mostrar':
				$retorno = $retorno."&id=".$evento->id;
				break;
			case 'evento/eventos_listar':
				$retorno = $retorno;
				break;
			default:
				$retorno = 'evento/eventos_listar';
		}

		if ($evento->id_padre == 0)
		{
			$condicion = ($evento->id_recurso == NULL)? "id_persona = $usuario->id AND id_aplicacion = 1":"id_persona = $usuario->id AND id_aplicacion = 1 AND id_recurso = $evento->id_recurso";
			$permiso = new permiso();
			if ($permiso->tiene_permiso($condicion))
			{
				$smarty->assign('evento', $evento);
				//recursos del usuario
				$condicion = "SELECT eu.nombre AS unidad,eu.id AS id_unidad FROM `AA_permisos` p 
				LEFT JOIN EVENTO_recursos er ON p.id_recurso = er.id
				LEFT JOIN EVENTO_unidades eu ON er.id_unidad = eu.id
				WHERE id_persona = $usuario->id AND id_aplicacion = 1 GROUP BY eu.id";

				$permiso = new permiso();
				$permisos = $permiso->arbol_permisos_usuario($condicion);
				$smarty->assign('permisos', $permisos);
				//subeventos del evento
				$condicion = "id_padre = $id_evento";
				$subevento = new evento_evento();
				$subeventos = $subevento->find($condicion);
				$smarty->assign('subeventos',$subeventos);
				//ficheros del evento
				$fichero = new evento_fichero();
				$ficheros = $fichero->find_joined("id_evento = $id_evento"); 
				$smarty->assign('ficheros',$ficheros);
				//estados
				$estado = new evento_estado();
				$estados = $estado->find("1");
				$smarty->assign('estados', $estados);
				//datos para tpl
				$t = (isset($_REQUEST["t"]))?sanitize($_REQUEST["t"],SQL):NULL;
				$smarty->assign('t',$t);
				$smarty->assign('retorno',$retorno);
				$smarty->assign('_menu', 'editor');
				$smarty->assign('_breadcrumb', $_breadcrumb);
				$smarty->assign('_nombre_pagina', $_nombre_pagina);
				$smarty->assign('filemaxsize',substr(ini_get("upload_max_filesize"), 0, -1)*1024000 );
				$smarty->assign('evento', $evento);
				$plantilla = "evento/evento_editar.tpl";
			}
			else
			{
				$mensaje = "No tiene permisos para esta aplicación y/o recurso";
				$mensaje_tipo = "Error";
				header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
				$log = new log();
				$log->anotar(1,$usuario->id,0,'evento_grabar',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
			}
		}
		else
		{
			$mensaje = "Esta intentando editar un subevento desde un evento.";
			$mensaje_tipo = "Error";
			header("location:index.php?page=evento/eventos_listar&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
		}
	}
	else
	{
		$mensaje = "Parámetro incorrecto.";
		$mensaje_tipo = "Error";
		header("location:index.php?page=evento/eventos_listar&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
	}
}
else
{
	$mensaje = "Faltan parámetros para editar el evento.";
	$mensaje_tipo = "Error";
	header("location:index.php?page=evento/eventos_listar&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
