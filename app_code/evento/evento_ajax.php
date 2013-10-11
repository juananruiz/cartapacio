<?php
//---------------------------------------------------------------------------------------------
// Aplicación: Cascara / Eventos
//---------------------------------------------------------------------------------------------
// Archivo: evento_ajax.php
//---------------------------------------------------------------------------------------------
// Descripcion: 
//---------------------------------------------------------------------------------------------
$modulo = sanitize($_REQUEST["modulo"],SQL);

$id_evento = sanitize($_REQUEST["id_evento"],INT);
$evento = new evento_evento();
$evento->load("id = $id_evento");
$id_recurso = (!empty($evento->id_recurso)) ? $evento->id_recurso:NULL;

$condicion = ($id_recurso == NULL)? "id_persona = $usuario->id AND id_aplicacion = 1":"id_persona = $usuario->id AND id_aplicacion = 1 AND id_recurso = $id_recurso";

$permiso = new permiso();
if ($permiso->tiene_permiso($condicion))
{
	if ($modulo == 'estado_grabar')
	{
		$id_estado = sanitize($_REQUEST["valor"],INT);
		//Se valida que los campos obligatorios no esten nulos
		//echo $id_estado;
		switch ($id_estado)
		{
			case 1:
				if ($estado->id_recurso != NULL)
				{
					$evento->id_estado = $id_estado;
				}
				else
				{
					$evento->id_estado = 2;//es el estado BORRADOR;
				}
			break;
			default:
				$evento->id_estado = $id_estado;
		}
		$evento->id_estado = $id_estado;
		//Se graba el estado y si es borrador, historial o eliminado se propaga a los subeventos
		if ($evento->save())
		{
			if ($evento->id_estado == 2 OR $evento->id_estado == 3 OR $evento->id_estado == 4)
			{
				$evento->transmitir_estado($id_evento,$evento->id_estado);	
			}
			$aviso = 1;
		}
		else
		{
			$aviso = 0;
		}
	}
	if ($modulo == 'fechas_grabar')
	{
		$usar_fecha_caducidad = sanitize($_REQUEST["usar_fecha"],INT);
		$fecha_inicio = sanitize($_REQUEST["fecha_inicio"],SQL);
		$fecha_fin = sanitize($_REQUEST["fecha_fin"],SQL);
		$evento->usar_fecha_caducidad = $usar_fecha_caducidad;
		$evento->fecha_inicio = $fecha_inicio;
		$evento->fecha_fin = $fecha_fin;
		$aviso = ($evento->save())?1:0;
	}
	if ($modulo == 'campo_grabar')
	{
		$campo = $_REQUEST["campo"];	
		if ($campo == 'contenido' OR $campo == 'nombre_largo' OR $campo == 'comentarios')
		{
			$valor = $_REQUEST["valor"];
		}
		else
		{
			$valor = sanitize($_REQUEST["valor"],SQL);
		}
		$evento->$campo = $valor;
		$evento->$campo = $valor;
		$aviso = ($evento->save())?1:0;
	} 
	if ($modulo == 'listar_fichero')
	{
		if (isset($_REQUEST["retorno"]))
		{
			$retorno =$_REQUEST["retorno"];
			$smarty->assign('retorno', $_REQUEST["retorno"]);
		}

		$fichero = new evento_fichero();
		$condicion = "id_evento = $id_evento";
		$ficheros = $fichero->find_joined($condicion);
		$smarty->assign('ficheros', $ficheros);
		$aviso = ($evento->save())?1:0;
	}
	if ($modulo == 'actualizar_fichero')
	{
		$fichero = new evento_fichero();
		$condicion = "id = ".sanitize($_REQUEST["id"],INT);
		$fichero->load($condicion);
		$valor = sanitize($_REQUEST["valor"],SQL);
		$campo = sanitize($_REQUEST["campo"],SQL);

		$fichero->$campo = $valor;
		$aviso = ($fichero->save())?1:0;
	}
	$smarty->assign('aviso', $aviso);
	$smarty->assign('modulo', $modulo);
	$plantilla = 'evento/evento_ajax.tpl';
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
