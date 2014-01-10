<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: usuario_grabar.php
//--------------------------------------------------------------------------
// Graba los datos de un perfil de usuario en la base de datos 
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
    $perfil->nombre = sanitize($_POST['nombre'], SQL);
    $perfil->apellidos = sanitize($_POST['apellidos'], SQL);
    $perfil->correo = sanitize($_POST['correo'], SQL);
    $perfil->id_rol = sanitize($_POST['id_rol'], INT);
    if (isset($_POST['clave']))
    {
      $perfil->clave = md5($_POST['clave']);
    }

    if ($perfil->save())
    {
      $mensaje = "index.php?page=admin/usuario_listar&aviso=Se ha modificado el usuario correctamente"; 
    }
    else
    {
      $mensaje = "No se ha podido grabar en la base de datos";
    }
  }
  else
  {
    $mensaje = "No se encuentra ningún usuario con este identificador";
  }
}
else
{
  $mensaje = "Se necesita un identificador de usuario para grabar la información";
}

$smarty->assign('mensaje', $mensaje);
