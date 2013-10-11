<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet - Cuestor
// Archivo: inicio.php
//---------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
ini_set('memory_limit', '-1');
$permiso = new permiso();
if ($permiso->load("id_aplicacion = 4 AND id_persona = $usuario->id"))
{
	$modulo = $_REQUEST["modulo"];

	$id_cuestionario = sanitize($_REQUEST["id"],INT);
	$envio = new cuestor_envio();
	$condicion = "id_cuestionario = $id_cuestionario";

	if ($modulo == 'respuestas')
	{
		$envios = $envio->find_joined($condicion);
	}
	else
	{
		$envios = $envio->find_envio($condicion);
	}
	//print_r($envios);
	require_once('../../cascara_core/lib/phpExcel/PHPExcel/Writer/Excel5.php');
	require_once('../../cascara_core/lib/phpExcel/PHPExcel/IOFactory.php');
	require_once('../../cascara_core/lib/phpExcel/PHPExcel/RichText.php');
	//array para traducir numeros a letras de las coluimnas, da igual el número de preguntas
  $lettertonum = array();
   $j = 1;
   for ($i='A'; $i!='AAA'; $i++)
   {
     $lettertonum[$j]= $i;
     $j = $j + 1;
   }
//Creamos una instancia de la clase
	$excel= new PHPExcel();
	$excel->setActiveSheetIndex(0);
	$excel->getActiveSheet()->setTitle("Datos de $modulo");  
	switch($modulo)
	{
		case "respuestas":
			//cabecera de la columnas
			$row = 1;
			$col = 3;
			$excel->getActiveSheet()->setCellValue("B1", "Envio");
			foreach($envios[0]['respuestas'] as $envio)
			{
				$excel->getActiveSheet()->setCellValue("'".$lettertonum[$col].$row."'", $envio['orden']);
				$col = $col + 1;
			}
			//datos a exportar
			foreach($envios as $envio)
			{
				$row = $row + 1;
				$col = 3;
				$excel->getActiveSheet()->setCellValue('B'.$row,$envio['id']);
				foreach($envio['respuestas'] as $respuesta)
				{
					$celda = "'".$lettertonum[$col].$row."'";
					if ($respuesta['valor_cerrado'] == 'otro')
					{
						$answer =$respuesta['valor_abierto'];
					}
					else
					{
						$answer =$respuesta['valor_cerrado'];
					}
					//utf8_encode es para no se corte las cadenas de texto por acentos.
					$excel->getActiveSheet()->setCellValue($celda,utf8_encode($answer));
					$col = $col + 1;
				}
			}
			break;
		case "empleados":
			$row = 1;
			//datos a exportar
			foreach($envios as $envio)
			{
				$row = $row + 1;
				$excel->getActiveSheet()->setCellValue("B$row",$envio["nif"]);
				$excel->getActiveSheet()->setCellValue("C$row",$envio["nombre"]);
				$excel->getActiveSheet()->setCellValue("D$row",$envio["apellidos"]);
			}
		break;
	}
	//salida de la exportación
	$excelBinaryWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel5');
	$archivo = CC_DIR_BASE."app_code/cuestor/admin/datos_$modulo.xls"; 
	$excelBinaryWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel5');
	$excelBinaryWriter->save($archivo);

	header("Content-Disposition:attachment;filename=datos_$modulo.xls");
	header("Content-Type:application/vnd.ms-excel");
	header("Content-Transfer-Encoding: binary");
	readfile($archivo);
}
else
{
	$mensaje = "No tiene permiso para esta acción.";
	$mensaje_tipo = "Error";
	header("location: index.php?page=cuestor/inicio&mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
}
?>
