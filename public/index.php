<?php 
//--------------------------------------------------------------------------
// Proyecto Cartapacio
// Archivo: index.php
// Desarrollador: Juanan Ruiz <juanan@us.es>
//--------------------------------------------------------------------------
// Descripcion: Esta es la página que carga a todas las demas en su seno maternal 
//--------------------------------------------------------------------------
// Si necesito ver los errores y warnings
//ini_set('display_errors', '1');
//error_reporting(E_ALL);

include_once('../app_code/app_config.php');
include_once('../cascara_core/lib/adodb5/adodb.inc.php');
include_once('../cascara_core/lib/adodb5/adodb-active-record.inc.php');
include_once('../cascara_core/lib/smarty/Smarty.class.php');
include_once('../cascara_core/function/sanitize.php');
include_once('../cascara_core/function/limpiaCadena.php');

// Carga las clases necesarias automaticamente
spl_autoload_register('__autoload');
function __autoload($class_name) 
{
	if (file_exists('../class/'.$class_name.'.php'))
	{	
		require_once('../class/'.$class_name.'.php');
	}
}

// Variables globales
$smarty = new Smarty();
//$smarty->cache = false; 
$smarty->template_dir = '../app_code'; 
$smarty->compile_dir = '../templates_c'; 
$smarty->config_dir = '../configs'; 
$smarty->cache_dir = '../cache'; 

// Conectamos a los datos con ADODB y ActiveRecord 
$adodb = NewADOConnection('mysql://'.CC_DB_LOGIN.':'.CC_DB_CLAVE.'@'.CC_DB_HOST.'/'.CC_DB_DATABASE);
ADOdb_Active_Record::SetDatabaseAdapter($adodb);
$adodb->EXECUTE("set names utf8");

date_default_timezone_set('Europe/Madrid');

// Crea una sesión con un identificador encriptado para evitar ataques
$session_key = substr(md5(CC_DIR_BASE), 0, 8);
@session_name('CC_SESSID' . $session_key);
@ini_set('url_rewriter.tags', '');
@ini_set('session.use_trans_sid', 0);
if(!@session_id())
{
    @ini_set('url_rewriter.tags', '');
    @ini_set('session.use_trans_sid', 0);
    @session_start();
}

// Carga el usuario desde la sesión o dalo de alta como anónimo
// Para hacer login tendrá que ir al menú
$usuario = new usuario();
if (!isset($_SESSION['usuario']) OR !isset($usuario->id_rol)) 
{
  $usuario->id_rol = 1;
  $_SESSION['usuario'] = $usuario;
}
$usuario = $_SESSION['usuario'];
$smarty->assign('_usuario',$usuario);

if (isset($_GET['page']))
{
  $page = sanitize($_GET['page'],2);
}
else
{
  $page = "inicio";
}

// Definimos $plantilla para que se comporte como variable global
$plantilla = '';

// Carga la página solicitada ($_GET['page']) o la pagina por defecto ('inicio' en nuestro caso)
if(file_exists("../app_code/$page.php"))
{
	require_once("../app_code/$page.php");
}
else if(file_exists("../app_code/$page.tpl"))
{
  $plantilla = "$page.tpl";
}
else if(file_exists("../app_code/$page/inicio.php"))
{
	//para enviar el directorio al breadcrumb
	$smarty->assign('directorio_aplicacion',$page);
	require_once("../app_code/$page/inicio.php");
  $page = "$page/inicio";
  $plantilla = "$page.tpl";
}
else if(file_exists("../app_code/$page/inicio.tpl"))
{
  $plantilla = "$page/inicio.tpl";
}
else
{
	$smarty->assign('error', "Error 404: no encontramos la página ($page) que ha solicitado."); 
  require_once("../app_code/error.php");
}
// Si tras cargar el controlador no tenemos plantilla intentamos cargar por defecto
// una que se llame como el controlador, si no, vamos a error
if ($plantilla == '')
{
  $plantilla = $page . ".tpl";
}

if (!file_exists("../app_code/$plantilla"))
{
  $plantilla = "error404.tpl";
}

// Si ajax está a true pasa del layout
if (isset($_REQUEST['ajax']) AND $_REQUEST['ajax'] == 'true')
{
	$smarty->display("$plantilla");
} 
else
{
	$smarty->assign("plantilla", $plantilla);
 
  // Si hemos llamado a un subdirectorio comprueba si hay que cargar auto_menu
  $smarty->assign("auto_menu", false);
  $subdirectorio_array = explode("/",$page);
  $subdirectorio = array_shift($subdirectorio_array);
  if($subdirectorio)
  {
    if(file_exists("../app_code/$subdirectorio/auto_menu.tpl"))
    {
      $smarty->assign("auto_menu", "$subdirectorio/auto_menu.tpl");
    }
  }
  // Avisos y errores
  if (isset($_GET['aviso']))
  {
    $smarty->assign('aviso', $_GET['aviso']);
  }
  if (isset($_GET['error']))
  {
    $smarty->assign('error', $_GET['error']);
  }
  

	$smarty->display('index.tpl'); 
}
?>
