<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: usuario_listar.php
//---------------------------------------------------------------------------------------------------
// Lista de usuarios en la base de datos
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

$usuario = new usuario();
$usuarios = $usuario->Find("true");
$smarty->assign('usuarios', $usuarios);
?>
