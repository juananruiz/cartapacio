<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Comunica - Intranet
// Archivo: clase/log.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: registra la actividad de los usuarios en la intranet
//---------------------------------------------------------------------------------------------------

class log extends ADOdb_Active_Record
{
	var $_table = 'AA_logs';

	public function anotar($id_app,$id_usuario,$id_objeto,$objeto,$id_recurso,$id_unidad,$controlador,$mensaje,$mensaje_tipo)
	{
		$this->id_aplicacion = $id_app;
		$this->id_usuario = $id_usuario;
		$this->id_objeto = $id_objeto;
		$this->objeto = $objeto;
		$this->id_unidad = $id_unidad;
		$this->id_recurso = $id_recurso;
		$this->controlador = $controlador;
		$this->mensaje = $mensaje;
		$this->mensaje_tipo = $mensaje_tipo;
		$this->fecha = date("Y-m-d H:i:s");
		$this->save();
	}
}

?>
