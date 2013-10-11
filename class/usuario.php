<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet
// Archivo: class/usuario.php
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona lo relativo a usuarios
//---------------------------------------------------------------------------------------------------
class usuario extends ADOdb_Active_Record
{
  //Propiedades de la clase
	public $_table = 'AA_personas';
	public $unidad;
	public $permiso;

	public function usuario_buscar($condicion)
	{
		$db = $this->DB();
		$sql = "SELECT *
						FROM `AA_personas`
						WHERE (
						nif LIKE '%$condicion%'
						OR apellidos LIKE '%$condicion%'
						OR uvus LIKE '%$condicion%'
						)
						LIMIT 10 ";
		$usuarios = $db->getall($sql);
		return $usuarios;
	}
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
