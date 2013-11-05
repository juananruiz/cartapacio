<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_editar.php
//---------------------------------------------------------------------------------------------------
// Formulario para dar editar un nuevo recurso y administrar los ficheros asociados al mismo
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

if (isset($_REQUEST['id_recurso']))
{
  $id_recurso = sanitize($_REQUEST['id_recurso'], INT);
  $recurso = new recurso();
  $recurso->load("id = $id_recurso");
  $smarty->assign('recurso', $recurso);

  $tipo = new tipo();
  $tipos = $tipo->Find("activo = 1 ORDER BY nombre");
  $smarty->assign('tipos', $tipos);

  $coleccion = new coleccion();
  $colecciones = $coleccion->Find("activo = 1 ORDER BY nombre");
  $smarty->assign('colecciones', $colecciones);

  $autor = new autor();
  $autores = $autor->Find("activo =  1 ORDER BY nombre");
  $smarty->assign('autores', $autores);

  $seccion = new seccion();
  $secciones = $seccion->Find("activo =  1 ORDER BY nombre");
  $smarty->assign('secciones', $secciones);

  $estado = new estado();
  $estados = $estado->Find("true");
  $smarty->assign('estados', $estados);

  $smarty->assign('_nombre_pagina', 'Editar Recurso');
}
else
{
  $error = "Datos insuficientes para editar recurso";
  header("location:index.php?page=recurso_listar&error=$error");
}
?>
