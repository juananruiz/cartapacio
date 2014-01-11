<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: autor_crear.php
//---------------------------------------------------------------------------------------------------
// Formulario para dar de alta un nuevo autor
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

if (isset($_REQUEST['id']))
{
  $id = sanitize($_REQUEST['id'], INT);
  $autor = new autor();
  $autor->load("id = $id");
  $smarty->assign('autor', $autor);
  $smarty->assign('_nombre_pagina', 'Nuevo Autor');
}
else
{
  $error = 'Faltan datos para mostrar el recurso solicitado';
  header("location: index.php?page=admin/autor_listar&error=$error");
}
?>
