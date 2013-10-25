<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_mostrar.php
//---------------------------------------------------------------------------------------------------
// Muestra la ficha pública de un recurso
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
$recurso = new recurso();

if (isset($_GET['id_recurso']))
{
  if ($recurso->load_joined("id = $id_recurso"))
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

?>
