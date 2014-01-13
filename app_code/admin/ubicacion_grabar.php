<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: ubicacion_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba un nuevo ubicacion en la base de datos 
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

// Comprueba que el usuario tiene permisos para crear un nuevo ubicacion
// TODO

if (isset($_REQUEST['nombre']))
{
  $ubicacion = new ubicacion();
  $ubicacion->nombre = sanitize($_REQUEST['nombre'], SQL);
  $ubicacion->descripcion = isset($_REQUEST['descripcion'])?sanitize($_REQUEST['descripcion'], SQL):NULL;
  $ubicacion->notas = isset($_REQUEST['notas'])?sanitize($_REQUEST['notas'], SQL):NULL;

  // Estos no vienen del formulario
  //TODO: grabar usuario que la crea
  $ubicacion->activo = 1;
  $ubicacion->fecha_alta = date("Y-m-d H:m:i");
  $ubicacion->id_usuario = $usuario->id;
 
  if ($ubicacion->save())
  {
    header("location:index.php?page=ubicacion_listar");
  }
  else
  {
    $error = "No se ha podido grabar el ubicacion en la base de datos";
    header("location:index.php?page=admin/ubicacion_crear&error=$error");
  }
}
else
{
  $error = "Faltan datos para crear un nuevo ubicacion";
  header("location:index.php?page=admin/ubicacion_crear&error=$error");
}
?>

