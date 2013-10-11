<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: eventos_listar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Lista todos los eventos si eres Administrador o los autorizados para un usuairo.
//---------------------------------------------------------------------------------------------

$condicion = "id_persona = $usuario->id AND id_aplicacion = 1";
$permiso = new permiso();
if ($permiso->tiene_permiso($condicion))
{
	$evento = new evento_evento();
	$evento->id_autor = $usuario->id;
	$evento->fecha_entrada = date("Y-m-d H:m:s");
	$evento->id_padre = 0;
	$evento->id_estado = 2;
	if($evento->save())
	{
		header("location:index.php?page=evento/evento_editar&id=$evento->id");
	}
	else
	{
		$mensaje = "No se ha podido crear el evento";
		$mensaje_tipo = "Error";
		header("location:index.php?page=evento/eventos_listar&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
		$log = new log();
		$log->anotar(1,$usuario->id,0,'Listar unidades',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
	}
}
else
{
	$mensaje = "No tiene permisos para esta aplicación";
  $mensaje_tipo = "Error";
	header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
	$log = new log();
	$log->anotar(1,$usuario->id,0,'Listar unidades',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
}
?>
