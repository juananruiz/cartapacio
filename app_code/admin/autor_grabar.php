<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: autor_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba un nuevo autor en la base de datos 
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

// Comprueba que el usuario tiene permisos para crear un nuevo autor
// TODO

if (isset($_REQUEST['nombre']))
{
  $autor = new autor();
  $autor->nombre = sanitize($_REQUEST['nombre'], SQL);
  $autor->apellidos = isset($_REQUEST['apellidos'])?sanitize($_REQUEST['apellidos'], SQL):NULL;
  $autor->fecha_nacimiento = isset($_REQUEST['fecha_nacimiento'])?sanitize($_REQUEST['fecha_nacimiento'], SQL):NULL;
  $autor->descripcion = isset($_REQUEST['descripcion'])?sanitize($_REQUEST['descripcion'], SQL):NULL;
  $autor->notas = isset($_REQUEST['notas'])?sanitize($_REQUEST['notas'], SQL):NULL;

  // Estos no vienen del formulario
  $autor->fecha_alta = date("Y-m-d H:m:i");
  $autor->id_usuario = $usuario->id;
 
  if ($autor->save())
  {
    header("location:index.php?page=admin/autor_listar");
  }
  else
  {
    $error = "No se ha podido grabar el autor en la base de datos";
    header("location:index.php?page=admin/autor_crear&error=$error");
  }
}
else
{
  $error = "Faltan datos para crear un nuevo autor";
  header("location:index.php?page=admin/autor_crear&error=$error");
}
?>
