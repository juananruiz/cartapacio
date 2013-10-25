<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: seccion_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba un nuevo seccion en la base de datos 
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

// Comprueba que el usuario tiene permisos para crear un nuevo seccion
// TODO

if (isset($_REQUEST['nombre']))
{
  $seccion = new seccion();
  $seccion->nombre = sanitize($_REQUEST['nombre'], SQL);
  $seccion->descripcion = isset($_REQUEST['descripcion'])?sanitize($_REQUEST['descripcion'], SQL):NULL;
  $seccion->notas = isset($_REQUEST['notas'])?sanitize($_REQUEST['notas'], SQL):NULL;

  // Estos no vienen del formulario
  $seccion->fecha_alta = date("Y-m-d H:m:i");
  $seccion->id_usuario = $usuario->id;
 
  if ($seccion->save())
  {
    header("location:index.php?page=admin/seccion_listar");
  }
  else
  {
    $error = "No se ha podido grabar el seccion en la base de datos";
    header("location:index.php?page=admin/seccion_crear&error=$error");
  }
}
else
{
  $error = "Faltan datos para crear un nuevo seccion";
  header("location:index.php?page=admin/seccion_crear&error=$error");
}
?>

