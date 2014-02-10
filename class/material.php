<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: class/material.php
//--------------------------------------------------------------------------
// Descripcion: gestiona los materiales
//--------------------------------------------------------------------------
class material extends ADOdb_Active_Record
{
	public $_table = 'materiales';
  public $usos;

  public function Find_con_usos($condicion)
  {
    if ($materiales = $this->Find($condicion))  
    {
      foreach ($materiales as& $material)
      {
        $adodb = $this->DB();
        $query = "SELECT count(id_recurso) as usos FROM materiales_recursos
                  WHERE id_material = $material->id GROUP BY id_material";
        $resultset = $adodb->Execute($query);
        $material->usos = $resultset->fields['usos'] > 0 ? $resultset->fields['usos'] : 0;
      }
      return $materiales;
    }
    else
    {
      return false;
    }
  }
}
