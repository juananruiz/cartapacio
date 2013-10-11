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
	$id_fichero = sanitize($_REQUEST["id_fichero"],INT);
	$fichero = new evento_fichero();
	$fichero->load("id= $id_fichero");

	$id_evento = $fichero->id_evento;
	$evento = new evento_evento();
	$evento->load("id = $id_evento");

	if ($usuario)
	{
		$dir = CC_DIR_BASE."app_code/evento/uploads/$id_evento/$fichero->nombre";
		header('Content-Description: File Transfer');
		header('Content-Type: application/octet-stream');
		header('Content-Disposition: attachment; filename='.basename($dir));
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public');
		header('Content-Length: ' . filesize($dir));
		//ob_clean();
		//flush();
		readfile($dir);
		$mensaje  = "Fichero descargado.";
		$mensaje_tipo = "Aviso";
	}
	else
	{
		$mensaje  = "No tiene permiso para descargar el archivo.";
		$mensaje_tipo = "Error";
	}
}
else
{
	$mensaje = "Faltan parámetros para borrar el archivo";
	$mensaje_tipo = "Error";
	header("location:index.php?page=evento/inicio&mensaje=$mensaje&tipo=$mensaje_tipo");
}
$log = new log();
$log->anotar($id_app,$usuario->id,$id_fichero,'fichero',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
?>
