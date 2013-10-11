<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: evento_editar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Muestra el formulario para editar los datos del evento con posibildad de crear
// subeventos.
//---------------------------------------------------------------------------------------------
if (!empty($_REQUEST['id_fichero']))
{
	$retorno = $_REQUEST['retorno'];
	$t = $_REQUEST['t'];
	$id = $_REQUEST['id'];

	$id_fichero = sanitize($_REQUEST['id_fichero'],INT);

	$fichero = new evento_fichero();
	$fichero->load("id = $id_fichero");
	
	$evento = new evento_evento();
	$evento->load_joined("id = $fichero->id_evento");
	$condicion = ($evento->id_recurso == NULL) ? "id_persona = $usuario->id AND id_aplicacion = 1":"id_persona = $usuario->id AND id_aplicacion = 1 AND id_recurso = $evento->id_recurso";

	$permiso = new permiso();
	if ($permiso->tiene_permiso($condicion))
	{
	
		$fichero->descripcion = sanitize($_REQUEST["descripcion"],SQL);
		$fichero->id_estado = sanitize($_REQUEST["id_estado"],INT);
		if ($fichero->save())
		{
			$mensaje = "Fichero actualizado.";
			$mensaje_tipo = "Aviso";
		}
		else
		{
			$mensaje = "No se ha podido actualizar el fichero.";
			$mensaje_tipo = "Error";
		}
		//Redirigir a la página que llamó al controlador fichero editar
		header("location:index.php?page=$retorno&id=$id&t=$t&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
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
	$mensaje = "Faltan parámetros para editar el evento.";
	$mensaje_tipo = "Error";
	header("location:index.php?page=evento/eventos_listar&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
