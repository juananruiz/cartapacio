<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: seccion_listar.php
//---------------------------------------------------------------------------------------------------
// Lista de secciones en la base de datos
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

$seccion = new seccion();
$secciones = $seccion->Find("true");
$smarty->assign('secciones', $secciones);
?>
