<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_crear.php
//---------------------------------------------------------------------------------------------------
// Formulario para dar de alta un nuevo recurso y subir ficheros al mismo
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

$tipo = new tipo();
$tipos = $tipo->Find("true");
$smarty->assign('tipos', $tipos);

$serie = new serie();
$series = $serie->Find("true");
$smarty->assign('series', $series);

$coleccion = new coleccion();
$colecciones = $coleccion->Find("true");
$smarty->assign('colecciones', $colecciones);

$smarty->assign('_nombre_pagina', 'Nuevo Recurso');
$plantilla = "nuevo_recurso.tpl";
?>

