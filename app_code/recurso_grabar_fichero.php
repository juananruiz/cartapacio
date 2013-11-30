<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_grabar_fichero.php
//--------------------------------------------------------------------------
// Graba los ficheros en el directorio asignado al recurso (via ajax)
//--------------------------------------------------------------------------
global $usuario;

// TODO
// Comprueba que el usuario tiene permisos para crear un nuevo recurso

$id_recurso = sanitize($_POST['id_recurso'], INT);
$storeFolder = "public/upload/recurso/$id_recurso/"; 
//TODO: Crear la carpeta si no existe

$tempFile = $_FILES['fichero1']['tmp_name'];
$targetPath = CC_DIR_BASE . $storeFolder;
if (!is_file($targetPath) && !is_dir($targetPath))
{
  mkdir($targetPath);
  chmod($targetPath, 0777);
}
$targetFile =  $targetPath . $_FILES['fichero1']['name'];
if(move_uploaded_file($tempFile, $targetFile))
{
  $aviso = "Operación realizada con éxito";
  $plantilla = "inicio.tpl";
}
else
{
  $error = "No se ha podido subir el archivo";
  $plantilla = "error.tpl";
}
