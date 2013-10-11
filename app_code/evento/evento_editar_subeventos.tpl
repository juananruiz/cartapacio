<div class="row" style="margin-bottom:20px">
<a href="index.php?page=evento/subevento_crear_intermedia&id_padre={$evento->id}&retorno={$smarty.get.page}" class="btn pull-right btn-mini"><i class="icon-plus-sign"></i> Subevento</a>
</div>
{if $subeventos|@count >= 1}
<table id="no-more-tables" class="table table-striped">
	<thead>
		<tr><th></th><th>Fecha</th><th>Subevento</th></tr>
	</thead>
	<tbody id="listado_eventos">
		{foreach from=$subeventos item=subevento}
			<tr class="even">
				<td class="span1">
			<a href="index.php?page=evento/subevento_editar&id={$subevento->id}&retorno={$smarty.get.page}"><i class="icon-pencil"></i></a>
				</td>
				<td class="responsive_destacado span1">{$subevento->fecha_entrada|date_format:"%d-%m-%Y"}</td>
			<td class="">
			{$subevento->nombre_corto}
			<div class="responsive_oculto">{$subevento->contenido|truncate:200:"..."}</div>
			</td>
			</tr>
		{/foreach}
	</tbody>
</table>
{else}
<div class="alert alert-aviso">
	<h4>Aviso</h4>No existen subeventos.
</div>
{/if}

