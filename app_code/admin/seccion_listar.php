<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: serie_listar.php
//---------------------------------------------------------------------------------------------------
// Lista de series en la base de datos
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

$serie = new serie();
$seriees = $serie->Find("true");
$smarty->assign('series', $series);
?>

