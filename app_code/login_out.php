<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet 
// Archivo: login_out.php
//---------------------------------------------------------------------------------------------------
// Controlador que tramita el logout de la intranet y, si el usuario lo desea de SSO
//---------------------------------------------------------------------------------------------------

include_once('../../cascara_core/lib/US/OpenSSO/InternalHandler.php');
include_once('../../cascara_core/lib/US/OpenSSO/User.php');

// Graba registro en el log
$log = new log();
$log->id_persona = $usuario->id;
$log->pagina = "login_out";
$log->resultado = "exito";
$log->fecha = date("Y-m-d H:i:s");
//$log->mensaje = "";
$log->save();

// Elimina variables de usuario y sesión
unset($_SESSION['usuario']);
unset($usuario);

//Cierra sesión en ADAS redirigiendo al portal
$usuario_sso = new \US\OpenSSO\User(CC_SSO_URL);
$usuario_sso->logout(CC_URL_PORTAL);
?>
