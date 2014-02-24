<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: iconografia_buscar.php
//--------------------------------------------------------------------------
// Devuelve las iconografias encontradas en función de una cadena
//--------------------------------------------------------------------------

if ($_REQUEST['busqueda'])
{
  $busqueda = sanitize($_REQUEST['busqueda'], SQL);
  $iconografia = new iconografia();
  if ($iconografias = $iconografia->find("nombre LIKE '%$busqueda%'"))
  {
    $smarty->assign("iconografias", $iconografias);
  }
}
