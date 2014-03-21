<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: class/estilo.php
//--------------------------------------------------------------------------
// Descripcion: gestiona los estilos ('barroco', 'neoclásico', 'plateresco', etc)
//--------------------------------------------------------------------------
class estilo extends ADOdb_Active_Record
{
	public $_table = 'estilos';
  public $usos;

  public function Find_con_usos($condicion)
  {
    if ($estilos = $this->Find($condicion))  
    {
      foreach ($estilos as& $estilo)
      {
        $adodb = $this->DB();
        $query = "SELECT count(id) as usos FROM recursos WHERE id_estilo = $estilo->id GROUP BY id_estilo";
        $resultset = $adodb->Execute($query);
        $estilo->usos = $resultset->fields['usos'] > 0 ? $resultset->fields['usos'] : 0;
      }
      return $estilos;
    }
    else
    {
      return false;
    }
  }
}
