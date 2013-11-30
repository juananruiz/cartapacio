<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: fichero_subir.php
//--------------------------------------------------------------------------
// Sube ficheros a un recurso determinado
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

// Comprueba que el usuario tiene permisos para crear un nuevo recurso
// TODO

if (isset($_REQUEST['id_recurso']))
{
  $recurso = new recurso();
  $recurso->load("id = $id_recurso");
  $smarty->assign("recurso", $recurso);
}
?>
