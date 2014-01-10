<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: ubicacion_listar.php
//---------------------------------------------------------------------------------------------------
// Lista de ubicaciones en la base de datos
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

$ubicacion = new ubicacion();
$ubicaciones = $ubicacion->Find("true");
$smarty->assign('ubicaciones', $ubicaciones);
?>
