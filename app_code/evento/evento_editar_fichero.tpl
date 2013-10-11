<div class="row-fluid">
	<div class="span2">
	<!--
		<a class="btn" href="#" data-id_evento="{$evento->id}" id="actualizar" title="Actualizar vista listado"><i class="icon-refresh"></i></a> 
	-->
		<a href="#myModal" role="button" class="btn" data-toggle="modal"> <i class="icon-plus-sign"></i></a>
	</div>
	<div class="span9" id="ficheros_evento">
		{include file="evento/evento_ajax.tpl" modulo="listar_fichero" retorno=$smarty.get.page}	
	</div>
</div>

