<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_crear.php
//---------------------------------------------------------------------------------------------------
// Formulario para dar de alta un nuevo recurso y subir ficheros al mismo
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

$tipo = new tipo();
$tipos = $tipo->Find("true");
$smarty->assign('tipos', $tipos);

$serie = new serie();
$series = $serie->Find("true");
$smarty->assign('series', $series);

$autor = new autor();
$autores = $autor->Find("true");
$smarty->assign('autores', $autores);

$seccion = new seccion();
$secciones = $seccion->Find("true");
$smarty->assign('secciones', $secciones);

$estado = new estado();
$estados = $estado->Find("true");
$smarty->assign('estados', $estados);

$smarty->assign('_nombre_pagina', 'Nuevo Recurso');
?>
