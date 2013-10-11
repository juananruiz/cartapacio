<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: eventos_listar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Lista todos los eventos si eres Administrador o los autorizados para un usuairo.
//---------------------------------------------------------------------------------------------

if (isset($_REQUEST["id_padre"]))
{
	$id_padre = sanitize($_REQUEST["id_padre"],INT);
	$retorno = sanitize($_REQUEST["retorno"],SQL);	

	$evento_padre = new evento_evento();
	$evento_padre->load("id = $id_padre");
	if ($evento_padre->_saved == 1 AND $evento_padre->id_padre == 0)
	{
		$condicion = ($evento_padre->id_recurso == NULL)? "id_persona = $usuario->id AND id_aplicacion = 1":"id_persona = $usuario->id AND id_aplicacion = 1 AND id_recurso = $evento_padre->id_recurso";
		//$condicion = "id_persona = $usuario->id AND id_aplicacion = 1";
		$permiso = new permiso();
		if ($permiso->tiene_permiso($condicion))
		{
			$subevento = new evento_evento();
			$subevento->id_autor = $usuario->id;
			$subevento->fecha_entrada = date("Y-m-d H:m:s");
			$subevento->id_padre = $id_padre;
			$subevento->id_estado = 2;
			$subevento->id_recurso = $evento_padre->id_recurso;
			$subevento->id_publico = $evento_padre->id_publico;
			$subevento->id_novedad_intranet = $evento_padre->id_novedad_intranet;
			$subevento->id_novedad_unidad = $evento_padre->id_novedad_unidad;
			$subevento->usar_fecha_caducidad = $evento_padre->usar_fecha_caducidad;
			$subevento->fecha_inicio = $evento_padre->fecha_inicio;
			$subevento->fecha_fin = $evento_padre->fecha_fin;
			if($subevento->save())
			{
				header("location:index.php?page=evento/subevento_editar&id=$subevento->id&retorno=$retorno");
			}
			else
			{
				$mensaje = "No se ha podido crear el subevento";
				$mensaje_tipo = "Error";
				header("location:index.php?page=evento/eventos_listar&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
				$log = new log();
				$log->anotar(1,$usuario->id,0,'Crear evento',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
			}
		}
		else
		{
			$mensaje = "1 No tiene permisos en este evento";
			$mensaje_tipo = "Error";
			header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
			$log = new log();
			$log->anotar(1,$usuario->id,0,'Crear evento',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
		}	
	}
	else
	{
		$mensaje = "El evento padre no existe.";
		$mensaje_tipo = "Error";
		header("location:index.php?page=evento/evento_editar&id={$evento->id}&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
	}
}
else
{
	$mensaje = "Faltán parámetros para realizar esta acción";
	$mensaje_tipo = "Error";
	header("location:index.php?page=evento/evento_editar&id={$evento->id}&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
	$log = new log();
	$log->anotar(1,$usuario->id,0,'Crear evento',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
}
?>
