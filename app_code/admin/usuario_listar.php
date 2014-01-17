<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: usuario_listar.php
//--------------------------------------------------------------------------
// Lista de usuarios en la base de datos
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

if ($usuario->id_rol < 4)
{
  $perfil = new usuario();
  $usuarios = $perfil->Find_joined("true");
  $smarty->assign('usuarios', $usuarios);
}
else
{
  $error = "No tiene permisos suficientes para listar usuarios";
  header("location:index.php?error=$error");
}
