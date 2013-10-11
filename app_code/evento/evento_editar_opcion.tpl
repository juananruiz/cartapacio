<div class="control-group well well-small">
	<label class="control-label" for="nombre_largo"><h5>Nombre largo<span class="aviso"></span></h5></label>
	<div class="controls">
		<textarea class="textarea span12" data-id_evento="{$evento->id}" id="nombre_largo" name="nombre_largo" placeholder="Nombre largo...">{$evento->nombre_largo}</textarea>
	</div>
</div>
<div class="row-fluid">
		<div class="control-group well well-small span4">
			<label class="control-label" for="usar_fecha_caducidad"><h5>Usar fecha caducidad<span class="aviso"></span></h5></label>
			<div class="controls">
				<input class="onchange" type="checkbox" data-id_evento="{$evento->id}" id="usar_fecha_caducidad" name="usar_fecha_caducidad" value="1" {if $evento->usar_fecha_caducidad == 1}checked{/if}>
			</div>
			<div id="mostrar-fechas" class="row-fluid" style="display:{if $evento->usar_fecha_caducidad == 1}{else}none{/if}">
				<label class="control-label" for="fecha-inicio-"><h5>Fecha inicio<span class="aviso"></span></h5></label>
				<div class="controls">
				{if $evento->fecha_inicio == NULL AND $evento->fecha_inicio == NULL}
					{assign var=lafechainicio value=$smarty.now}
					{assign var=lafechafin value=($smarty.now)+5184000}
				{else}
						{assign var=lafechainicio value=$evento->fecha_inicio }
						{assign var=lafechafin value=$evento->fecha_fin }
				{/if}
				<!-- $smarty.now+5184000 -->
					{html_select_date class="input-mini fecha" id_evento=$evento->id style="font-size:small" field_order='DMY' start_year="-10"  
	end_year="+5" time=$lafechainicio  prefix="fecha-inicio-" month_format='%m'}
				</div>
				<label class="control-label" for="fecha-fin-"><h5>Fecha fín<span class="aviso"></span></h5></label>
				<div class="controls">
					{html_select_date class="input-mini fecha" id_evento=$evento->id style="font-size:small" field_order='DMy' start_year="-10"  
	end_year="+5" time=$lafechafin   prefix="fecha-fin-" month_format='%m'}
				</div>
			</div>
		</div>
		<div class="control-group well well-small span4">
			<label class="control-label" for="id_novedad_intranet"><h5>Publicar en Novedades Intranet<span class="aviso"></span></h5></label>
			<div class="controls">
				<input class="oncheck" type="checkbox" data-id_evento="{$evento->id}" id="id_novedad_intranet" name="id_novedad_intranet" value="1"{if $evento->id_novedad_intranet == 1}checked{/if}>
			</div>
		</div>
		<div class="control-group well well-small span4">
			<label class="control-label" for="id_novedad_unidad"><h5>Publicar en Novedades Unidad<span class="aviso"></span></h5></label>
			<div class="controls">
				<input class="oncheck" type="checkbox" data-id_evento="{$evento->id}" id="id_novedad_unidad" name="id_novedad_unidad" value="1"{if $evento->id_novedad_unidad == 1}checked{/if}>
			</div>
		</div>
</div><!-- row-fluid -->
<div class="control-group well well-small">
	<label class="control-label" for="comentarios"><h5>Comentarios internos que no se publicarán<span class="aviso"></span></h5></label>
		<div class="controls">
			<textarea class="onblur span12" data-id_evento="{$evento->id}" id="comentarios" name="comentarios" placeholder="Comentarios ...">{$evento->comentarios}</textarea>
		</div>
</div>
