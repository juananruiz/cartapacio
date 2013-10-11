<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: eventos_listar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Lista todos los eventos si eres Administrador o los autorizados para un usuairo.
//---------------------------------------------------------------------------------------------
$modulo = sanitize($_REQUEST["modulo"],SQL);

$condicion = "id_persona = $usuario->id AND id_aplicacion = 1 AND id_recurso = 1";
$permiso = new permiso();
if ($permiso->tiene_permiso($condicion))
{
	if ($modulo == 'permiso')
	{
		$aviso = 0;
		$id_usuario = sanitize($_REQUEST["id_usuario"],INT);
		$id_recurso = sanitize($_REQUEST["id_recurso"],INT);
		$permiso = new permiso();
		$permiso->load("id_recurso = $id_recurso AND id_persona = $id_usuario AND id_aplicacion = 1");
		if ($permiso->_saved == 1)
		{
			$aviso = ($permiso->delete()) ? 1:2;
		}
		else
		{
			$permiso->id_persona = sanitize($_REQUEST["id_usuario"],INT);
			$permiso->id_recurso = sanitize($_REQUEST["id_recurso"],INT);
			$permiso->id_aplicacion = 1;
			$aviso = ($permiso->save()) ? 3:4;
		}
		$smarty->assign('aviso',$aviso);
	}
	$smarty->assign('modulo',$modulo);
	$plantilla = "evento/admin/evento_ajax.tpl";
}
else
{
	$mensaje = "No tiene permisos para esta aplicación";
  $mensaje_tipo = "Error";
	$log = new log();
	$log->anotar(1,$usuario->id,0,'Listar unidades',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
}
?>
