<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: material_grabar.php
//--------------------------------------------------------------------------
// Graba un nuevo material en la base de datos
//--------------------------------------------------------------------------
global $usuario;

// Comprueba que el usuario tiene el rol adecuado 
if ($usuario->id_rol < 3)
{
  if (isset($_POST['id']))
  {
    $id = sanitize($_POST['id'], INT);
    $material = new material();
    $material->load("id = $id"); 
    $material->nombre = isset($_POST['nombre'])?sanitize($_POST['nombre'],SQL):'';
    $material->save();
    $smarty->assign("material", $material);
    $plantilla = "admin/material_grabar.tpl";
  }
  else
  {
    $error = "Falta el identificador del material a editar";
    $smarty->assign("error", $error);
  }
}
else
{
  $error = "No tiene permisos para editar materiales";
  $smarty->assign("error", $error);
}
