<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: autor_borrar.php
//---------------------------------------------------------------------------------------------------
// Controlador para borrar autores. Comprueba que no estén en uso
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

if (isset($_REQUEST['id']))
{
  $id = sanitize($_REQUEST['id'], INT);
  $recurso = new recurso();
  if ($recursos = $recurso->Find("id_autor = $id"))
  {
    $error = "El autor que pretende borrar está asociado a los recursos que se muestran."; 
    $plantilla = "recurso_listar";
    $smarty->assign('error', $error);
    $smarty->assign('recursos', $recursos);
  }
  else
  {
    $autor = new autor();
    if($autor->load("id = $id"))
    {
      $autor->delete();
      $aviso = "Se ha borrado un autor.";
      header("location: index.php?page=admin/autor_listar&aviso=$aviso");
    }
    else
    {
      $error = "No existe el autor que ha intentado eliminar";
      header("location: index.php?page=admin/autor_listar&error=$error");
    }
  }
}
else
{
  $error = "Datos insuficientes para eliminar un autor";
  header("location: index.php?page=admin/autor_listar&error=$error");
}
  

