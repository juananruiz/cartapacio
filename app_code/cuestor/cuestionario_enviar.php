<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet - Cuestor
// Archivo: inicio.php
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

//print_r($_REQUEST);
$id_envio = sanitize($_REQUEST["id_envio"],INT);
$envio = new cuestor_envio();
if ($envio->load("id = $id_envio"))
{
	$id_cuestionario = sanitize($_REQUEST["id_cuestionario"],INT);

	if ($envio->id_usuario == $usuario->id)
	{
		$envio->fecha_fin = date("Y-m-d H:i:s");
		if ($envio->save())
		{
			$mensaje = "Envio realizado.";
			$mensaje_tipo = "Aviso";
			$url="/envio_mostrar&id=$id_cuestionario";
			$log = new log();
			$log->anotar(4,$usuario->id,$id_envio,'Fin Envio',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
		}
		else
		{
			$mensaje = "Envio no realizado.";
			$mensaje_tipo = "Error";
		}
		header("location: index.php?page=cuestor$url");
	}
	else
	{
			$mensaje = "No tiene permiso en este envio.";
			$mensaje_tipo = "Error";
			header("location: index.php?page=cuestor/cuestionario_cumplimentar&id=$id_cuestionario");
	}
}
else
{
			$mensaje = "No existe registro de este envio.";
			$mensaje_tipo = "Error";
			header("location: index.php?page=cuestor/cuestionario_cumplimentar&id=$id_cuestionario");
}
?>
