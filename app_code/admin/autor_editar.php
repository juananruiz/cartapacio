<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: autor_editar.php
//--------------------------------------------------------------------------
// Formulario para editar los datos de un autor
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

if (isset($_REQUEST['id']))
{
  $id = sanitize($_REQUEST['id'], INT);
  $autor = new autor();
  $autor->load("id = $id");
  $smarty->assign('autor', $autor);
  $smarty->assign('_nombre_pagina', 'Editar Autor');
}
else
{
  $error = 'Se necesita el id del autor para poder editarlo';
  header("location: index.php?page=admin/autor_listar&error=$error");
}
?>
