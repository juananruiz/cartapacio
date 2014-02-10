<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: class/material_recurso.php
//--------------------------------------------------------------------------
// Descripcion: gestiona los materiales asociados a los recursos
//--------------------------------------------------------------------------
class material_recurso extends ADOdb_Active_Record
{
	public $_table = 'materiales_recursos';
  public $material;

  public function Find_with_materiales($condicion)
  {
    if ($materiales_recursos = $this->Find($condicion))
    {  
      foreach($materiales_recursos as& $material_recurso)
      {
        $material_recurso->material = new material;
        $material_recurso->material->load("id = $material_recurso->id_material");
      }
      return $materiales_recursos;
    }
    else 
    {
      return false;
    }
  }

  public function Delete_many($condicion)
  {
    $adodb = $this->DB();
    $query = "DELETE FROM materiales_recursos WHERE $condicion";
    if ($adodb->Execute($query))
    {
      return true;
    }
    else
    {
      return false;
    }
  }

}
