<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: estilo_grabar.php
//--------------------------------------------------------------------------
// Graba un nuevo estilo en la base de datos
//--------------------------------------------------------------------------
global $usuario;

// Comprueba que el usuario tiene el rol adecuado 
if ($usuario->id_rol < 3)
{
  if (isset($_POST['id']))
  {
    $id = sanitize($_POST['id'], INT);
    $estilo = new estilo();
    $estilo->load("id = $id"); 
    $estilo->nombre = isset($_POST['nombre'])?sanitize($_POST['nombre'],SQL):'';
    $estilo->save();
    $smarty->assign("estilo", $estilo);
    $plantilla = "admin/estilo_grabar.tpl";
  }
  else
  {
    $error = "Falta el identificador del estilo a editar";
    $smarty->assign("error", $error);
  }
}
else
{
  $error = "No tiene permisos para editar estilos";
  $smarty->assign("error", $error);
}
