<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: fichero_grabar.php
//--------------------------------------------------------------------------
// Graba los ficheros en el directorio asignado al recurso
//--------------------------------------------------------------------------
global $smarty;
global $usuario;

// Comprueba que el usuario tiene permisos para crear un nuevo recurso
// TODO
$id_recurso = sanitize($_POST['id_recurso'], INT);
$storeFolder = "public/upload/recurso/$idrecurso/"; 
//TODO: Crear la carpeta si no existe
if (isset($_FILES))// && isset($_POST['id_recurso'])) 
{
  $tempFile = $_FILES['file']['tmp_name'];
  $targetPath = CC_DIR_BASE . $storeFolder;
  $targetFile =  $targetPath. $_FILES['file']['name'];
  if(move_uploaded_file($tempFile,$targetFile))
  {
    $aviso = "Operación realizada con éxito";
    header("Location: index.php?page=archivo_listar&dir=$id_recurso&aviso=$aviso");
  }
  else
  {
    $error = "No se ha podido subir el archivo consulte al administrador del sistema";
    header("Location: index.php?page=error&error=$error");
  }
}
else
{
  $error = "Faltan parámetros para subir el archivo";
  header("Location: index.php?page=error&error=$error");
}
