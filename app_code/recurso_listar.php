<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_listar.php
//---------------------------------------------------------------------------------------------------
// Lista de recursos en la base de datos
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;

$recurso = new recurso();
$recursos = $recurso->Find_joined("id_estado <> 4 ORDER BY fecha_alta DESC");
$smarty->assign('recursos', $recursos);
?>
