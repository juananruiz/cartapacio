<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: estilo_crear.php
//--------------------------------------------------------------------------
// Crea un nuevo estilo en la aplicación 
//--------------------------------------------------------------------------
global $usuario;
global $plantilla;

if ($usuario->id_rol == 1)
{
	$estilo = new estilo();
  $estilo->activo = 1;
  if ($estilo->save())
  {
    $smarty->assign("estilo", $estilo);
    $plantilla="admin/estilo_crear.tpl";
  }
  else
  {
    $error = "No se ha podido crear el estilo por error de la base de datos";
    $smarty->assign("error", $error);
  }
}
else
{
  $error = "No tiene permisos para crear estilos";
  $smarty->assign("error", $error);
}
