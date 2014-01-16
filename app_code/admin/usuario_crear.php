<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: usuario_crear.php
//--------------------------------------------------------------------------
// Crea un nuevo usuario en la aplicación 
//--------------------------------------------------------------------------
global $usuario;

if ($usuario->rol == 1)
{
	$nuevo_usuario = new usuario();
  $nuevo_usuario->id_padrino = $usuario->id;
  $nuevo_usuario->fecha_alta = date("Y-m-d H:m:i"); 
  $nuevo_usuario->activo = 1;
  if ($nuevo_usuario->save())
  {
    header("location:index.php?page=usuario_editar&id=$nuevo_usuario->id");
    exit();
  }
  else
  {
    $error = "No se ha podido crear el usuario por error de la base de datos";
    header("location:index.php?page=error&error=$error");
  }
}
else
{
  $error = "No tiene permisos para crear usuarios";
  header("location:index.php?page=error&error=$error");
}
