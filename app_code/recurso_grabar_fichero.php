<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: recurso_grabar_fichero.php
//--------------------------------------------------------------------------
// Graba los datos de un fichero tras ser editado
//--------------------------------------------------------------------------
global $usuario;

// Comprueba que el usuario tiene el rol adecuado 
if ($usuario->id_rol < 4)
{
  if ($_POST['id'])
  {
    $id = sanitize($_POST['id'], INT);
    $fichero = new fichero();
    $fichero->load("id = $id"); 
    $fichero->titulo = isset($_POST['titulo'])?sanitize($_POST['titulo'],SQL):'';
    $fichero->descripcion = isset($_POST['descripcion'])?sanitize($_POST['descripcion'],SQL):'';
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
    $fichero->save();
    $smarty->assign("fichero",$fichero);
    $aviso = "Se han modicado los datos del fichero";
    $smarty->assign("aviso", $aviso);
    $resultado = "index.php?page=recurso_editar&id={$fichero->id_recurso}";
    $smarty->assign("resultado", $resultado);
  }
  else
  {
    $error = "Falta el identificador del fichero a editar";
    $smarty->assign("error", $error);
  }
}
else
{
  $error = "No tiene permisos para editar ficheros";
  $smarty->assign("error", $error);
}
