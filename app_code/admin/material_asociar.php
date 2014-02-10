<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: material_asociar.php
//--------------------------------------------------------------------------
// Asocia un material a un recurso
//--------------------------------------------------------------------------
global $usuario;
global $plantilla;

// Comprueba que el usuario tiene el rol adecuado 
if ($usuario->id_rol < 4)
{
  if (isset($_REQUEST['id_recurso']) && isset($_REQUEST['id_material']))
  {
    $material_recurso = new material_recurso();
    $material_recurso->id_recurso = sanitize($_REQUEST['id_recurso'], INT);
    $material_recurso->id_material = sanitize($_REQUEST['id_material'], INT);
    $material_recurso->save();
    $material = new material();
    $material->load("id = $material_recurso->id_material");
    $smarty->assign("material", $material);
    $smarty->assign("id_recurso", $material_recurso->id_recurso);
    $plantilla = "admin/material_asociar.tpl";
  }
  else
  {
    $error = "Falta el identificador del material y/o el recurso";
    $smarty->assign("error", $error);
  }
}
else
{
  $error = "No tiene permisos para asociar materiales";
  $smarty->assign("error", $error);
}
