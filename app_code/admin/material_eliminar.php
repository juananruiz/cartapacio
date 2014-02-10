<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: material_eliminar.php
//--------------------------------------------------------------------------
// Elimina de la base de datos un material existente, borrando tambien,
// en su caso, los recursos asociados
//--------------------------------------------------------------------------
global $usuario;
global $plantilla;

if ($usuario->id_rol == 1)
{
  if (isset($_REQUEST['id']))
  { 
    $id = sanitize($_REQUEST['id'], INT);
    $material = new material();
    if ($material->load("id = $id"))
    {
      $material_recurso = new material_recurso();
      $material_recurso->Delete_many("id_material = $id");
      $material->delete();
      $mensaje = "Borrado completado";
      $smarty->assign("mensaje", $mensaje);
    }
    else
    {
      $mensaje = "No se ha podido borrar el material por error de la base de datos";
      $smarty->assign("mensaje", $mensaje);
    }
  }
}
else
{
  $mensaje = "No tiene permisos para eliminar materiales";
  $smarty->assign("mensaje", $mensaje);
}
