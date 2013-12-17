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
$recurso = new recurso();

if (isset($_REQUEST['id']))
{
  $id = sanitize($_REQUEST['id'], INT);
  if ($recurso->load("id = $id"))
  {
    // Buscamos los archivos en el directorio de este recurso  
    $ruta_completa = CC_DIR_BASE . 'public/upload/recurso/' . $id;
    if (is_dir($ruta_completa))
    {
      $directorio = opendir($ruta_completa);
      while ($archivo = readdir($directorio))
      {
        $fecha = date ("d-m-Y", filemtime($ruta_completa . "/" . $archivo));
        $archivos[] = array($archivo, $fecha);
      }
      closedir($directorio);
      $smarty->assign('archivos',$archivos);
    }
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

$seccion = new seccion();
$secciones = $seccion->Find("activo =  1 ORDER BY nombre");
$smarty->assign('secciones', $secciones);

$estado = new estado();
$estados = $estado->Find("true");
$smarty->assign('estados', $estados);
