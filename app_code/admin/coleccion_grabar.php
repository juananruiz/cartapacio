<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: coleccion_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba un nuevo coleccion en la base de datos 
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

// Comprueba que el usuario tiene permisos para crear un nuevo coleccion
// TODO

if (isset($_REQUEST['nombre']))
{
  $coleccion = new coleccion();
  $coleccion->nombre = sanitize($_REQUEST['nombre'], SQL);
  $coleccion->descripcion = isset($_REQUEST['descripcion'])?sanitize($_REQUEST['descripcion'], SQL):NULL;
  $coleccion->notas = isset($_REQUEST['notas'])?sanitize($_REQUEST['notas'], SQL):NULL;

  // Estos no vienen del formulario
  $coleccion->activo = 1;
  $coleccion->fecha_alta = date("Y-m-d H:m:i");
  $coleccion->id_usuario = $usuario->id;
 
  if ($coleccion->save())
  {
    header("location:index.php?page=admin/coleccion_listar");
  }
  else
  {
    $error = "No se ha podido grabar el coleccion en la base de datos";
    header("location:index.php?page=admin/coleccion_crear&error=$error");
  }
}
else
{
  $error = "Faltan datos para crear un nuevo coleccion";
  header("location:index.php?page=admin/coleccion_crear&error=$error");
}
?>
