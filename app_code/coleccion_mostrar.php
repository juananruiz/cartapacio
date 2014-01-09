<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: coleccion_mostrar.php
//--------------------------------------------------------------------------
// Lista de recursos de una coleccion
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

if (isset($_GET['id_coleccion']))
{
  $id_coleccion = sanitize($_GET['id_coleccion'], INT);
  
  $coleccion = new coleccion();
  $coleccion->load("id = $id_coleccion");
  $smarty->assign('coleccion', $coleccion);

  $recurso = new recurso();
  $recursos = $recurso->Find_joined("id_coleccion = $id_coleccion AND id_estado <> 4 ORDER BY fecha_alta DESC");
  $smarty->assign('recursos', $recursos);
}
else
{
  $error = "Se necesita un identificador para mostrar una colección";
}
