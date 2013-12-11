<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: class/fichero.php
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona los ficheros asociados a un recurso
// TAmbién puede haber ficheros sin asociar a recursos pero todavía no ha aparecido ninguno
//---------------------------------------------------------------------------------------------------
class fichero extends ADOdb_Active_Record
{
	public $_table = 'ficheros';
  public $recurso;
  public $estado;
  public $persona;
  
  
  public function load_joined($condicion)
  {
    if ($this->load($condicion))
    {
      $this->persona = new persona();
      $this->persona->load("id = $this->id_persona");
      $this->estado = new estado();
      $this->estado->load("id = $recurso->id_estado");
      if ($this->recurso)
      {
        $this->recurso = new recurso();
        $this->recurso->load("id = $this->id_recurso");
      }
      return $this;
    }
    else
    {
      return false;
    }
  }

}
?>
