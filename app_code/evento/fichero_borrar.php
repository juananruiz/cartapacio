<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: eventos_listar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Lista todos los eventos si eres Administrador o los autorizados para un usuairo.
//---------------------------------------------------------------------------------------------
if (!empty($_REQUEST["id_fichero"]))
{
	$retorno = $_REQUEST['retorno'];
	$t = $_REQUEST['t'];
	$id = $_REQUEST['id'];

	$id_fichero = sanitize($_REQUEST["id_fichero"],INT);
	$fichero = new evento_fichero();
	$fichero->load("id= $id_fichero");

	$id_evento = $fichero->id_evento;
	$evento = new evento_evento();
	$evento->load("id = $id_evento");

	$condicion = ($evento->id_recurso == NULL)? "id_persona = $usuario->id AND id_aplicacion = 1":"id_persona = $usuario->id AND id_aplicacion = 1 AND id_recurso = $evento->id_recurso";
	$permiso = new permiso();
	if ($permiso->tiene_permiso($condicion))
	{
		$dir = CC_DIR_BASE."app_code/evento/uploads/$id_evento/$fichero->nombre";
		if(unlink($dir))
		{
			if($fichero->delete())
			{
				$mensaje  = "Fichero borrado de base de datos y directorio.";
				$mensaje_tipo = "Aviso";
			}
			else
			{
				$mensaje  = "Fichero borrado del directorio.";
				$mensaje_tipo = "Aviso";
			}
		}
		header("location:index.php?page=$retorno&id=$id&t=$t&mensaje=$mensaje&tipo=$mensaje_tipo");
	}
	else
	{
		$mensaje  = "No tiene permiso para descargar el archivo.";
		$mensaje_tipo = "Error";
		header("location:index.php?page=evento/inicio&mensaje=$mensaje&tipo=$mensaje_tipo");
	}
}
else
{
	$mensaje = "Faltan parámetros para borrar el archivo";
	$mensaje_tipo = "Error";
	header("location:index.php?page=evento/inicio&mensaje=$mensaje&tipo=$mensaje_tipo");
}
?>
