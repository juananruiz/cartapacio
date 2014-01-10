<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: usuario_cambiar_clave.php
//--------------------------------------------------------------------------
// Cambia la clave de un usuario
//------------------------------------------------------------

global $smarty;
global $usuario;
// Comprueba que el usuario tiene permisos para crear o editar un perfil
// TODO

$perfil = new usuario();
if (isset($_REQUEST["registro_id"]))
{
  //Cargamos el registro actual en memoria
  $registro_id = sanitize($_REQUEST['registro_id'], INT);
  if ($perfil->load("id = $registro_id"))
  {
    if (isset($_POST['clave']))
    {
      $perfil->clave = md5($_POST['clave']);
    }

    if ($perfil->save())
    {
      $mensaje = "index.php?page=admin/usuario_listar&aviso=Se ha modificado la clave correctamente"; 
    }
    else
    {
      $mensaje = "No se ha podido cambiar la clave";
    }
  }
  else
  {
    $mensaje = "No se encuentra ningún usuario con este identificador";
  }
}
else
{
  $mensaje = "Se necesita un identificador de usuario para cambiar la clave";
}

$smarty->assign('mensaje', $mensaje);

