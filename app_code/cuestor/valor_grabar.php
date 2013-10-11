<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet - Cuestor
// Archivo: inicio.php
//---------------------------------------------------------------------------------------------------
// Graba en la tabla CUESTOR_respuestas la respuesta a una sola pregunta (vía AJAX)
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

$id_envio = sanitize($_REQUEST["id_envio"],INT);
$envio = new cuestor_envio();

if ($envio->load("id = $id_envio AND fecha_fin IS NULL"))
{
	$id_cuestionario = sanitize($_REQUEST["id_cuestionario"],INT);
	$id_pregunta = sanitize($_REQUEST["id_pregunta"],INT);
	$valor_cerrado = sanitize($_REQUEST["valor_cerrado"],HTML);
	$valor_abierto = sanitize($_REQUEST["valor_abierto"],HTML);

	if (!empty($id_cuestionario) AND !empty($id_pregunta) AND !empty($valor_cerrado) AND !empty($id_envio))
	{
		if ($envio->id_usuario == $usuario->id)
		{
			$respuesta = new cuestor_respuesta();
      // Juanan a Jesús: ¿qué es este Load con mayúscula?
			if ($respuesta->Load("id_cuestionario = $id_cuestionario AND id_envio = $id_envio AND id_pregunta = $id_pregunta"))
			{
				//existe se actualiza
				$respuesta->valor_cerrado = $valor_cerrado;
				$respuesta->valor_abierto = $valor_abierto;
			}
			else
			{
				//primera vez graba
				$respuesta->id_envio= $id_envio;
				$respuesta->id_cuestionario = $id_cuestionario;
				$respuesta->id_pregunta = $id_pregunta;
				$respuesta->valor_cerrado = $valor_cerrado;
				$respuesta->valor_abierto = $valor_abierto;
			}
			$respuesta->save();
		}
		else
		{
			//escribir el log un error de intento de acceso a un envio de otro usuario
		}
	}
	else
	{
		//escribir el log un error de falta de parámetros obligatorios
	}
}
else
{
	//escribir el log un error de id de envío inexistente o cerrado
}
?>
