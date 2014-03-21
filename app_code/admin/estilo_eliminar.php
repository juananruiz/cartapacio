<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: estilo_eliminar.php
//--------------------------------------------------------------------------
// Elimina de la base de datos un estilo existente, borrando tambien,
// en su caso, los recursos asociados
//--------------------------------------------------------------------------
global $usuario;
global $plantilla;

if ($usuario->id_rol == 1)
{
  if (isset($_REQUEST['id']))
  { 
    $id = sanitize($_REQUEST['id'], INT);
    $estilo = new estilo();
    if ($estilo->load("id = $id"))
    {
      $recurso = new recurso();
      if ($recursos = $recurso->Find("id_estilo = $id"))
      {
        foreach ($recursos as& $recurso)
        {
          $recurso->id_estilo = 'NULL';
          $recurso->save();
        }
      }
      $estilo->delete();
      $mensaje = "Borrado completado";
      $smarty->assign("mensaje", $mensaje);
    }
    else
    {
      $mensaje = "No se ha podido borrar el estilo por error de la base de datos";
      $smarty->assign("mensaje", $mensaje);
    }
  }
}
else
{
  $mensaje = "No tiene permisos para eliminar estilos";
  $smarty->assign("mensaje", $mensaje);
}
