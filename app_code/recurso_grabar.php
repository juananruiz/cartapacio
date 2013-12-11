<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_grabar.php
//--------------------------------------------------------------------------
// Graba los datos del recurso en la base de datos 
//--------------------------------------------------------------------------

global $smarty;
global $usuario;

// Comprueba que el usuario tiene permisos para crear o editar un recurso
// TODO

$recurso = new recurso();
// El id_recurso viene por GET y el campo con su valor por POST
if (isset($_GET["id_recurso"]))
{
  //Cargamos el registro actual en memoria
  $id_recurso = sanitize($_REQUEST['id_recurso'], INT);
  $recurso->load("id = $id_recurso");
  $recurso->fecha_ultima_edicion = date("Y-m-d H:m:i");
  print_r($_POST);
  foreach ($_POST as $campo => $valor)
  {
    $campo = sanitize($campo, PARANOID);
    $valor = sanitize($valor, SQL);
    $recurso->$campo = $valor;
  }

  if ($recurso->save())
  {
    $mensaje = "Se ha grabado el campo $campo con el valor $valor"; 
  }
  else
  {
    $mensaje = "No se ha podido grabar en la base de datos";
  }
}
else
{
  $mensaje = "Se necesita un id_recurso para grabar la información";
}

$smarty->assign('mensaje', $mensaje);
