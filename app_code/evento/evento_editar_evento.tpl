{if isset($parametro) AND $parametro == 'evento'}
	<div class="well well-mini">
		<div class="row-fluid">
			<i class="icon-star  pull-right"></i>
			<label class="control-label" for="id_recurso"><h5>Unidad / Recurso <span class="aviso" id="aviso_id_recurso"></span></h5></label>
      {foreach $permisos as $item_permiso}
        {if $item_permiso.id_unidad != 1}
          <div class="">
            <a href="javascript:void(0)" class="unidad"><i class="icon-align-justify"></i>{$item_permiso.unidad}</a> 
            <ul class="unidad-recurso" style="list-style:none;display:{if $permisos|@count >3}none{/if}">
              {foreach from=$item_permiso.recursos item=recurso}
                <li><input class="onselect" type="radio" data-id_evento="{$evento->id}" name="id_recurso" value="{$recurso.id_recurso}" {if $evento->id_recurso == $recurso.id_recurso}checked{/if}/> {$recurso.recurso}</li>
              {/foreach}
            </ul>
          </div>
        {/if}
			{/foreach}
		</div>
	</div>
	<input type="hidden"  id="id_padre" name="id_padre" value="{$evento->id_padre}">
{else}
	<input type="hidden"  id="id_recurso" name="id_recurso" value="{$evento_padre->id_recurso}">
	<input type="hidden"  id="id_padre" name="id_padre" value="{$evento_padre->id}">
{/if}
<div id="nombre_corto_contenido_estado" class="">
	<div class="control-group well well-small ">
		<i class="icon-star  pull-right"></i>
		<label class="control-label" for="nombre_corto"><h5>Nombre corto / Título <span class="aviso"></span></h5></label>
		<div class="controls">
			<input type="text"  class="onblur span12" data-id_evento="{$evento->id}" id="nombre_corto" name="nombre_corto" value="{$evento->nombre_corto}" placeholder="Nombre corto ...">
		</div>
	</div>
	<div class="control-group well well-small">
		<i class="icon-star  pull-right"></i>
		<label class="control-label" for="contenido"><h5>Contenido <span class="aviso"></span>
		</h5></label>
		<div class="controls">
			<textarea rows="6" class="span11 textarea" data-id_evento="{$evento->id}" id="contenido" name="contenido" placeholder="Contenido ...">{$evento->contenido}</textarea>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6 control-group well well-small">
			<i class="icon-star pull-right"></i>
			<label class="control-label" for="estado"><h5>Estado <span class="aviso"></span></h5></label>
			<div class="controls">
				<select class="onchange_estado" data-id_evento="{$evento->id}" name="id_estado" id="id_estado">
					<option value="" data-literal-estado="Elegir uno ..." >Elegir uno ...</option>
					{foreach from=$estados item=estado}
					<option value="{$estado->id}" data-literal-estado="{$estado->estado}" {if $evento->id_estado == $estado->id}selected="selected"{/if}>-{$estado->estado}</option>
					{/foreach}
				</select>
			</div>
		</div>
		<div class="span6 control-group well well-small">
			<i class="icon-star pull-right"></i>
			<label class="control-label" for="estado"><h5>Ámbito <span class="aviso"></span></h5></label>
			<div class="controls">
			{if isset($parametro) AND $parametro == 'evento'}
				<select data-id_evento="{$evento->id}" class="onchange" name="id_publico" id="id_publico">
					<option value="1" data-literal-ambito="Público" {if $evento->id_publico == 1}selected="selected"{/if}> &nbsp;-Público</option>
					<option value="0" data-literal-ambito="Intranet" {if $evento->id_publico == 0}selected="selected"{/if}> &nbsp;-Intranet</option>
				</select>
			{else}
				<input type="hidden"  id="id_publico" name="id_publico" value="{$evento_padre->id_publico}">
				{if $evento_padre->id_publico == 1}Público
				{elseif $evento_padre->id_publico == 0}Intranet{/if}
			{/if}
			</div>
		</div>
	</div>
<a href="#ficheros" class="btn atajos"><i class="icon-file"></i> Añadir Ficheros</a>
	<a href="#meta" class="btn atajos" ><i class="icon-comment"></i> Opciones ...</a>
</div>
