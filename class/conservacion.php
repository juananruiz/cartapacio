<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Cartapacio
// Archivo: class/conservacion.php
//---------------------------------------------------------------------------------------------------
// Descripcion: gestiona el estado de conservacion del recurso: Bueno, Regular, ...
//---------------------------------------------------------------------------------------------------
class conservacion extends ADOdb_Active_Record
{
	public $_table = 'conservacion_estados';
}
