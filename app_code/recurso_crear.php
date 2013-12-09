<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_crear.php
//--------------------------------------------------------------------------
// Formulario para dar de alta un nuevo recurso y subir ficheros al mismo
//--------------------------------------------------------------------------
// En desuso porque se está grabando por ajax
//--------------------------------------------------------------------------

header("location:index.php?page=recurso_editar");
exit();

/*
global $smarty;
global $usuario;

$tipo = new tipo();
$tipos = $tipo->Find("activo = 1 ORDER BY nombre");
$smarty->assign('tipos', $tipos);

$coleccion = new coleccion();
$colecciones = $coleccion->Find("activo = 1 ORDER BY nombre");
$smarty->assign('colecciones', $colecciones);

$autor = new autor();
$autores = $autor->Find("activo =  1 ORDER BY nombre");
$smarty->assign('autores', $autores);

$seccion = new seccion();
$secciones = $seccion->Find("activo =  1 ORDER BY nombre");
$smarty->assign('secciones', $secciones);

$estado = new estado();
$estados = $estado->Find("true");
$smarty->assign('estados', $estados);

$smarty->assign('_nombre_pagina', 'Crear Recurso');
*/
