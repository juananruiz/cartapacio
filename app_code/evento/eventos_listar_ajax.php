<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: evento_listar_ajax.php
//---------------------------------------------------------------------------------------------
// Descripcion: Muestra por ajax los eventos filtrados al listarlos.
//---------------------------------------------------------------------------------------------

$condicion = "id_persona = $usuario->id AND id_aplicacion = 1";
$permiso = new permiso();
if ($permiso->tiene_permiso($condicion))
{
	$termino = sanitize($_REQUEST["termino"],SQL);
	//si busca en actuales (publicado y borrador) o en historiales o eliminados 
	$cadena = '(';
	$ambito_busqueda = sanitize($_REQUEST["ambito_busqueda"],SQL);
	$ambitos = explode(',',$ambito_busqueda);
	$ultimo = end($ambitos);
	foreach($ambitos as $ambito)
	{
		if ("$ambito" == "$ultimo")
		{
			$cadena.= " ee.id_estado = $ambito)";
		}
		else
		{
			$cadena.= " ee.id_estado = $ambito OR ";
		}
	}
	$evento = new evento_evento();
	$condicion = "SELECT ee.nombre_corto AS titulo,ee.* FROM EVENTO_eventos ee 
	LEFT JOIN EVENTO_recursos er ON ee.id_recurso = er.id
	LEFT JOIN EVENTO_unidades eu ON er.id_unidad = eu.id
	WHERE ee.id_padre = 0 
	AND (ee.nombre_corto LIKE '%$termino%' OR er.nombre_corto LIKE '%$termino%' OR eu.nombre_corto LIKE '%$termino%') 
	AND $cadena 
	AND (ee.id_autor =$usuario->id OR ee.id_recurso IN (SELECT id_recurso FROM `AA_permisos` WHERE id_persona = $usuario->id AND id_recurso IS NOT NULL AND id_aplicacion = 1)) ORDER BY ee.id DESC";

	$eventos = $evento->eventos_de_un_usuario($condicion);

	$smarty->assign('eventos', $eventos);
	$plantilla = "evento/eventos_listar_ajax.tpl";
}
else
{
	$mensaje = "No tiene permisos para esta aplicación";
  $mensaje_tipo = "Error";
	header("location:index.php?page=inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
	$log = new log();
	$log->anotar(1,$usuario->id,0,'Listar unidades',0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
}
?>
