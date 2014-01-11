<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_crear.php
//--------------------------------------------------------------------------
// Formulario para dar de alta un nuevo recurso
// Crea un nuevo recurso en blanco y redirige a recurso_editar
//--------------------------------------------------------------------------
global $usuario;

// TODO:comprobar permisos

$recurso = new recurso();
$recurso->id_usuario = $usuario->id;
$recurso->fecha_alta = date("Y-m-d H:m:i");
if ($recurso->save())
{
  header("location:index.php?page=recurso_editar&id=$recurso->id");
  exit();
}
else
{
  $error = "No se ha podido crear el recurso";
  header("location:index.php?page=error&error=$error");
}
