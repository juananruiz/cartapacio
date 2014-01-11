<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet
// Archivo: class/usuario.php
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona los usuarios de la aplicación
//---------------------------------------------------------------------------------------------------
class permiso extends ADOdb_Active_Record
{
  //Propiedades de la clase
	public $_table = 'AA_permisos';
	public $permiso;
	public $usuario;

	//array de cada unidad con los recursos con permiso para un usuario
	public function arbol_permisos_usuario($condicion)
	{
		$db = $this->DB();
		$permisos = $db->getall($condicion);
		
		foreach($permisos as &$permiso)
		{
			$condicion = "SELECT er.id AS id_recurso,er.nombre AS recurso FROM `AA_permisos` p 
			LEFT JOIN EVENTO_recursos er ON p.id_recurso = er.id
			LEFT JOIN EVENTO_unidades eu ON er.id_unidad = eu.id
			WHERE eu.id =". $permiso['id_unidad'];
			$recursos = $db->getall($condicion);	
			$permiso['recursos'] = $recursos;
		}
	
		return $permisos;
	}

	//Lista  los usuarios de Evento
	public function usuarios_evento()
	{
		$usuarios = $this->find("id_aplicacion = 1 GROUP BY id_persona");
		foreach($usuarios as $usuario)
		{
			$permisos = $this->find("id_persona = $usuario->id_persona AND id_aplicacion = 1");
			foreach($permisos as & $permiso)
			{
				$recurso = new evento_recurso();
				$recurso->load_joined("id = $permiso->id_recurso");

				$permiso->recurso = $recurso;
			}
			$usuario->permiso =	$permisos;

			$user = new usuario();
			$user->load("id = $usuario->id_persona");
			$usuario->usuario = $user;
		}
		return $usuarios;
	}
  
	//funcion generica para comprobar si el usuaario tiene permiso
	public function tiene_permiso($condicion)
	{
		$this->load($condicion);

		if($this->_saved == 1)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

  // Devuelve un array de permisos que cumplan la condición con el objeto aplicacion asociado
  // Se utiliza para cargar las aplicaciones autorizadas al usuario en el menú herramienta
  public function Find_joined($condicion)
  {
    if ($permisos = $this->Find($condicion))
    {
      foreach ($permisos as&  $permiso)
      {
        $permiso->aplicacion = new aplicacion;
        $permiso->aplicacion->load("id = $permiso->id_aplicacion");
      }
      return $permisos;
    }
    return false;
  }
}
?>
