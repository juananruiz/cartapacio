<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet - Cuestor
// Archivo: inicio.php
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

if (!empty($_REQUEST["id"]))
{
  $id_cuestionario = sanitize($_REQUEST["id"],INT);
  $cuestionario = new cuestor_cuestionario();
  $cuestionario->load_joined("id = $id_cuestionario");
  if ($cuestionario->_saved == 1)
  {
		if ($cuestionario->fecha_fin >= date("Y-m-d"))
		{
			//grabamos el envio
			$condicion = "id_usuario = $usuario->id AND id_cuestionario = $id_cuestionario";
			$envio = new cuestor_envio();
			if ($envio->load($condicion) == false)
			{
				$envio->id_cuestionario = $id_cuestionario;
				$envio->id_usuario = $usuario->id;
				$envio->fecha_inicio = date("Y-m-j H:i:s");
				$envio->fecha_fin = NULL;
				if($envio->save())
				{
					$pregunta = new cuestor_pregunta();
					$preguntas = $pregunta->find("id_cuestionario = $id_cuestionario");
					foreach($preguntas as $pregunta)
					{
						$respuesta = new cuestor_respuesta();
						$respuesta->id_cuestionario = $id_cuestionario;
						$respuesta->id_envio = $envio->id;
						$respuesta->id_pregunta = $pregunta->id;
						$respuesta->valor_cerrado = NULL;
						$respuesta->valor_abierto = NULL;
						if(!$respuesta->save())
						{
							$mensaje = "No se han  generado todas las preguntas.";
							$mensaje_tipo = "Error";
							header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
						}
					}
					$log = new log();
					$log->anotar(4,$usuario->id,$envio->id,'Inicio Envio',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),'Ha iniciado un envio','Aviso');
					header("location: index.php?page=cuestor/cuestionario_cumplimentar&id=$id_cuestionario");
				}
				else
				{
					$mensaje = "No se ha podido generar envio para este cuestionario y usuario.";
					$mensaje_tipo = "Error";
					header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
				}
			}
			else
			{
				//supuesto en el que ya esta generado el envio y las respuestas
				$envio->load_joined_indexado($condicion);
			}
			$_breadcrumb = "<a href='index.php?page=cuestor'>Participación</a> <i class='icon-chevron-right'></i> $cuestionario->nombre_largo";
			$smarty->assign('envio',$envio);
			$smarty->assign('cuestionario',$cuestionario);
			$smarty->assign('_breadcrumb', $_breadcrumb);
			$smarty->assign('_nombre_pagina', $cuestionario->nombre_largo);
			$plantilla = 'cuestor/' . $cuestionario->nombre_corto . '.tpl';
		}
		else
		{
			$mensaje = "El cuestionario está cerrado.";
			$mensaje_tipo = "Error";
			header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
		}
	}
  else
  {
    $mensaje = "No existe este cuestionario.";
    $mensaje_tipo = "Error";
    header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
  }
}
else
{
  $mensaje = "Faltan parámetros para realizar esta acción";
  $mensaje_tipo = "Error";
  header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
