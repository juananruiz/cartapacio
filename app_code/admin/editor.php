<?php
// Hay que ser bueno y declarar todas las variables aquí arriba
global $smarty;
$recurso = new recurso();

// Si se ha dado la orden de grabar procede
if (isset($_REQUEST['graba']) && isset($_REQUEST['recurso_id']))
{
  $recurso_id = sanitize($_REQUEST['recurso_id'], INT);
  $recurso->load("id = $recurso_id");
  foreach($_REQUEST as $nombre => $valor)
  {
    $recurso->$nombre = $valor;
  }
  $recurso->save();
  $smarty->assign('recurso', $recurso); 
  //Llamamos a la plantilla ajax para que solo devuelva el html del visor
  $plantilla = "admin/editor_ajax.tpl";
}
// Si viene el identificador del recurso recupera los datos
// para mostrarlos en el formulario
elseif (isset($_REQUEST['recurso_id']))
{
  $recurso_id = sanitize($_REQUEST['recurso_id'], INT);
  $recurso->load("id = $recurso_id");
}
// Si no viene el identificador del recurso envía uno nuevo en blanco
else
{
  $recurso->nombre = "";
  $recurso->id_tipo = 1; 
  $recurso->fecha_alta = date("Y-m-d H:i:s"); 
  $recurso->save();
}

$smarty->assign('recurso', $recurso);
$nombre_pagina = "Recurso $recurso->id";
$smarty->assign('_nombre_pagina', $nombre_pagina);


