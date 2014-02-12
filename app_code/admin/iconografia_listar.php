<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: iconografia_listar.php
//--------------------------------------------------------------------------
// Lista de iconografias en la base de datos
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

if ($usuario->id_rol < 3)
{
  $iconografia = new iconografia();
  $iconografias = $iconografia->Find_con_usos("true");
  $smarty->assign('iconografias', $iconografias);
}
else
{
  $error = "No tiene permisos suficientes para listar iconografias";
  header("location:index.php?error=$error");
}
