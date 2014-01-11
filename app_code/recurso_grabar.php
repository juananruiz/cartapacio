<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_grabar.php
//--------------------------------------------------------------------------
// Graba los datos del recurso en la base de datos 
//------------------------------------------------------------

global $smarty;
global $usuario;
// Comprueba que el usuario tiene permisos para editar recursos
// TODO

$recurso = new recurso();
if (isset($_REQUEST["registro_id"]))
{
  //Cargamos el registro actual en memoria
  $registro_id = sanitize($_REQUEST['registro_id'], INT);
  $recurso->load("id = $registro_id");
  $recurso->fecha_ultima_edicion = date("Y-m-d H:m:i");
  foreach ($_POST as $campo => $valor)
  {
    $campo = sanitize($campo, SQL);
    $valor = sanitize($valor, SQL);
    $recurso->$campo = $valor;
  }

  if ($recurso->save())
  {
    $mensaje = "index.php?page=recurso_listar&aviso=Se ha grabado el registro correctamente"; 
  }
  else
  {
    $mensaje = "index.php?page=recurso_listar&error=No se ha grabado el recurso"; 
  }
}
else
{
  $mensaje = "Se necesita un id_recurso para grabar la información";
}

$smarty->assign('mensaje', $mensaje);
