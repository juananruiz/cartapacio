<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet 
// Archivo: login_como.php
//---------------------------------------------------------------------------------------------------
// Permite a los administradores de la intranet iniciar sesión como otra persona
// para resolver incidencias
//---------------------------------------------------------------------------------------------------

include_once('../../cascara_core/lib/US/OpenSSO/InternalHandler.php');
include_once('../../cascara_core/lib/US/OpenSSO/User.php');

$smarty->assign('_nombre_pagina', 'Inicio de sesión simulado');

$usuario_sso = new \US\OpenSSO\User(CC_SSO_URL);

if ($usuario_sso->enforceAuthentication())
{ 
	$atributos = $usuario_sso->allAttributes(TRUE);
	//cambiado en prepro porque no lee dni,
  //if ($atributos['irispersonaluniqueid'][0] == 'pruebapas' && isset($_REQUEST['uvus']))
  if ($usuario_sso->uid == 'jjmc' && isset($_REQUEST['uvus']))
  {
    $uvus = sanitize($_REQUEST['uvus'], SQL);
    $usuario = new usuario();
    $usuario->load("uvus = '$uvus'");
    $_SESSION["usuario"] = $usuario;
  }
	$smarty->assign('atributos',$atributos);
}
?>
