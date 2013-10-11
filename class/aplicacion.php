<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet
// Archivo: class/usuario.php
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona los usuarios de la aplicación
//---------------------------------------------------------------------------------------------------
class aplicacion extends ADOdb_Active_Record
{
  //Propiedades de la clase
	public $_table = 'AA_aplicaciones';
	public $recursos_usuario;

	public function permisos_app($id_usuario)
	{
		$apps = $this->find("estado = 1");
		
		foreach($apps as $app)
		{
			$permiso = new permiso();
			$permisos = $permiso->find("id_aplicacion = $app->id");
			$app->recursos_usuario = $permisos;
		}
		return $apps;
	}

  public function Find_joined($condicion)
  {
    // Pendiente implementar
    return true;
  }
}
?>
