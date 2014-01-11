<?php
//----------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet 
// Archivo: login_sso.php
//----------------------------------------------------------------------------------
// Controlador que autentica a los usuarios para entrar al sistema usando el SSO de la US 
// Utiliza el dni (nif_sin_letra) para enganchar neustra base de datos con LDAP
//----------------------------------------------------------------------------------
include_once('../../cascara_core/lib/US/OpenSSO/InternalHandler.php');
include_once('../../cascara_core/lib/US/OpenSSO/User.php');

$usuario_sso = new \US\OpenSSO\User(CC_SSO_URL); 
$usuario = new usuario(); //usuario con los datos de nuestra tabla personas
$id_sector = 0; // PAS o PDI

if ($usuario_sso->enforceAuthentication())
{ 
  // Si relaciones tiene más de un valor tenemos que buscar dentro de un array
	if (is_array($usuario_sso->usesrelacion))
  {   
    if (in_array('PAS', $usuario_sso->usesrelacion))
    {   
      $id_sector = 2;
    }
    else if (in_array('PDI', $usuario_sso->usesrelacion))
    {   
      $id_sector = 3;
    }
    // Si el usuario es PAS y PDI nosotros lo consideramos PAS por defecto
	}   
  // Si relaciones tiene un solo valor lo miramos directamente
	else if ($usuario_sso->usesrelacion == 'PAS')
	{ 
    $id_sector = 2;
  }
  else if ($usuario_sso->usesrelacion == 'PDI')
  {
    $id_sector = 3;
  }
  else
  {
    // Prepara mensaje de error
    //ATENCION comprobar si el enlace para reintento funciona
    $mensaje = "El usuario no tiene autorización de acceso a la intranet de Recursos Humanos. Si es empleado de la universidad debe ";
    $mensaje .= "<a href='" . CC_URL_PORTAL . "index.php?page=logout_sso'>acceder con su cuenta personal</a>.";
    $mensaje_tipo = "alert";
    // Graba en el log un inicio de sesión fallido
    $log = new log();
    $log->id_persona = $usuario->id;
    $log->pagina = "login_sso";
    $log->resultado = "error";
    $log->mensaje = substr($mensaje,250);
    $log->fecha = date("Y-m-d H:i:s");
    $log->save();
    // Redirige al portal con el mensaje de error
    header("location:" . CC_URL_PORTAL . "index.php?mensaje=$mensaje&mensaje_tipo=$mensaje_tipo");
    exit;
  }
  
  // Si el usuario ha entrado por sso y es PAS o PDI intentamos cargar desde nuestra base de datos
  // Si no está en nuestra base de datos lo damos de alta usando datos ldap
  if (!$usuario->load("dni_sin_letra = '$usuario_sso->irispersonaluniqueid'"))
  {
    $usuario->id_sector = $id_sector;
    $usuario->dni_sin_letra = $usuario_sso->irispersonaluniqueid;
    $usuario->nombre = $usuario_sso->givenname;
    $usuario->apellidos = $usuario_sso->sn;
  }
  // Actualizamos siempre sus datos desde LDAP
  $usuario->telefono_trabajo = $usuario_sso->telephonenumber;
  $usuario->correo1 = $usuario_sso->irismailmainaddress;
  $usuario->correo2 = $usuario_sso->mail;
  if ($usuario->id_sector == 2)
  {
    $usuario->unidad = $usuario_sso->usesunidadadministrativa;
    $usuario->subunidad = $usuario_sso->subunidad;
  }
  else if ($usuario->id_sector == 3)
  {
    $usuario->centro = $usuario_sso->centro;
    $usuario->departamento = $usuario_sso->departamento;
  }
  //TODO: Habría que comprobar si se graba bien y en caso contrario lanzar aviso
  $usuario->save();
  // Asigna variable de sesión y de smarty
  $_SESSION["usuario"] = $usuario;
  $smarty->assign('_usuario',$usuario);
}
?>
