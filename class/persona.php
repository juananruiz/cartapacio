<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: class/persona.php
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona lo relativo a usuarios
//---------------------------------------------------------------------------------------------------
class persona extends ADOdb_Active_Record
{
  //Propiedades de la clase
	public $_table = 'personas';
	public $permiso;

	
	public function permisos_evento($condicion)
	{
		$usuarios = $this->find($condicion);
		foreach($usuarios as $usuario)
		{
			$permiso = new permiso();
			$permisos = $permiso->find_joined("id_aplicacion = 1 AND id_persona = $usuario->id");
			$usuario->permiso = $permisos;
		}
		return $usuarios;
	}
}
?>
