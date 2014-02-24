<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_visor_fichero.php
//--------------------------------------------------------------------------
// Permite visualizar los ficheros asociados a un recurso
//--------------------------------------------------------------------------
global $smarty;
global $usuario;
$recurso = new recurso();

if (isset($_REQUEST['id']))
{
  $id = sanitize($_REQUEST['id'], INT);
  if ($recurso->load_joined("id = $id"))
  {
    $smarty->assign("recurso", $recurso);
  }
  else
  {
    $error = "No se encuentra ningún recurso con el identificador $id_recurso";
    header("location:index.php?page=recurso_listar&error=$error");
  }
}
else
{
  $error = "Faltan datos para mostrar un recurso";
  header("location:index.php?page=recurso_listar&error=$error");
}

