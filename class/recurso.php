<?php
//------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: class/recurso.php
//-----------------------------------------------------------------------------
// Descripcion: gestiona los recursos
//----------------------------------------------------------------------------
class recurso extends ADOdb_Active_Record
{
	public $_table = 'recursos';
  public $tipo;
  public $autor;
  public $ubicacion;
  public $coleccion;
  public $estado;
  public $estilo;
  public $iconografia;
  public $conservacion;
  public $ficheros = array();
  public $imagen_principal;
  public $materiales = array();

  public function load_joined($condicion)
  {
    if ($this->load($condicion))
    {
      $this->tipo = new tipo();
      $this->tipo->load("id = $this->id_tipo");
      $this->autor = new autor();
      $this->autor->load("id = $this->id_autor");
      $this->ubicacion = new ubicacion();
      $this->ubicacion->load("id = $this->id_ubicacion");
      $this->coleccion = new coleccion();
      $this->coleccion->load("id = $this->id_coleccion");
      $this->estado = new estado();
      $this->estado->load("id = $this->id_estado");
      $this->conservacion = new conservacion();
      $this->conservacion->load("id = $this->id_conservacion");
      if ($this->id_estilo > 0)
      {
        $this->estilo = new estilo();
        $this->estilo->load("id = $this->id_estilo");
      }
      if ($this->id_iconografia > 0)
      {
        $this->iconografia = new iconografia();
        $this->iconografia->load("id = $this->id_iconografia");
      }
      $fichero = new fichero();
      $this->ficheros = $fichero->Find("id_recurso = $this->id");
      $this->imagen_principal = new fichero();
      $this->imagen_principal->load("id_recurso = $this->id AND es_imagen_principal = 1");
      $material_recurso = new material_recurso();
      $this->materiales = $material_recurso->Find_with_materiales("id_recurso = $this->id ORDER BY es_principal DESC");
      return $this;
    }
    else
    {
      return false;
    }
  }

  public function Find_joined($condicion)
  {
    if ($recursos = $this->Find($condicion))
    {
      foreach($recursos as& $recurso)
      {
        $recurso->autor = new autor();
        $recurso->autor->load("id = $recurso->id_autor");
        $recurso->ubicacion = new ubicacion();
        $recurso->ubicacion->load("id = $recurso->id_ubicacion");
        $recurso->coleccion = new coleccion();
        $recurso->coleccion->load("id = $recurso->id_coleccion");
        $recurso->estado = new estado();
        $recurso->estado->load("id = $recurso->id_estado");
      }
      return $recursos;
    }
    else
    {
      return false;
    }
  }

}
