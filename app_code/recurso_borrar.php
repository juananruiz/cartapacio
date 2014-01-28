<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_borrar.php
//--------------------------------------------------------------------------
// Marca un recurso como eliminado pero no lo borra de la base de datos
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

if ($usuario->id_rol < 3)
{
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
}
else
{ 
  $error = "No tiene permisos suficientes para borrar un recurso";
  header("location:index.php?page=recurso_listar&error=$error");
}
