<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: usuario_editar.php
//--------------------------------------------------------------------------
// Formulario para editar un usuario
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

if ($usuario->rol == 1)
{
  // Usamos $perfil en lugar de $usuario para no coindicir con el global
  $perfil = new usuario();

  if (isset($_REQUEST['id']))
  {
    $id = sanitize($_REQUEST['id'], INT);
    if ($perfil->load("id = $id"))
    {
      $smarty->assign('perfil', $perfil);
      
      $rol = new rol();
      $roles = $rol->Find("true");
      $smarty->assign('roles', $roles);
    }
    else
    {
      // Si el identificador no existe lanza un error
      $error = "No existe ningún usuario con el identificador $id";
      header("location:index.php?page=admin/usuario_listar&error=$error");
      exit();
    }
  }
  else
  {
    // Si no viene el id lanza un error
    $error = "Falta el identificador del usuario que se desea editar";
    header("location:index.php?page=admin/usuario_listar&error=$error");
  }
}
else
{
  $error = "No tiene permisos para editar usuarios";
  header("location:index.php?page=error&error=$error");
}
