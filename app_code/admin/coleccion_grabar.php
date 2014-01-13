<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: coleccion_grabar.php
//--------------------------------------------------------------------------
// Graba un nuevo coleccion en la base de datos 
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

// Comprueba que el usuario tiene permisos para crear un nuevo coleccion
// TODO
if (true)
  $coleccion = new coleccion();

  if (isset($_POST['id']))
  {
    $id = sanitize($_POST['id']);
    $coleccion->load("id = $id");
    $aviso = "Se han modificado correctamente los datos de la colección";
  }
  else
  {
    $coleccion->activo = 1;
    $coleccion->fecha_alta = date("Y-m-d H:m:i");
    $coleccion->id_usuario = $usuario->id;
    $aviso = "Se ha agregado una nueva colección";
  }
  $coleccion->nombre = _REQUEST['nombre'];
  $coleccion->descripcion = isset($_REQUEST['descripcion'])?$_REQUEST['descripcion']:NULL;
  $coleccion->notas = isset($_REQUEST['notas'])?$_REQUEST['notas']:NULL;

 
  if ($coleccion->save())
  {
    header("location:index.php?page=coleccion_listar&aviso=aviso");
  }
  else
  {
    $error = "No se ha podido grabar el coleccion en la base de datos";
    header("location:index.php?page=coleccion_listar&error=$error");
  }
else
{
  $error = "No tiene permisos para crear o editar colecciones en esta aplicación";
  header("location:index.php?page=autor_listar&error=$error");
}
