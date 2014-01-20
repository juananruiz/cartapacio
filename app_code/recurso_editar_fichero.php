<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_editar_fichero.php
//--------------------------------------------------------------------------
// Formulario para editar un fichero asociado a un recurso
//--------------------------------------------------------------------------
global $smarty;
global $usuario;
$fichero = new fichero();

if ($usuario->id_rol < 4)
{
  if (isset($_REQUEST['id']))
  {
    $id = sanitize($_REQUEST['id'], INT);
    if ($fichero->load("id = $id"))
    {
      $smarty->assign("fichero", $fichero);
    }
  }
}
