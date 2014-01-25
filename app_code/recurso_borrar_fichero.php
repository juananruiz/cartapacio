<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_borrar_fichero.php
//--------------------------------------------------------------------------
// Borra un archivo asociado a un recurso (via ajax)
//--------------------------------------------------------------------------
global $usuario;

// Comprueba que el usuario tiene permisos para borrar ficheros
if ($usuario->id_rol < 3)
{
  if (isset($_REQUEST['id']))
  {
    $fichero = new fichero();
    $id = sanitize($_REQUEST['id'],INT);
    $fichero->load("id = $id");
    //Delete the real file
    $ruta_fichero = CC_DIR_BASE . $fichero->url;
    if (is_file($ruta_fichero))
    {
      unlink($ruta_fichero);
    }
    $fichero->delete();

    $resultado = "El fichero $id se ha borrado de la base de datos y del servidor";
  }
  else
  {
    $resultado = "Falta el identificador del archivo";
  }
}
else
{
  $resultado = "No tiene permisos para borrar ficheros";
}

$smarty->assign("resultado", $resultado);
$plantilla = "resultado_ajax.tpl";
