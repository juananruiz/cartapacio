<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet 
// Archivo: login_como.php
//---------------------------------------------------------------------------------------------------
// Permite a los administradores de la intranet iniciar sesión como otra persona
// para resolver incidencias
//---------------------------------------------------------------------------------------------------
$permiso = new permiso();
if ($permiso->unidad_recurso(3,$usuario->id,1,1,1))
{
	if (!empty($_REQUEST["modulo"]))
	{
		$modulo = sanitize($_REQUEST["modulo"],SQL);
		if ($modulo == 'simular')
		{
			$id_usuario = sanitize($_REQUEST["id_usuario"],INT);
			
			$usuario = new usuario();
			if ($usuario->load("id = $id_usuario"))
			{
				$_SESSION["usuario"] = $usuario;
				$mensaje = "Usuario simulado";
				$mensaje_tipo = "Aviso";
			}
			else
			{
				$mensaje = "Usuario NO simulado, por usuario inexsistente";
				$mensaje_tipo = "Error";
			}
			header("location:index.php?page=login_simulado&modulo=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
		}
		if ($modulo == 'inicio')
		{
			$smarty->assign('usuario',$usuario);
		}
		if ($modulo == 'filtro')
		{
			$cadena = sanitize($_REQUEST["cadena"],SQL);
			$limite = 5;
			if ($cadena == ''){$limite = 0;}
			$usuario = new usuario();
			$usuarios = $usuario->find("nif LIKE '%$cadena%'  OR apellidos LIKE '%$cadena%'  OR uvus LIKE '%$cadena%' LIMIT $limite ");
			$smarty->assign('usuarios',$usuarios); 
		}

		$smarty->assign('usuario_admin', $usuario->uvus);
		$smarty->assign('_nombre_pagina', 'Inicio de sesión simulado');
		$smarty->assign('modulo',$modulo);
		$plantilla = "login_simulado.tpl";
	}
	else
	{
		$mensaje = "Faltan parámetros para esta acción";
		$mensaje_tipo = "Error";
		header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
	}
}
else
{
	$mensaje = "No tiene permisos para esta acción";
	$mensaje_tipo = "Error";
	header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
