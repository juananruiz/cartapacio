<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_grabar_fichero.php
//--------------------------------------------------------------------------
// Graba los ficheros en el directorio asignado al recurso (via ajax)
//--------------------------------------------------------------------------
global $usuario;

// Comprueba que el usuario tiene permisos para crear un nuevo recurso
if ($usuario->id_rol < 4)
{
  $fichero_form = $_FILES['fichero1'];
  $id_recurso = sanitize($_POST['id_recurso'], INT);
  $titulo = isset($_POST['titulo'])?sanitize($_POST['titulo'],SQL):NULL;
  $descripcion = isset($_POST['descripcion'])?sanitize($_POST['descripcion'],SQL):NULL;
  if(isset($_POST['es_imagen_principal']) && $_POST['es_imagen_principal'] == true)
  {
    $es_imagen_principal = 1;
  }
  else
  {
    $es_imagen_principal = 0;
  }

  if(isset($_POST['es_publico']) && $_POST['es_publico'] == true)
  {
    $es_publico = 1;
  }
  else
  {
    $es_publico = 0;
  }

  $storeFolder = "upload/recurso/$id_recurso/"; 
  $tempFile = $fichero_form['tmp_name'];
  $targetPath = CC_DIR_BASE . '/' . $storeFolder;
  if (!is_file($targetPath) && !is_dir($targetPath))
  {
    mkdir($targetPath);
    chmod($targetPath, 0744);
  }
  $targetFile =  $targetPath . $fichero_form['name'];

  if(move_uploaded_file($tempFile, $targetFile))
  {
    $fichero = new fichero();
    $fichero->url = $storeFolder . $fichero_form['name'];
    $fichero->titulo = $titulo;
    $fichero->descripcion = $descripcion;
    $fichero->id_recurso = $id_recurso;
    $fichero->tipo = $fichero_form['type'];
    $fichero->es_imagen_principal = $es_imagen_principal;
    $fichero->es_publico = $es_publico;
    $fichero->fecha_alta = date("Y-m-d");
    $fichero->id_persona = 8;
    $fichero->save();
    $resultado = "Operación realizada con éxito". print_r($fichero_form);
  }
  else
  {
    $resultado = "No se ha podido subir el archivo a $targetPath";
  }
}
else
{
  $resultado = "No tiene permisos para subir ficheros al servidor";
}

$smarty->assign("resultado", $resultado);
$plantilla = "resultado_ajax.tpl";
