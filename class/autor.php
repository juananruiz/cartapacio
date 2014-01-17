<?php
//--------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: class/autor.php
//--------------------------------------------------------------------------
// Descripcion: gestiona los autores de las obras o recursos
//--------------------------------------------------------------------------
class autor extends ADOdb_Active_Record
{
	public $_table = 'autores';
  public $oficio;

  public function load_joined($condicion)
  {
    if ($this->load($condicion))
    {
      $oficio = new oficio();
      $this->oficio->load("id = $this->id_oficio");
      return $this;
    }
    else
    {
      return false;
    }
  }

  public function Find_joined($condicion)
  {
    if ($autores = $this->Find($condicion))
    {
      foreach ($autores as& $autor)
      {
        $autor->oficio = new oficio();
        $autor->oficio->load("id = $autor->id_oficio");
      }
      return $autores;
    }
    else
    {
      return false;
    }
  }
}
