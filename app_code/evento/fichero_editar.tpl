<form class="form">
<div class="falso-modal">
	<div class="falso-modal-header">
		<h6>Gestión de Eventos <i class="icon-chevron-right"></i> Editar fichero <i class="icon-chevron-right"></i>{$fichero->id}</h6>
	</div>
	<div class="falso-modal-body">

	<div class="row-fluid">
		<div class="control-group well well-small span8">
			<i class="icon-star  pull-right"></i>
			<label class="control-label" for="descripcion"><h5>Descripción<span class="aviso"></span></h5></label>
			<div class="controls">
				<input type="text"  class="span12 descripcion_archivo" data-id_fichero="{$fichero->id}" data-id_evento="{$fichero->id_evento}" id="descripcion" name="descripcion" value="{$fichero->descripcion}">
			</div>
		</div> 
		<div class="control-group well well-small span4">
			<i class="icon-star  pull-right"></i>
			<label class="control-label" for="id_estado"><h5>Estado<span class="aviso"></span></h5></label>
			<div class="controls">
				<select class="id_estado_archivo"  data-id_fichero="{$fichero->id}" data-id_evento="{$fichero->id_evento}" name="id_estado" id="id_estado">
					{foreach from=$estados item=estado}
					<option value="{$estado->id}" {if $estado->id == $fichero->id_estado}selected="selected"{/if}>-{$estado->estado}</option>
					{/foreach}
				</select>
			</div>
		</div>

		</div>
		<!-- -->
		<div class="control-group well well-small ">
			<label class="control-label" for="evento"><h5>Evento</h5></label>
			<div class="controls">
			{$evento->nombre_corto}
			</div>
		</div>
		<!-- -->
		<div class="control-group well well-small">
			<label class="control-label" for="id_estado"><h5>Nombre del fichero</h5></label>
			<div class="controls">
			{$fichero->nombre}	
			</div>
		</div>
			<!-- -->
		<div class="control-group well well-small">
			<label class="control-label" for="id_estado"><h5>Fecha</h5></label>
			<div class="controls">
				{$fichero->fecha}	
			</div>
		</div>
	<!-- fin falso-modal-body -->
	</div>
		<div class="falso-modal-footer">
			<span class="pull-left"><i class="icon-star"></i> Campos obligatorios</span>
			<a href="index.php?page={$smarty.get.retorno}&id={$fichero->id_evento}{if $smarty.get.retorno == 'evento/evento_editar' OR $smarty.get.retorno == 'evento/subevento_editar'}&t=ficheros{/if}" class="btn btn-primary"> Grabar y salir</a>
		</div>
</div>
</form>
<script>
$('.form').on('submit',function(e){
	e.preventDefault();
});
</script>
