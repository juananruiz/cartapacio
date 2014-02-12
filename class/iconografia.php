<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: class/iconografia.php
//--------------------------------------------------------------------------
// Descripcion: gestiona los iconografias ('virgen con niño", "inmaculada", 
// "martirio de cristo", etc)
//--------------------------------------------------------------------------
class iconografia extends ADOdb_Active_Record
{
	public $_table = 'iconografias';
  public $usos;

  public function Find_con_usos($condicion)
  {
    if ($iconografias = $this->Find($condicion))  
    {
      foreach ($iconografias as& $iconografia)
      {
        $adodb = $this->DB();
        $query = "SELECT count(id) as usos FROM recursos
                  WHERE id_iconografia = $iconografia->id GROUP BY id_iconografia";
        $resultset = $adodb->Execute($query);
        $iconografia->usos = $resultset->fields['usos'] > 0 ? $resultset->fields['usos'] : 0;
      }
      return $iconografias;
    }
    else
    {
      return false;
    }
  }
}
