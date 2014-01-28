<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_editar.php
//--------------------------------------------------------------------------
// Formulario para editar o crear un recurso y administrar los ficheros 
// asociados al mismo
//--------------------------------------------------------------------------
global $smarty;
global $usuario;
if ($usuario->id_rol < 4)
{
  $recurso = new recurso();
  $ficheros = array();

  if (isset($_REQUEST['id']))
  {
    $id = sanitize($_REQUEST['id'], INT);
    if ($recurso->load("id = $id"))
    {
      // Buscamos los ficheros asociados a este recurso
      $fichero = new fichero();
      $ficheros = $fichero->Find("id_recurso = $id");
      $smarty->assign('ficheros',$ficheros);

      $smarty->assign('recurso', $recurso);
      $smarty->assign('_nombre_pagina', 'Recurso id ' . $recurso->id);

      $tipo = new tipo();
      $tipos = $tipo->Find("activo = 1 ORDER BY nombre");
      $smarty->assign('tipos', $tipos);

      $coleccion = new coleccion();
      $colecciones = $coleccion->Find("activo = 1 ORDER BY nombre");
      $smarty->assign('colecciones', $colecciones);

      $autor = new autor();
      $autores = $autor->Find("activo =  1 ORDER BY nombre");
      $smarty->assign('autores', $autores);

      $ubicacion = new ubicacion();
      $ubicaciones = $ubicacion->Find("activo =  1 ORDER BY nombre");
      $smarty->assign('ubicaciones', $ubicaciones);

      $estado = new estado();
      $estados = $estado->Find("true");
      $smarty->assign('estados', $estados);
    }
    else
    {
      // Si el identificador no existe lanza un error
      $error = "No existe ningún recurso con el identificador $id";
      header("location:index.php?page=recurso_listar&error=$error");
      exit();
    }
  }
  else
  {
    // Si no viene el id lanza un error
    $error = "Falta el identificador del recurso que se desea editar";
    header("location:index.php?page=recurso_listar&error=$error");
  }
}
else
{ 
  $error = "No tiene permisos suficientes para editar un recurso";
  header("location:index.php?page=recurso_listar&error=$error");
}
