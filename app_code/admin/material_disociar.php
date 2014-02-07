<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: material_disociar.php
//--------------------------------------------------------------------------
// Disocia un material de un recurso
//--------------------------------------------------------------------------
global $usuario;

// Comprueba que el usuario tiene el rol adecuado 
if ($usuario->id_rol < 4)
{
  if (isset($_REQUEST['id_recurso']) && isset($_REQUEST['id_material']))
  {
    $material_recurso = new material_recurso();
    $id_recurso = sanitize($_REQUEST['id_recurso'], INT);
    $id_material = sanitize($_REQUEST['id_material'], INT);
    if ($material_recurso->load("id_material=$id_material AND id_recurso=$id_recurso"))
    {
      $material_recurso->delete();
      $smarty->assign("mensaje", "Exito");
    }
    else
    {
      $smarty->assign("mensaje", "Error");
    }
  }
  else
  {
    $error = "Falta el identificador del material y/o el recurso";
    $smarty->assign("error", $error);
  }
}
else
{
  $error = "No tiene permisos para disociar materiales";
  $smarty->assign("error", $error);
}
