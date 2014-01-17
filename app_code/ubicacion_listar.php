<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: ubicacion_listar.php
//--------------------------------------------------------------------------
// Lista de ubicaciones en la base de datos
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

$ubicacion = new ubicacion();
if ($usuario->id_rol < 3)
{
  $condicion = "true";
}
else
{
  $condicion = "activo = 1";
}
$ubicaciones = $ubicacion->Find($condicion);
$smarty->assign('ubicaciones', $ubicaciones);
