<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: iconografia_asociar.php
//--------------------------------------------------------------------------
// Asocia una iconografia a un recurso
//--------------------------------------------------------------------------
global $usuario;
global $plantilla;

// Comprueba que el usuario tiene el rol adecuado 
if ($usuario->id_rol < 4)
{
  if (isset($_REQUEST['id_recurso']) && isset($_REQUEST['id_iconografia']))
  {
    $id_recurso = sanitize($_REQUEST['id_recurso'], INT);
    $id_iconografia = sanitize($_REQUEST['id_iconografia'], INT);
    
    $recurso = new recurso();
    $recurso->load("id = $id_recurso");
    $recurso->id_iconografia = $id_iconografia;
    $recurso->save();

    $iconografia = new iconografia();
    $iconografia->load("id = $id_iconografia");
    $smarty->assign("iconografia", $iconografia);
    $plantilla = "admin/iconografia_asociar.tpl";
  }
  else
  {
    $error = "Falta el identificador de iconografia y/o recurso";
    $smarty->assign("error", $error);
  }
}
else
{
  $error = "No tiene permisos para asociar iconografias";
  $smarty->assign("error", $error);
}
