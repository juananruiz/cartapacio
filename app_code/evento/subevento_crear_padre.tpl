<div class="row-fluid">
	<div class="well well-small">
		<i class="icon-star  pull-right"></i>
		<div class="control-group">
			<label class="control-label resaltado">Unidad / Recurso</label>
			<div class="controls">
			{$evento_padre->unidad->nombre} - {$evento_padre->recurso->nombre_corto}
			</div>
		</div>
	</div>
</div>
<div id="nombre_corto_contenido_estado" class="">
	<div class="control-group well well-small ">
		<i class="icon-star  pull-right"></i>
		<label class="control-label resaltado" for="nombre_corto">Nombre corto / Título</label>
		<div class="controls">
			<a href="index.php?page=evento/evento_mostrar&id={$evento_padre->id}">{$evento_padre->nombre_corto}</a>
		</div>
	</div>
	<div class="control-group well well-small">
		<i class="icon-star  pull-right"></i>
		<label class="control-label resaltado" for="contenido">Contenido</label>
		<div class="controls">
			{$evento_padre->contenido}
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6 control-group well well-small">
			<i class="icon-star pull-right"></i>
			<label class="control-label resaltado" for="estado">Estado</label>
			<div class="controls">
			{foreach from="$estados" item=estado}
				{if $estado->id == $evento_padre->id_estado}{$estado->estado}{/if}
			{/foreach}
			</div>
		</div>
		<div class="span6 control-group well well-small">
			<i class="icon-star pull-right"></i>
			<label class="control-label resaltado" for="estado">Ámbito</label>
			<div class="controls"iº>
				{if $evento_padre->id_publico == 1}Público{elseif $evento_padre->id_publico == 0}Intranet{/if}
			</div>
		</div>
	</div>
</div>
<style>
.resaltado{
	font-weight:bold
}
</style>
