<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: iconografia_eliminar.php
//--------------------------------------------------------------------------
// Elimina de la base de datos un iconografia existente, borrando tambien,
// en su caso, los recursos asociados
//--------------------------------------------------------------------------
global $usuario;
global $plantilla;

if ($usuario->id_rol == 1)
{
  if (isset($_REQUEST['id']))
  { 
    $id = sanitize($_REQUEST['id'], INT);
    $iconografia = new iconografia();
    if ($iconografia->load("id = $id"))
    {
      $recurso = new recurso();
      $recurso->Find("id_iconografia = $id");
      foreach ($recursos as& $recurso)
      {
        $recurso->id_iconografia = 'NULL';
        $recurso->save();
      }
      $iconografia->delete();
      $mensaje = "Borrado completado";
      $smarty->assign("mensaje", $mensaje);
    }
    else
    {
      $mensaje = "No se ha podido borrar la iconografia por error de la base de datos";
      $smarty->assign("mensaje", $mensaje);
    }
  }
}
else
{
  $mensaje = "No tiene permisos para eliminar iconografias";
  $smarty->assign("mensaje", $mensaje);
}
