<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: autor_listar.php
//--------------------------------------------------------------------------
// Lista de autores en la base de datos
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

$autor = new autor();
if ($usuario->id_rol < 3)
{
  $condicion = "true";
}
else
{
  $condicion = "activo = 1";
}
$autores = $autor->Find_joined($condicion);
$smarty->assign('autores', $autores);
