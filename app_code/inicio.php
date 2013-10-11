<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet 
// Archivo: inicio.php
//---------------------------------------------------------------------------------------------------
// Portada de la intranet de Recursos Humanos con las últimas noticias publicadas
//---------------------------------------------------------------------------------------------------
global $smarty;

$evento = new evento_evento();
$id_sector = 2;

//$editoriales = $evento->editoriales($id_sector);
//$smarty->assign('editoriales',$editoriales);

$smarty->assign('_nombre_pagina', 'Inicio');
?>
