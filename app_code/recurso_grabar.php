<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba un nuevo recurso en la base de datos y reenvía a un formulario para subir ficheros
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

// Comprueba que el usuario tiene permisos para crear o editar un recurso
// TODO

if (isset($_REQUEST['id_tipo'], $_REQUEST['nombre'], $_REQUEST['id_autor']))
{
  $recurso = new recurso();
  if (isset($_REQUEST["id_recurso"]))
  {
    //Si estamos editando cargamos el registro actual en memoria
    $id_recurso = sanitize($_REQUEST['id_recurso'], INT);
    $recurso->load("id = $id_recurso");
    $recurso->fecha_ultima_edicion = date("Y-m-d H:m:i");
  }
  else
  { 
    //Sólo se graban al crear el recurso
    $recurso->fecha_alta = date("Y-m-d H:m:i");
    $recurso->id_usuario = $usuario->id;
  }
  $recurso->id_tipo = sanitize($_REQUEST['id_tipo'], INT);
  $recurso->nombre = sanitize($_REQUEST['nombre'], SQL);
  $recurso->id_autor = sanitize($_REQUEST['id_autor'], INT);
  $recurso->fecha_original = isset($_REQUEST['fecha_original'])?sanitize($_REQUEST['fecha_original'], SQL):NULL;
  $recurso->descripcion = isset($_REQUEST['descripcion'])?sanitize($_REQUEST['descripcion'], SQL):NULL;
  $recurso->id_seccion = isset($_REQUEST['id_seccion'])?sanitize($_REQUEST['id_seccion'], INT):NULL;
  $recurso->id_coleccion = isset($_REQUEST['id_coleccion'])?sanitize($_REQUEST['id_coleccion'], INT):NULL;
  $recurso->notas = isset($_REQUEST['notas'])?sanitize($_REQUEST['notas'], SQL):NULL;
  $recurso->id_estado = isset($_REQUEST['id_estado'])?sanitize($_REQUEST['id_estado'], INT):NULL;

 
  if ($recurso->save())
  {
    //header("location:index.php?page=ficheros_subir&id_recurso=$recurso->id");
    header("location:index.php?page=recurso_listar");
  }
  else
  {
    $error = "No se ha podido grabar el recurso en la base de datos";
    header("location:index.php?page=recurso_crear&error=$error");
  }
}
else
{
  $error = "Faltan datos para crear un nuevo recurso";
  header("location:index.php?page=recurso_crear&error=$error");
}
?>
