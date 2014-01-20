<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: autor_mostrar.php
//--------------------------------------------------------------------------
// Página monográfica sobre un autor con todos los recursos asociados al mismo
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

if (isset($_GET['id']))
{
  $autor = new autor();

  $id_autor = sanitize($_GET['id'], INT);
  
  if ($autor->rol < 4) 
  {
    $filtro_rol = "true";
  }
  else
  {
    $filtro_rol = "activo = 1";
  }

  if ($autor->load("id = $id_autor AND $filtro_rol"))
  {
    $smarty->assign('autor', $autor);

    if ($autor->rol < 4) 
    {
      $filtro_rol = "id_estado <> 4";
    }
    else
    {
      $filtro_rol = "id_estado = 2";
    }
    
    $recurso = new recurso();
    $recursos = $recurso->Find_joined("id_autor = $id_autor AND $filtro_rol ORDER BY fecha_alta DESC");
    $smarty->assign('recursos', $recursos);
  }
  else
  {
    $error = "No se encuentra ningún autor con el identificador $id_autor";
    header("location:index.php?page=autor_listar&error=$error");
  }
}
else
{
  $error = "Se necesita un identificador para mostrar un autor";
  header("location:index.php?page=autor_listar&error=$error");
}
