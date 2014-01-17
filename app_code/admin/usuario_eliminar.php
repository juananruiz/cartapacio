<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: usuario_eliminar.php
//--------------------------------------------------------------------------
// Formulario para desacrtivar un usuario
//--------------------------------------------------------------------------
global $usuario;

if ($usuario->id_rol == 1)
{
  // Usamos $perfil en lugar de $usuario para no coindicir con el global
  $perfil = new usuario();

  if (isset($_REQUEST['id']))
  {
    $id = sanitize($_REQUEST['id'], INT);
    if ($perfil->load("id = $id"))
    {
      $perfil->activo = 0;
      $perfil->save();
      $aviso = "Se ha deshabilitado al usuario $perfil->nombre $perfil->apellidos";
      header("location:index.php?page=admin/usuario_listar&aviso=$aviso");
    }
    else
    {
      // Si el identificador no existe lanza un error
      $error = "No existe ningún usuario con el identificador $id";
      header("location:index.php?page=admin/usuario_listar&error=$error");
    }
  }
  else
  {
    // Si no viene el id lanza un error
    $error = "Falta el identificador del usuario que se desea eliminar";
    header("location:index.php?page=admin/usuario_listar&error=$error");
  }
}
else
{
  $error = "No tiene permisos para eliminar usuarios";
  header("location:index.php?page=error&error=$error");
}
