<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_listar.php
//--------------------------------------------------------------------------
// Lista de recursos en la base de datos
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

$recurso = new recurso();

// Estados posibles de los recursos
// 1 - Borrador
// 2 - Publicado
// 3 - Restringido
// 4 - Eliminado

// Los administradores e investigadores ven todos los recursos
if ($usuario->id_rol < 3)
{
  $condicion = "true ORDER BY fecha_alta DESC";
}
// Los colaboradores ven tambien los borradores y restringidos
else if ($usuario->id_rol == 2)
{
  $condicion = "id_estado <> 4 ORDER BY fecha_alta DESC";
}
// Invitados y anónimos solo ven los publicados
else
{
  $condicion = "id_estado = 2";
}

$recursos = $recurso->Find_joined($condicion);
$smarty->assign('recursos', $recursos);
