<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: evento_editar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Muestra el formulario para editar los datos del evento con posibildad de crear
// subeventos.
//---------------------------------------------------------------------------------------------
$_nombre_pagina = "Subevento editar";
$_breadcrumb = "<a href='index.php?page=evento'>Evento</a> <i class='icon-chevron-right'></i>  $_nombre_pagina";
$retorno = sanitize($_REQUEST["retorno"],SQL);	
if (!empty($_REQUEST['id']))
{
	$id_subevento = sanitize($_REQUEST['id'],2);
	$subevento = new evento_evento();
	$subevento->load_joined("id = $id_subevento");

	if ($subevento->_saved == 1)
	{
/*		switch($retorno)
		{
			case 'evento/evento_editar':
				$retorno = $retorno."&id=".$subevento->id_padre;
				$t = 'subeventos';
				break;
			case 'evento/evento_mostrar':
				$retorno = $retorno."&id=".$subevento->id_padre;
				$t = '';
				break;
			default:
				$t = '';
				$retorno = 'evento/eventos_listar';
		}
*/		
		$evento_padre = new evento_evento();
		$evento_padre->load_joined("id = $subevento->id_padre AND id_padre = 0");
		$smarty->assign('evento_padre',$evento_padre);

		if ($evento_padre->_saved == 1)
		{
			$condicion = "id_persona = $usuario->id AND id_aplicacion = 1";
			$permiso = new permiso();
			if ($permiso->tiene_permiso($condicion))
			{
				$smarty->assign('evento', $subevento);

				//ficheros del evento
				$fichero = new evento_fichero();
				$ficheros = $fichero->find_joined("id_evento = $id_subevento"); 
				$smarty->assign('ficheros',$ficheros);
			
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
				$plantilla = "evento/subevento_editar.tpl";
			}
			else
			{
				$mensaje = "No tiene permisos en este subevento";
				$mensaje_tipo = "Error";
				header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
				$log = new log();
				$log->anotar(1,$usuario->id,0,'Crear evento',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
			}
		}
		else
		{
			$mensaje = "Esta intentando editar un evento desde un subevento.";
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
	$mensaje = "Faltan parámetros para editar el subevento.";
	$mensaje_tipo = "Error";
	header("location:index.php?page=evento/eventos_listar&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
