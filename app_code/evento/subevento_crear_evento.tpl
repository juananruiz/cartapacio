<div class="row-fluid">
	<div class="well well-small">
		<i class="icon-star  pull-right"></i>
		<div class="control-group">
			<label class="control-label">Unidad / Recurso</label>
			<div class="controls">
				<ul style="list-style:none;">
				{foreach from=$permisos item=permiso}
					{if $permiso.id_unidad != 1}
					<li>
						<a href="javascript:void(0)" class="unidad">
						<i class="icon-align-justify"></i>{$permiso.unidad}</a>
						<ul style="list-style:none;display:">
							{foreach from=$permiso.recursos item=recurso}
							<li><input class="" type="radio" data-id_evento="{$evento->id}" id="id_recurso" name="id_recurso" value="{$recurso.id_recurso}" /> {$recurso.recurso}</li>
							{/foreach}
						</ul>
					</li>
					{/if}
				{/foreach}
			</div>
		</div><!-- fin control-group unidad -->
	</div><!-- fin contenedor unidad -->
	</div><!-- fin row-fluid -->
<div id="nombre_corto_contenido_estado" class="">
	<div class="control-group well well-small ">
		<i class="icon-star  pull-right"></i>
		<label class="control-label" for="nombre_corto">Nombre corto / Título</label>
		<div class="controls">
			<input type="text"  class="span12" id="nombre_corto" name="nombre_corto" value="" placeholder="Nombre corto ...">
		</div>
	</div>
	<div class="control-group well well-small">
		<i class="icon-star  pull-right"></i>
		<label class="control-label" for="contenido">Contenido</label>
		<div class="controls">
			<textarea rows="6" class="span11" id="contenido" name="contenido" placeholder="Contenido ..."></textarea>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6 control-group well well-small">
			<i class="icon-star pull-right"></i>
			<label class="control-label" for="estado">Estado</label>
			<div class="controls">
				<select class="" name="id_estado" id="id_estado">
					<option value="" data-literal-estado="Elegir uno ..." >Elegir uno ...</option>
					<option value="1" data-literal-estado="Publicado" >-Publicado</option>
					<option value="2" data-literal-estado="Borrador" selected="selected" >-Borrador</option>
					<option value="3" data-literal-estado="Historial" >-Historial</option>
					<option value="4" data-literal-estado="Eliminado" >-Eliminado</option>
					<!--
					{foreach from=$estados item=estado}
					<option value="{$estado->id}" data-literal-estado="{$estado->estado}">&nbsp;-{$estado->estado}</option>
					{/foreach}
					-->
				</select>
			</div>
		</div>
		<div class="span6 control-group well well-small">
			<i class="icon-star pull-right"></i>
			<label class="control-label" for="estado">Ámbito</label>
			<div class="controls">
				<select class="" name="id_publico" id="id_publico">
					<option value="">Elegir uno ...</option>
					<option value="1" data-literal-ambito="Público"> &nbsp;-Público</option>
					<option value="0" data-literal-ambito="Intranet" selected="selected"> &nbsp;-Intranet</option>
				</select>
			</div>
		</div>
	</div>
	<a href="#ficheros" class="btn atajos"><i class="icon-file"></i> Añadir Ficheros</a>
	<a href="#meta" class="btn atajos" ><i class="icon-comment"></i> Opciones ...</a>
</div><!-- fin div nombre_corto_contenido_estad -->
