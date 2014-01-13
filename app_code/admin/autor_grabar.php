<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: autor_grabar.php
//--------------------------------------------------------------------------
// Graba un nuevo autor en la base de datos 
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

// TODO
// Comprueba que el usuario tiene permisos para crear un nuevo autor
if (true)
{
  $autor = new autor();

  if (isset($_POST['id']))
  {
    $id = sanitize($_POST['id'], INT);
    $autor->load("id = $id");
    $aviso = "Se han modificado correctamente los datos del autor";
  }
  else
  {
    $autor->activo = 1;
    $autor->fecha_alta = date("Y-m-d H:m:i");
    $autor->id_usuario = 1;
    $aviso = "Se ha agregado un nuevo autor";
  }

  foreach ($_POST as $campo => $valor)
  {
    if (!$valor)
    {
      $valor = NULL;
    }
    $autor->$campo = $valor;
  }

  if ($autor->save())
  {
    header("location:index.php?page=autor_listar&aviso=$aviso");
  }
  else
  {
    $error = "No se ha podido grabar el autor en la base de datos";
    header("location:index.php?page=admin/autor_crear&error=$error");
  }
}
else
{
  $error = "No tiene permisos para crear o editar autores en esta aplicación";
  header("location:index.php?page=autor_listar&error=$error");
}
