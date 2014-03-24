<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_grabar_fichero.php
//--------------------------------------------------------------------------
// Graba los ficheros en el directorio asignado al recurso (via ajax)
//--------------------------------------------------------------------------
require_once("../cascara_core/lib/phpthumb/src/PHPThumb/PHPThumb.php");
require_once("../cascara_core/lib/phpthumb/src/PHPThumb/GD.php");

global $usuario;


// Comprueba que el usuario tiene el rol adecuado 
if ($usuario->id_rol < 4)
{
  $id_recurso = sanitize($_REQUEST['id_recurso'], INT);
  $fichero_form = $_FILES['fichero1'];
  $ruta_relativa = "upload/recurso/$id_recurso/"; 
  $fichero_original = $fichero_form['tmp_name'];
  $fichero_nombre_sano = strtolower(preg_replace('/[^\w\._]+/','',$fichero_form['name']));
  $ruta_absoluta = CC_DIR_BASE . '/' . $ruta_relativa;
  if (!is_file($ruta_absoluta) && !is_dir($ruta_absoluta))
  {
    mkdir($ruta_absoluta);
    chmod($ruta_absoluta, 0744);
  }
  $fichero_final =  $ruta_absoluta . $fichero_nombre_sano;
  $fichero_miniatura =  $ruta_absoluta . '100/' . $fichero_nombre_sano;
  
  if ($tipo_imagen = exif_imagetype($fichero_original))
  {
    $imagen = imagecreatefromstring(file_get_contents($fichero_original));
    if($tipo_imagen == IMAGETYPE_JPEG)
    {
      $exif = exif_read_data($fichero_original);
      if(!empty($exif['Orientation'])) {
        switch($exif['Orientation']) {
          case 8:
            $imagen = imagerotate($imagen,90,0);
            break;
          case 3:
            $imagen = imagerotate($imagen,180,0);
            break;
          case 6:
            $imagen = imagerotate($imagen,-90,0);
            break;
        }
      }
      $subida_correcta = imagejpeg($imagen, $fichero_final);
    }
    else
    {
      $subida_correcta = move_uploaded_file($fichero_original, $fichero_final);
    }
    $thumb = new PHPThumb\GD($fichero_final);
    $thumb->cropFromCenter(100);
    $thumb->save($fichero_miniatura);
  }  
  else
  {
    // Inserta miniatura para ficheros que no son imagen
    if(preg_match('/^.*\.(mpeg|mp4|mov|m4v)$/i', $fichero_final))
    {
      $miniatura = "img/video.png";
    } 
    else if(preg_match('/^.*\.(pdf)$/i', $fichero_final))
    {
      $miniatura = "img/pdf.png";
    } 
    else if(preg_match('/^.*\.(mp3)$/i', $fichero_final))
    {
      $miniatura = "img/pdf.png";
    } 
    else
    {
      $miniatura = $fichero_miniatura;
    }

    $subida_correcta = move_uploaded_file($fichero_original, $fichero_final);
  }

  if($subida_correcta)
  {
    $fichero = new fichero();
    $fichero->url = $ruta_relativa . $fichero_nombre_sano;
    $fichero->titulo = isset($_POST['titulo'])?sanitize($_POST['titulo'],SQL):'';
    $fichero->descripcion = isset($_POST['descripcion'])?sanitize($_POST['descripcion'],SQL):'';
    $fichero->tipo = $fichero_form['type'];
    $fichero->id_recurso = $id_recurso;
    $fichero->miniatura = $miniatura;
    if(isset($_POST['es_imagen_principal']) && $_POST['es_imagen_principal'] == true)
    {
      $fichero->es_imagen_principal = 1;
    }
    else
    {
      $fichero->es_imagen_principal = 0;
    }
    if(isset($_POST['es_publico']) && $_POST['es_publico'] == true)
    {
      $fichero->es_publico = 1;
    }
    else
    {
      $fichero->es_publico = 0;
    }
    $fichero->fecha_alta = date("Y-m-d");
    $fichero->id_persona = $usuario->id;
    $fichero->save();
    $smarty->assign("fichero",$fichero);
    $aviso = "Se ha subido un nuevo fichero al recurso";
    $smarty->assign("aviso", $aviso);
  }
  else
  {
    $error = "No se ha podido subir el archivo a $targetPath";
    $smarty->assign("error", $error);
  }
}
else
{
  $error = "No tiene permisos para subir ficheros al servidor";
  $smarty->assign("error", $error);
}

$plantilla = "recurso_fichero_acordeon.tpl";
