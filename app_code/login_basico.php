<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: login_basico.php
//--------------------------------------------------------------------------
// Permite iniciar sesión al usuario en el sistema y 
// lo redirecciona a la página de inicio
//--------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;
$smarty->assign('_nombre_pagina' , 'Inicio de sesión');

// Comprueba si viene del formulario
if (isset($_REQUEST['acceso']))
{
	// Comprueba que vengan los datos
	if (isset($_POST["correo"], $_POST["clave"]))
	{
		$correo = sanitize($_POST["correo"], SQL);
		$clave = md5($_POST["clave"]);
		$usuario = new usuario();
		if ($usuario->load_joined("correo = '$correo' AND clave = '$clave'")) 
		{
      if ($usuario->activo == 1)
      {
        $aviso = "Hola $usuario->nombre bienvenido al proyecto. ";
        if (isset($usuario->ultimo_acceso))
        {
          $ultimo_dia = date("j M Y", strtotime($usuario->ultimo_acceso));
          $aviso .= "Te hemos echado de menos desde que accediste el $ultimo_dia";
        }
        $usuario->ultimo_acceso = date("Y-m-d H:i:s");
        $usuario->save();
        // Esto es solo para la sesion y no se graba en la BD
        $usuario->inicio_sesion = date("H:i");
        $_SESSION['usuario'] = $usuario;
        header("location:index.php?aviso=$aviso");
      }
      else
      {
        $error = "Usuario bloqueado, contacte con un administrador";
        $smarty->assign('error',$error);
        $plantilla = 'login_basico.tpl';
      }
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
else
{
  // Si no viene del formulario mostramos el formulario
  $plantilla = "login_basico.tpl";
}
