<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: material_listar.php
//--------------------------------------------------------------------------
// Lista de materiales en la base de datos
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

if ($usuario->id_rol < 3)
{
  $material = new material();
  $materiales = $material->Find_con_usos("true");
  $smarty->assign('materiales', $materiales);
}
else
{
  $error = "No tiene permisos suficientes para listar materiales";
  header("location:index.php?error=$error");
}
