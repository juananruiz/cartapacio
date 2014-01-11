<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: login_basico.php
//--------------------------------------------------------------------------
// Permite iniciar sesión al usuario en el sistema, lo lleva a la página que 
// haya pedido o a la página por defecto
//--------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;
$smarty->assign('_nombre_pagina' , 'Inicio de sesión');

// Comprueba si viene del formulario
if (isset($_REQUEST['acceso']))
{
	// Comprueba que vengan los datos
	if (isset($_REQUEST["correo"], $_POST["clave"]))
	{
		$correo = sanitize($_POST["correo"],2);
		$clave = md5($_POST["clave"]);
		$usuario = new usuario();
		if ($usuario->load_joined("correo = '$correo' AND clave = '$clave'")) 
		{
			$_SESSION['usuario'] = $usuario;
			header("location:index.php");
		}
		else 
		{
			$error = "Usuario o clave incorrectos.";
			$smarty->assign('error',$error);
			$plantilla = 'login_basico.tpl';
		}
	}
	else 
	{
		// Si falta algun parametro volvemos al formulario y avisamos
		$error = "Indique su nombre de usuario y clave.";
		$smarty->assign('error',$error);
		$plantilla = 'login_basico.tpl';
	}
}
else if(isset($_REQUEST["logout"]))
{	
	// Si ha solicitado logout cerramos sesión y enviamos a inicio
	session_unset();
  header("location:index.php");
}
else
{
  // Si no viene del formulario, ni de logout, mostramos el formulario
  $plantilla = "login_basico.tpl";
}
