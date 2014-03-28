<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: iconografia_crear.php
//--------------------------------------------------------------------------
// Crea una nueva iconografia en la aplicación 
//--------------------------------------------------------------------------
global $usuario;
global $plantilla;

if ($usuario->id_rol == 1)
{
	$iconografia = new iconografia();
  $iconografia->activo = 1;
  if ($iconografia->save())
  {
    $smarty->assign("iconografia", $iconografia);
    $plantilla="admin/iconografia_crear.tpl";
  }
  else
  {
    $error = "No se ha podido crear la iconografia por error de la base de datos";
    $smarty->assign("error", $error);
  }
}
else
{
  $error = "No tiene permisos para crear iconografias";
  $smarty->assign("error", $error);
}
