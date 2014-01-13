<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_borrar.php
//--------------------------------------------------------------------------
// Marca un recurso como eliminado pero no lo borra de la base de datos
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

// Comprueba que el usuario tiene permisos para editar un recurso
// TODO

if (isset($_REQUEST["id"]))
{
  $recurso = new recurso();
  $id = sanitize($_REQUEST["id"], INT);
  if ($recurso->load("id = $id"))
  {
    $recurso->id_estado = 4;
    $recurso->save();
    $aviso = "Se ha marcado como eliminado el recurso '$recurso->nombre'";
    header("location:index.php?page=recurso_listar&aviso=$aviso");
  }
  else
  { 
    $error = "No existe ningún recurso con el identificador $id";
    header("location:index.php?page=recurso_listar&error=$error");
  }
}
else
{ 
  $error = "No se ha especificado el identificador del recurso a eliminar";
  header("location:index.php?page=recurso_listar&error=$error");
}

