<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: material_crear.php
//--------------------------------------------------------------------------
// Crea un nuevo material en la aplicación 
//--------------------------------------------------------------------------
global $usuario;
global $plantilla;

if ($usuario->id_rol == 1)
{
	$material = new material();
  if ($material->save())
  {
    $smarty->assign("material", $material);
    $plantilla="admin/material_crear.tpl";
  }
  else
  {
    $error = "No se ha podido crear el material por error de la base de datos";
    $smarty->assign("error", $error);
  }
}
else
{
  $error = "No tiene permisos para crear materiales";
  $smarty->assign("error", $error);
}
