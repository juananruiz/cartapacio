<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: material_crear.php
//--------------------------------------------------------------------------
// Crea un nuevo material en la aplicación 
//--------------------------------------------------------------------------
global $usuario;

if ($usuario->id_rol == 1)
{
	$material = new material();
  if ($material->save())
  {
    header("location:index.php?page=admin/material_editar&id=$material->id");
    exit();
  }
  else
  {
    $error = "No se ha podido crear el material por error de la base de datos";
    header("location:index.php?page=error&error=$error");
  }
}
else
{
  $error = "No tiene permisos para crear materiales";
  header("location:index.php?page=error&error=$error");
}
