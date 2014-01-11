<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: class/usuario.php
//--------------------------------------------------------------------------
// Descripcion: gestiona los usuarios
//--------------------------------------------------------------------------
class usuario extends ADOdb_Active_Record
{
	public $_table = 'usuarios';
  public $rol; 

  public function load_joined($condicion)
  {
    if($this->load($condicion))
    {
      $this->rol = new rol();
      $this->rol->load("id = $this->id_rol");
    }
    else
    {
      return false;
    }
  }
}
