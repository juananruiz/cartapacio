<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: estilo_listar.php
//--------------------------------------------------------------------------
// Lista de estilos en la base de datos
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

if ($usuario->id_rol < 3)
{
  $estilo = new estilo();
  $estilos = $estilo->Find_con_usos("true");
  $smarty->assign('estilos', $estilos);
}
else
{
  $error = "No tiene permisos suficientes para listar estilos";
  header("location:index.php?error=$error");
}
