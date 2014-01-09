<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: coleccion_listar.php
//---------------------------------------------------------------------------------------------------
// Lista de colecciones en la base de datos
//---------------------------------------------------------------------------------------------------
global $smarty;
global $coleccion;

$coleccion = new coleccion();
$colecciones = $coleccion->Find("true");
$smarty->assign('colecciones', $colecciones);
?>
