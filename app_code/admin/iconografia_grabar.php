<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: iconografia_grabar.php
//--------------------------------------------------------------------------
// Graba un nuevo iconografia en la base de datos
//--------------------------------------------------------------------------
global $usuario;

// Comprueba que el usuario tiene el rol adecuado 
if ($usuario->id_rol < 3)
{
  if (isset($_POST['id']))
  {
    $id = sanitize($_POST['id'], INT);
    $iconografia = new iconografia();
    $iconografia->load("id = $id"); 
    $iconografia->nombre = isset($_POST['nombre'])?sanitize($_POST['nombre'],SQL):'';
    $iconografia->save();
    $smarty->assign("iconografia", $iconografia);
    $plantilla = "admin/iconografia_grabar.tpl";
  }
  else
  {
    $error = "Falta el identificador del iconografia a editar";
    $smarty->assign("error", $error);
  }
}
else
{
  $error = "No tiene permisos para editar iconografias";
  $smarty->assign("error", $error);
}
