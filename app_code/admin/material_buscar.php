<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: material_buscar.php
//--------------------------------------------------------------------------
// Devuelve los materiales encontrados en función de una cadena
//--------------------------------------------------------------------------

if ($_REQUEST['q'])
{
  $busqueda = sanitize($_REQUEST['q'], SQL);
  $material = new material();
  if ($materiales = $material->find("nombre LIKE '%$busqueda%'"))
  {
    $smarty->assign("materiales", $materiales);
  }
}
