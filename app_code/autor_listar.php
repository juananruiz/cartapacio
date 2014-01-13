<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: autor_listar.php
//---------------------------------------------------------------------------------------------------
// Lista de autores en la base de datos
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

$autor = new autor();
$autores = $autor->Find("true");
$smarty->assign('autores', $autores);
?>
