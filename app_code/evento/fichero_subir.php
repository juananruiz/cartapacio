<?php
//---------------------------------------------------------------------------------------------
// Aplicación: evento
//---------------------------------------------------------------------------------------------
// Archivo: eventos_listar.php
//---------------------------------------------------------------------------------------------
// Descripcion: Lista todos los eventos si eres Administrador o los autorizados para un usuairo.
//---------------------------------------------------------------------------------------------
$id_evento = sanitize($_REQUEST["id_evento"],INT);
$id_tipo = sanitize($_REQUEST["id_tipo"],INT);
$descripcion = sanitize($_REQUEST["descripcion_archivo"],SQL);
$max_file = substr(ini_get("upload_max_filesize"), 0, -1)*1024000;

$evento = new evento_evento();
$evento->load("id = $id_evento");
$condicion = "id_persona = $usuario->id AND id_aplicacion = 1";
$permiso = new permiso();
if ($permiso->tiene_permiso($condicion))
{
	if (is_uploaded_file($_FILES['archivo']['tmp_name']) AND isset($id_evento) AND isset($descripcion))
	{
		$dir = CC_DIR_BASE."app_code/evento/uploads/$id_evento/";;
		$dir = ( $id_tipo == 1) ? $dir.'/imagen/':$dir;
		if(!file_exists($dir))
		{
			if (!mkdir($dir, 0755))
			{
			$mensaje = "No se ha podido crear un directorio para este evento";
			$mensaje_tipo = "Error";
			}
		}
		$nombreFichero = limpiaCadena($_FILES['archivo']['name']);
		if ($_FILES["archivo"]["size"] < $max_file)
		{
			$file = new evento_fichero();
			$file->id_evento = $id_evento;
			$file->id_tipo = $id_tipo;
			$file->descripcion = $descripcion;
			$file->id_usuario = $usuario->id;
			$file->estado = 2;
			$file->fecha = date("Y-m-d");
			$file->nombre = $nombreFichero;
			if ($file->save())
			{
				$file->load("id = $file->id");
				$file->nombre = $file->id.'_'.$file->nombre;
				if ($file->save())
				{
					if (!move_uploaded_file($_FILES['archivo']['tmp_name'], $dir.$file->nombre))
					{
						$file->delete();	
						$mensaje = "No se ha podido subir el fichero, se ha borrado los datos en la Base de datos";
						$mensaje_tipo = "Error";
					}
					else
					{
						$mensaje = "Todo correcto";
						$mensaje_tipo = "Aviso";
						header("location:index.php?page=".$_REQUEST["retorno"]."&id=$id_evento&t=ficheros");
					}
				}
				else
				{
					$mensaje = "Se han escrito todos los datos del archivo en la base de datos,";
					$mensaje .= "Pero no se ha subido el archivo.";
					$mensaje_tipo = "Error";
				}
			}
			else
			{
				$mensaje = "No se ha escrito los datos del archivo en la base de datos.";
				$mensaje .= "No se ha subido el archivo.";
				$mensaje_tipo = "Error";
			}
		}
		else
		{
			$mensaje = "El tamaño del archivo ha excedido del tamaño permitido.";
			$mensaje_tipo = "Error";
		}
	}
	else
	{
		$mensaje = "Faltan parámetros para subir el archivo.";
		$mensaje_tipo = "Error";
	}	
}
else
{
	$mensaje = "No tiene permisos para subir archivos en este recurso.";
	$mensaje_tipo = "Error";
	$log = new log();
	$log->anotar(1,$usuario->id,0,$mensaje,0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
}

/*

	$max_file = substr(ini_get("upload_max_filesize"), 0, -1)*1024000;
	$dir = CC_DIR_BASE."app_code/evento/uploads/$id_evento/";
	if (!empty($descripcion) OR !empty($_FILES['file']))
	{
		if(!file_exists($dir))
		{
			if (!mkdir($dir, 0755))
			{
				$mensaje = "No se ha podido crear un directorio para este evento";
				$mensaje_tipo = "Error";
			}
		}
		if ($_FILES["file"]["size"] < $max_file)
		{
			$file = new evento_fichero();
			$file->id_evento = $id_evento;
			$file->descripcion = $descripcion;
			$file->nombre = $nombre;
			$file->id_usuario = $usuario->id;
			$file->estado = 1;
			$file->fecha = date("Y-m-d");
			if ($file->save())
			{
				$id_file = $file->id;
				$nombre = $dir.$id_file.'_'.$nombre;	
				$file = new evento_fichero();
				$file->load("id = $id_file");
				if	(!move_uploaded_file($_FILES["file"]["tmp_name"],$nombre))
				{
					$file->delete();

					$mensaje  = "Se ha grabado el evento, los detalles del archivo pero no ha ";
					$mensaje .= "podido subir el archivo $file->nombre";
					$mensaje_tipo = "Error";
				}
				else
				{
					$file->nombre = $nombre;
					$file->save();

					$mensaje  = "Se ha grabado correctamente todos los datos del archivo. ";
					$mensaje_tipo = "Aviso";
				}
			}
			else
			{
				$mensaje  = "No se ha grabado los datos del archivo ni se ha subido.";
				$mensaje_tipo = "Error";
			}
		}
		else
		{
			$mensaje  = "Tamaño enorme.";
			$mensaje_tipo = "Error";
		}
	}
	else
	{
		$mensaje = "Faltan parámetros para subir el archivo.";
		$mensaje_tipo = "Error";
		$log = new log();
		$log->anotar(1,$usuario->id,0,$mensaje,0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
	}
}
else
{
	$mensaje = "No tiene permisos para subir archivos en este recurso.";
	$mensaje_tipo = "Error";
	$log = new log();
	$log->anotar(1,$usuario->id,0,$mensaje,0,0,sanitize($_SERVER['QUERY_STRING'],SQL),$mensaje,$mensaje_tipo);
}
*/
?>
