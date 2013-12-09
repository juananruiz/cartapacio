<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_borrar.php
//--------------------------------------------------------------------------
// Marca un recurso como eliminado pero no lo borra de la base de datos
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

// Comprueba que el usuario tiene permisos para editar un recurso
// TODO

if (isset($_REQUEST["id_recurso"]))
{
  $recurso = new recurso();
  $id_recurso = sanitize($_REQUEST["id_recurso"], INT);
  $
