<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comerbien
// Archivo: archivo_listar.php
//---------------------------------------------------------------------------------------------------
// Lista el contenido de archivos del directorio indicado y muestra un formulario para 
// subir nuevos archivos
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;
global $usuario;

if (isset($_GET['recurso_id']))
{
    $recurso_id = sanitize($_GET['recurso_id'], INT);
    $ruta_completa = CC_DIR_BASE . '/public/upload/recurso/' . $recurso_id;

    //Creamos el array con los ficheros del directorio
    $directorio = opendir($ruta_completa); 
    while ($archivo = readdir($directorio))
    {
        $fecha = date ("d-m-Y", filemtime($ruta_completa . "/" . $archivo));
        $archivos[] = array($archivo, $fecha);
    }
    closedir($directorio);

    $smarty->assign('archivos',$archivos);
    $smarty->assign('directorio',$recurso_id);
}
else
{
    $error = "No se ha proporcionado un nombre de directorio";
    $smarty->assign('error', $error);
}
$plantilla = "archivo_listar.tpl";
?>
