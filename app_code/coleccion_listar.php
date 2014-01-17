<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: coleccion_listar.php
//--------------------------------------------------------------------------
// Lista de colecciones en la base de datos
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

$coleccion = new coleccion();
if ($usuario->id_rol < 3)
{
  $condicion = "true";
}
else
{
  $condicion = "activo = 1";
}
$colecciones = $coleccion->Find($condicion);
$smarty->assign('colecciones', $colecciones);
