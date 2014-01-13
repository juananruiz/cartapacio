<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: ubicacion_mostrar.php
//--------------------------------------------------------------------------
// Página de presentación de una ubicación
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

if (isset($_GET['id_ubicacion']))
{
  $id_ubicacion = sanitize($_GET['id_ubicacion'], INT);
  
  $ubicacion = new ubicacion();
  if ($ubicacion->load("id = $id_ubicacion"))
  {
    $smarty->assign('ubicacion', $ubicacion);

    $recurso = new recurso();
    $recursos = $recurso->Find_joined("id_ubicacion = $id_ubicacion AND id_estado <> 4 ORDER BY fecha_alta DESC");
    $smarty->assign('recursos', $recursos);
  }
  else
  {
    $error = "No se encuentra ninguna ubicación con el identificador $id_ubicacion";
    header("location:index.php?page=ubicacion_listar&error=$error");
  }
}
else
{
  $error = "Se necesita un identificador para mostrar una ubicación";
  header("location:index.php?page=ubicacion_listar&error=$error");
}

