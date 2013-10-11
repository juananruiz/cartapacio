<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet - Cuestor
// Archivo: inicio.php
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
$permiso = new permiso();
if ($permiso->load("id_aplicacion = 4 AND id_persona = $usuario->id"))
{
	$id_envio = sanitize($_REQUEST["id_envio"],INT);
	$envio = new cuestor_envio();
	if ($envio->load("id = $id_envio"))
	{
		$envio->fecha_fin = NULL;
		if($envio->save())
		{
			$mensaje = "Envio reabierto.";
			$mensaje_tipo = "Aviso";
			$log = new log();
			$log->anotar(4,$usuario->id,$id_envio,'Envio reabierto',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
}
	}
}
?>
